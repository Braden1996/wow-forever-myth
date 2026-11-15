--!strict
local OverrideTypes = require("./OverrideTypes")
local ShapeFile = require("./ShapeFile")

type Shape = ShapeFile.Shape
type Parameter = ShapeFile.Parameter

export type Api = {
	key: string,
	module: string,
	name: string,
	method: boolean,
	shape: Shape,
	parameters: { Parameter },
}

export type Wrapper =
	{ kind: "maybe", api: Api }
	| { kind: "record", api: Api }
	| { kind: "result", api: Api, override: OverrideTypes.ResultOverride }
	| { kind: "load", api: Api, override: OverrideTypes.LoadOverride }
	| { kind: "callback", api: Api, override: OverrideTypes.CallbackOverride }

export type Folder = "Api" | "Widgets"
export type Module = { name: string, folder: Folder, wrappers: { Wrapper } }
export type Plan = { modules: { Module }, wrapped: number, skipped: { [string]: number } }

local Plan = {}

Plan.GLOBALS = "Globals"

local function splitKey(key: string, method: boolean): (string, string)
	local separator = if method then ":" else "."
	local at = string.find(key, separator, 1, true)
	if at == nil then
		return Plan.GLOBALS, key
	end
	return string.sub(key, 1, at - 1), string.sub(key, at + 1)
end

local function parametersOf(key: string, shape: Shape): { Parameter }
	local shapes = shape.parameters or {}
	if #shapes ~= 1 then
		error(key .. ": expected one call shape, got " .. #shapes, 0)
	end
	return shapes[1]
end

local function apiOf(key: string, shape: Shape, method: boolean): Api
	local module, name = splitKey(key, method)
	return {
		key = key,
		module = module,
		name = name,
		method = method,
		shape = shape,
		parameters = parametersOf(key, shape),
	}
end

local function add(out: { Wrapper }, wrapper: Wrapper)
	table.insert(out, wrapper)
end

local function wrappersFor(api: Api, overrides: OverrideTypes.Overrides): { Wrapper }
	local key, kind = api.key, api.shape.kind
	local out: { Wrapper } = {}
	local result = overrides.results[key]
	if result then
		add(out, { kind = "result", api = api, override = result })
	elseif kind == "maybe" then
		add(out, { kind = "maybe", api = api })
	elseif kind == "record" then
		add(out, { kind = "record", api = api })
	end
	local load = overrides.loads[key]
	if load then
		add(out, { kind = "load", api = api, override = load })
	end
	local callback = overrides.callbacks[key]
	if callback then
		add(out, { kind = "callback", api = api, override = callback })
	end
	return out
end

local function sortedKeys<V>(t: { [string]: V }): { string }
	local keys = {}
	for key in t do
		table.insert(keys, key)
	end
	table.sort(keys)
	return keys
end

local function isWrappable(kind: ShapeFile.Kind, key: string, overrides: OverrideTypes.Overrides): boolean
	return kind == "maybe" or kind == "record" or overrides.callbacks[key] ~= nil
end

function Plan.build(file: ShapeFile.ShapeFile, overrides: OverrideTypes.Overrides): Plan
	local byModule: { [string]: Module } = {}
	local order: { string } = {}
	local wrapped = 0
	local skipped: { [string]: number } = {}
	local function collect(entries: { [string]: Shape }, method: boolean, folder: Folder)
		for _, key in sortedKeys(entries) do
			local shape = entries[key]
			if not isWrappable(shape.kind, key, overrides) then
				skipped[shape.kind] = (skipped[shape.kind] or 0) + 1
				continue
			end
			local api = apiOf(key, shape, method)
			local id = folder .. "/" .. api.module
			local module = byModule[id]
			if module == nil then
				module = { name = api.module, folder = folder, wrappers = {} }
				byModule[id] = module
				table.insert(order, id)
			end
			for _, wrapper in wrappersFor(api, overrides) do
				table.insert((module :: Module).wrappers, wrapper)
			end
			wrapped += 1
		end
	end
	collect(file.functions, false, "Api")
	collect(file.widgetMethods, true, "Widgets")
	table.sort(order)
	local modules: { Module } = {}
	for _, id in order do
		table.insert(modules, byModule[id])
	end
	return { modules = modules, wrapped = wrapped, skipped = skipped }
end

return Plan
