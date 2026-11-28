--!strict
local fs = require("@lune/fs")
local luau = require("@lune/luau")

local Callbacks = require("../../packages/libraries/luau/pure/generator/src/overrides/Callbacks")
local Fakes = require("../../packages/runtimes/cli/src/support/Fakes")
local Lib = require("../../packages/runtimes/cli/src/support/Lib")
local Loads = require("../../packages/libraries/luau/pure/generator/src/overrides/Loads")
local OverrideTypes = require("../../packages/libraries/luau/pure/generator/src/OverrideTypes")
local Results = require("../../packages/libraries/luau/pure/generator/src/overrides/Results")
local ShapeFile = require("../../packages/libraries/luau/pure/generator/src/ShapeFile")

type Shape = ShapeFile.Shape

local SHAPES = "luau_packages/wow-types/api-shapes.json"
local KEY = 4242

local function sortedKeys<V>(t: { [string]: V }): { string }
	local keys = {}
	for key in t do
		table.insert(keys, key)
	end
	table.sort(keys)
	return keys
end

local function evaluate(expression: string): unknown
	return luau.load("return " .. expression)()
end

local function shapeOf(shapes: ShapeFile.ShapeFile, key: string): Shape
	local shape = ShapeFile.lookup(shapes, key)
	if shape == nil then
		error(key .. " is not in api-shapes.json", 0)
	end
	return shape
end

local function successValue(
	lib: Lib.Lib,
	shape: Shape,
	override: OverrideTypes.ResultOverride,
	values: { unknown }
): unknown
	local record: { [string]: unknown } = {}
	local any = false
	for i, field in shape.results or {} do
		if i > 1 and field.name ~= override.error then
			record[field.name] = if field.nilable then lib.Maybe.of(values[i]) else values[i]
			any = true
		end
	end
	return if any then record else true
end

local function errorIndex(shape: Shape, override: OverrideTypes.ResultOverride): number
	for i, field in shape.results or {} do
		if i > 1 and field.name == override.error then
			return i
		end
	end
	error("no result named " .. override.error, 0)
end

local function testResult(lib: Lib.Lib, t: any, world: any, shapes: ShapeFile.ShapeFile, key: string)
	local override = Results[key]
	local shape = shapeOf(shapes, key)
	local target = Fakes.target(lib, key, ShapeFile.isMethodKey(key))
	local call: Fakes.Call = { received = {}, returns = {}, count = 0 }
	local object = Fakes.install(world, target, call)
	local args = Fakes.arguments(shape)
	t.test(key .. ": a true first result is Ok", function()
		local values = Fakes.values(shape, "v")
		values[1] = true
		call.returns = values
		t.equal(Fakes.invoke(target, "", object, args), lib.Result.ok(successValue(lib, shape, override, values)))
		t.equal(call.received, args, "arguments")
	end)
	t.test(key .. ": a false first result is Err with " .. override.error, function()
		local values = Fakes.values(shape, "v")
		values[1] = false
		call.returns = values
		local index = errorIndex(shape, override)
		t.equal(Fakes.invoke(target, "", object, args), lib.Result.err(values[index]))
	end)
	local fallback = override.fallback
	if fallback then
		t.test(key .. ": a missing " .. override.error .. " is Err with the fallback", function()
			call.returns = { false }
			t.equal(Fakes.invoke(target, "", object, args), lib.Result.err(evaluate(fallback)))
		end)
	end
end

local function loadedValues(shape: Shape): { unknown }
	return Fakes.values(shape, "loaded")
end

local function expectedLoaded(lib: Lib.Lib, shape: Shape, values: { unknown }): unknown
	if shape.kind == "maybe" then
		return values[1]
	end
	local record: { [string]: unknown } = {}
	for i, field in shape.results or {} do
		record[field.name] = if field.nilable then lib.Maybe.of(values[i]) else values[i]
	end
	return record
end

local function installLoad(world: any, override: OverrideTypes.LoadOverride, keyValue: number?): { number }
	local requested: { number } = {}
	world.set(override.request, function(key: number)
		table.insert(requested, key)
	end)
	local keyApi = override.key
	if keyApi then
		world.set(keyApi, function(_: unknown): number?
			return keyValue
		end)
	end
	return requested
end

local function testLoad(lib: Lib.Lib, t: any, world: any, shapes: ShapeFile.ShapeFile, key: string)
	local override = Loads[key]
	local shape = shapeOf(shapes, key)
	local target = Fakes.target(lib, key, false)
	local call: Fakes.Call = { received = {}, returns = {}, count = 0 }
	Fakes.install(world, target, call)
	local args: { unknown } = if override.key then Fakes.arguments(shape) else { KEY }
	local Task = lib.Task
	t.test(key .. ": cached data resolves at once without a request", function()
		local requested = installLoad(world, override, KEY)
		call.returns = loadedValues(shape)
		local task = Fakes.invoke(target, "Async", {}, args)
		t.equal(Task.peek(task), lib.Result.ok(expectedLoaded(lib, shape, call.returns)))
		t.equal(#requested, 0, "requests")
	end)
	t.test(key .. ": missing data is requested and resolves on " .. override.event, function()
		local requested = installLoad(world, override, KEY)
		call.returns = {}
		local first = Fakes.invoke(target, "Async", {}, args)
		local second = Fakes.invoke(target, "Async", {}, args)
		t.equal(requested, { KEY, KEY }, "requests")
		t.truthy(Task.isPending(first), "pending before the event")
		world.fire(override.event, KEY + 1, true)
		t.truthy(Task.isPending(first), "another key's event does not settle it")
		call.returns = loadedValues(shape)
		world.fire(override.event, KEY, true)
		local expected = lib.Result.ok(expectedLoaded(lib, shape, call.returns))
		t.equal(Task.peek(first), expected, "first waiter")
		t.equal(Task.peek(second), expected, "second waiter")
	end)
	t.test(key .. ": a failed load rejects with LoadFailed", function()
		installLoad(world, override, KEY)
		call.returns = {}
		local task = Fakes.invoke(target, "Async", {}, args)
		world.fire(override.event, KEY, false)
		t.equal(Task.peek(task), lib.Result.err({ kind = "LoadFailed", api = key, key = KEY }))
	end)
	if override.key then
		t.test(key .. ": an argument with no key rejects at once", function()
			local requested = installLoad(world, override, nil)
			call.returns = {}
			local task = Fakes.invoke(target, "Async", {}, args)
			t.equal(Task.peek(task), lib.Result.err({ kind = "LoadFailed", api = key }))
			t.equal(#requested, 0, "requests")
		end)
	end
end

local function asCallback(value: any, name: string): (value: unknown) -> ()
	if type(value) ~= "function" then
		error("the wrapper did not pass a function as " .. name, 0)
	end
	return value
end

local function testCallback(lib: Lib.Lib, t: any, world: any, shapes: ShapeFile.ShapeFile, key: string)
	local override = Callbacks[key]
	local shape = shapeOf(shapes, key)
	local target = Fakes.target(lib, key, false)
	t.test(key .. ": the Task resolves when the API calls " .. override.callback, function()
		local captured: { [number]: any } = {}
		world.set(key, function(...: any)
			captured = { ... }
		end)
		local position = 0
		local args: { unknown } = {}
		for i, p in (shape.parameters or { {} })[1] do
			if p.name == override.callback then
				position = i
			else
				table.insert(args, "arg" .. i)
			end
		end
		local task = Fakes.invoke(target, "Async", {}, args)
		t.truthy(lib.Task.isPending(task), "pending before the callback")
		local callback = asCallback(captured[position], override.callback)
		callback(if override.resolves == "nil" then nil else "value")
		local expected: unknown = if override.resolves == "nil" then nil else "value"
		t.equal(lib.Task.peek(task), lib.Result.ok(expected))
	end)
end

local spec: Lib.Spec = function(lib, t, world)
	local shapes = ShapeFile.decode(fs.readFile(SHAPES))
	t.test("C_Timer.After: AfterAsync resolves once the timer fires", function()
		local task = lib.Api.C_Timer.AfterAsync(2)
		world.advance(1)
		t.truthy(lib.Task.isPending(task), "pending at 1s")
		world.advance(1)
		t.equal(lib.Task.peek(task), lib.Result.ok(nil))
	end)
	for _, key in sortedKeys(Results) do
		testResult(lib, t, world, shapes, key)
	end
	for _, key in sortedKeys(Loads) do
		testLoad(lib, t, world, shapes, key)
	end
	for _, key in sortedKeys(Callbacks) do
		testCallback(lib, t, world, shapes, key)
	end
end

return spec
