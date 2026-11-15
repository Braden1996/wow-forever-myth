--!strict
local fs = require("@lune/fs")

local Fakes = require("../support/Fakes")
local Lib = require("../support/Lib")
local Results = require("../../overrides/Results")
local ShapeFile = require("../../generator/ShapeFile")

type Shape = ShapeFile.Shape

local SHAPES = ".deps/wow-forever-luau-types/api-shapes.json"

local function prepend(first: { unknown }, rest: { unknown }): { unknown }
	local out = table.clone(first)
	for _, v in rest do
		table.insert(out, v)
	end
	return out
end

local function expectedRecord(lib: Lib.Lib, shape: Shape, values: { unknown }): { [string]: unknown }
	local record: { [string]: unknown } = {}
	for i, field in shape.results or {} do
		record[field.name] = if field.nilable then lib.Maybe.of(values[i]) else values[i]
	end
	return record
end

local function withNilableCleared(shape: Shape, values: { unknown }): { unknown }
	local out = table.clone(values)
	for i, field in shape.results or {} do
		if field.nilable then
			out[i] = nil
		end
	end
	return out
end

local function checkMaybe(lib: Lib.Lib, t: any, world: any, target: Fakes.Target, shape: Shape)
	local call: Fakes.Call = { received = {}, returns = {}, count = 0 }
	local object = Fakes.install(world, target, call)
	local args = Fakes.arguments(shape)
	call.returns = { "first" }
	t.equal(Fakes.invoke(target, "", object, args), lib.Maybe.just("first"), "present")
	t.equal(call.received, args, "arguments")
	call.returns = {}
	t.same(Fakes.invoke(target, "", object, args), lib.Maybe.nothing(), "absent")
	call.returns = { "first" }
	local reused = Fakes.invoke(target, "Into", prepend({ lib.Maybe.nothing() }, object), args)
	call.returns = { "second" }
	local again = Fakes.invoke(target, "Into", prepend({ reused }, object), args)
	t.same(again, reused, "Into reuses its cell")
	t.equal(again, lib.Maybe.just("second"), "Into refills its cell")
	call.returns = {}
	t.same(Fakes.invoke(target, "Into", prepend({ again }, object), args), lib.Maybe.nothing(), "Into absent")
end

local function unwrap(shape: Shape, value: any): any
	if shape.absent then
		if value.kind ~= "Just" then
			error("expected Just, got " .. tostring(value.kind), 0)
		end
		return value.value
	end
	return value
end

local function allNilable(shape: Shape): boolean
	for _, field in shape.results or {} do
		if not field.nilable then
			return false
		end
	end
	return true
end

local function checkRecord(lib: Lib.Lib, t: any, world: any, target: Fakes.Target, shape: Shape)
	local call: Fakes.Call = { received = {}, returns = {}, count = 0 }
	local object = Fakes.install(world, target, call)
	local args = Fakes.arguments(shape)
	local first = Fakes.values(shape, "a")
	call.returns = first
	local plain = Fakes.invoke(target, "", object, args)
	local record = unwrap(shape, plain)
	t.equal(record, expectedRecord(lib, shape, first), "record")
	t.equal(call.received, args, "arguments")
	local sparse = withNilableCleared(shape, first)
	call.returns = sparse
	local partial = Fakes.invoke(target, "", object, args)
	if shape.absent and allNilable(shape) then
		t.same(partial, lib.Maybe.nothing(), "all nilable results nil is absent")
	else
		t.equal(unwrap(shape, partial), expectedRecord(lib, shape, sparse), "nilable results are Nothing")
	end
	if shape.absent then
		call.returns = {}
		t.same(Fakes.invoke(target, "", object, args), lib.Maybe.nothing(), "absent")
	end
	local second = Fakes.values(shape, "b")
	call.returns = second
	local refilled = Fakes.invoke(target, "Into", prepend({ record }, object), args)
	t.same(unwrap(shape, refilled), record, "Into returns the record it was given")
	t.equal(record, expectedRecord(lib, shape, second), "Into refills the record")
	local cells: { [string]: unknown } = table.clone(record)
	call.returns = Fakes.values(shape, "c")
	local again = Fakes.invoke(target, "Into", prepend({ record }, object), args)
	if shape.absent then
		t.same(again, refilled, "Into reuses its Just")
	end
	for _, field in shape.results or {} do
		if field.nilable then
			t.same(record[field.name], cells[field.name], "Into reuses the cell of " .. field.name)
		end
	end
end

local function isResultOverride(key: string): boolean
	return Results[key] ~= nil
end

local function each(
	entries: { [string]: Shape },
	method: boolean,
	visit: (key: string, shape: Shape, method: boolean) -> ()
)
	local keys = {}
	for key in entries do
		table.insert(keys, key)
	end
	table.sort(keys)
	for _, key in keys do
		visit(key, entries[key], method)
	end
end

local spec: Lib.Spec = function(lib, t, world)
	local shapes = ShapeFile.decode(fs.readFile(SHAPES))
	local function visit(key: string, shape: Shape, method: boolean)
		if (shape.kind ~= "maybe" and shape.kind ~= "record") or isResultOverride(key) then
			return
		end
		t.test(key, function()
			local target = Fakes.target(lib, key, method)
			if shape.kind == "maybe" then
				checkMaybe(lib, t, world, target, shape)
			else
				checkRecord(lib, t, world, target, shape)
			end
		end)
	end
	each(shapes.functions, false, visit)
	each(shapes.widgetMethods, true, visit)
end

return spec
