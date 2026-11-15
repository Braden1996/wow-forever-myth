--!strict
local ShapeFile = require("../../generator/ShapeFile")

type Shape = ShapeFile.Shape

export type Call = { received: { unknown }, returns: { unknown }, count: number }
export type Target = { wrappers: { [string]: any }, name: string, method: boolean, key: string }

local Fakes = {}

function Fakes.arguments(shape: Shape): { unknown }
	local out: { unknown } = {}
	for i, p in (shape.parameters or { {} })[1] do
		table.insert(out, "arg" .. i)
		if p.variadic then
			table.insert(out, "extra")
		end
	end
	return out
end

function Fakes.values(shape: Shape, tag: string): { unknown }
	local out: { unknown } = {}
	for i in shape.results or {} do
		out[i] = tag .. i
	end
	return out
end

function Fakes.raw(call: Call, method: boolean): (...any) -> ...any
	if method then
		return function(_self: unknown, ...: any): ...any
			call.received = { ... }
			call.count += 1
			return table.unpack(call.returns, 1, 32)
		end
	end
	return function(...: any): ...any
		call.received = { ... }
		call.count += 1
		return table.unpack(call.returns, 1, 32)
	end
end

function Fakes.target(lib: { Api: { [string]: any }, Widgets: { [string]: any } }, key: string, method: boolean): Target
	local separator = if method then ":" else "."
	local at = string.find(key, separator, 1, true)
	if at == nil then
		return { wrappers = lib.Api, name = key, method = false, key = key }
	end
	local module, name = string.sub(key, 1, at - 1), string.sub(key, at + 1)
	local folder = if method then lib.Widgets else lib.Api
	return { wrappers = folder[module], name = name, method = method, key = key }
end

function Fakes.install(world: any, target: Target, call: Call): { unknown }
	local raw = Fakes.raw(call, target.method)
	if target.method then
		return { { [target.name] = raw } }
	end
	world.set(target.key, raw)
	return {}
end

function Fakes.invoke(target: Target, suffix: string, prefix: { unknown }, arguments: { unknown }): any
	local all: { unknown } = table.clone(prefix)
	for _, a in arguments do
		table.insert(all, a)
	end
	return target.wrappers[target.name .. suffix](table.unpack(all))
end

return Fakes
