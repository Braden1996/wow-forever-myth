--!strict
local Plan = require("./Plan")
local ShapeFile = require("./ShapeFile")

type Api = Plan.Api
type Wrapper = Plan.Wrapper
type Module = Plan.Module
type Field = ShapeFile.Field
type Parameter = ShapeFile.Parameter

local Render = {}

local RESERVED_PARAMETERS = { reuse = true, object = true, fields = true, deferred = true }
local RESERVED_CALLEES = { Maybe = true, Result = true, Task = true, Reuse = true, Loads = true, Wrappers = true }

local function check(api: Api)
	for _, p in ipairs(api.parameters) do
		if RESERVED_PARAMETERS[p.name] or string.match(p.name, "^r%d+$") then
			error(api.key .. ": the parameter name " .. p.name .. " is reserved by the generated code", 0)
		end
	end
	if RESERVED_CALLEES[api.module] or RESERVED_CALLEES[api.name] then
		error(api.key .. ": its name is reserved by the generated code", 0)
	end
end

local function declaredParameters(api: Api, skip: string?): string
	local parts: { string } = {}
	if api.method then
		table.insert(parts, "object: " .. api.module)
	end
	for _, p in ipairs(api.parameters) do
		if p.name ~= skip then
			table.insert(parts, if p.variadic then "...: " .. p.type else p.name .. ": " .. p.type)
		end
	end
	return table.concat(parts, ", ")
end

local function withReuse(reuseType: string, parameters: string): string
	return if parameters == "" then "reuse: " .. reuseType else "reuse: " .. reuseType .. ", " .. parameters
end

local function arguments(api: Api, replace: { [string]: string }?): string
	local parts: { string } = {}
	for _, p in ipairs(api.parameters) do
		local replacement = if replace then replace[p.name] else nil
		table.insert(parts, replacement or (if p.variadic then "..." else p.name))
	end
	return table.concat(parts, ", ")
end

local function callee(api: Api): string
	if api.method then
		return "object:" .. api.name
	elseif api.module == Plan.GLOBALS then
		return api.name
	end
	return api.module .. "." .. api.name
end

local function call(api: Api, replace: { [string]: string }?): string
	return callee(api) .. "(" .. arguments(api, replace) .. ")"
end

local function results(api: Api): { Field }
	return api.shape.results or {}
end

local function locals(count: number): string
	local names: { string } = {}
	for i = 1, count do
		table.insert(names, "r" .. i)
	end
	return table.concat(names, ", ")
end

local function fieldType(field: Field): string
	return if field.nilable then "Maybe<" .. field.type .. ">" else field.type
end

local function recordType(name: string, fields: { Field }, indices: { number }): { string }
	local lines = { "export type " .. name .. " = {" }
	for _, i in ipairs(indices) do
		table.insert(lines, "\tread " .. fields[i].name .. ": " .. fieldType(fields[i]) .. ",")
	end
	table.insert(lines, "}")
	table.insert(lines, "")
	return lines
end

local function allIndices(fields: { Field }): { number }
	local out: { number } = {}
	for i, _ in ipairs(fields) do
		table.insert(out, i)
	end
	return out
end

local function recordLiteral(fields: { Field }, indices: { number }, indent: string): { string }
	local lines = { "{" }
	for _, i in ipairs(indices) do
		local value = if fields[i].nilable then "Maybe.of(r" .. i .. ")" else "r" .. i
		table.insert(lines, indent .. "\t" .. fields[i].name .. " = " .. value .. ",")
	end
	table.insert(lines, indent .. "}")
	return lines
end

local function absentGuard(fields: { Field }): string
	local required: { string } = {}
	local all: { string } = {}
	for i, field in ipairs(fields) do
		table.insert(all, "r" .. i .. " == nil")
		if not field.nilable then
			table.insert(required, "r" .. i .. " == nil")
		end
	end
	return if #required > 0 then table.concat(required, " or ") else table.concat(all, " and ")
end

local function appendAll(target: { string }, lines: { string })
	for _, line in ipairs(lines) do
		table.insert(target, line)
	end
end

local function maybeWrapper(api: Api): { string }
	local valueType = results(api)[1].type
	local parameters = declaredParameters(api)
	return {
		"function Wrappers." .. api.name .. "(" .. parameters .. "): Maybe<" .. valueType .. ">",
		"\treturn Maybe.of(" .. call(api) .. ")",
		"end",
		"",
		"function Wrappers."
			.. api.name
			.. "Into("
			.. withReuse("Maybe<" .. valueType .. ">", parameters)
			.. "): Maybe<"
			.. valueType
			.. ">",
		"\treturn Reuse.maybe(reuse, " .. call(api) .. ")",
		"end",
		"",
	}
end

local function recordWrapper(api: Api): ({ string }, { string })
	local fields = results(api)
	local typeName = api.name .. "Results"
	local absent = api.shape.absent ~= nil
	local returnType = if absent then "Maybe<" .. typeName .. ">" else typeName
	local parameters = declaredParameters(api)
	local bind = "\tlocal " .. locals(#fields) .. " = " .. call(api)
	local guard = { "\tif " .. absentGuard(fields) .. " then", "\t\treturn Maybe.nothing()", "\tend" }
	local lines = { "function Wrappers." .. api.name .. "(" .. parameters .. "): " .. returnType, bind }
	if absent then
		appendAll(lines, guard)
	end
	local literal = recordLiteral(fields, allIndices(fields), "\t")
	if absent then
		literal[1] = "\treturn Maybe.just({"
		literal[#literal] = "\t})"
	else
		literal[1] = "\treturn {"
	end
	appendAll(lines, literal)
	appendAll(lines, { "end", "" })
	appendAll(lines, {
		"function Wrappers." .. api.name .. "Into(" .. withReuse(typeName, parameters) .. "): " .. returnType,
		bind,
	})
	if absent then
		appendAll(lines, guard)
	end
	table.insert(lines, "\tlocal fields = Reuse.fields(reuse)")
	for i, field in ipairs(fields) do
		if field.nilable then
			table.insert(
				lines,
				"\tfields." .. field.name .. " = Reuse.maybe(fields." .. field.name .. ", r" .. i .. ")"
			)
		else
			table.insert(lines, "\tfields." .. field.name .. " = r" .. i)
		end
	end
	appendAll(lines, { if absent then "\treturn Reuse.just(reuse)" else "\treturn reuse", "end", "" })
	return recordType(typeName, fields, allIndices(fields)), lines
end

local function resultWrapper(api: Api, override: { error: string, fallback: string? }): ({ string }, { string })
	local fields = results(api)
	local errorIndex = 0
	local successIndices: { number } = {}
	for i, field in ipairs(fields) do
		if i > 1 and field.name == override.error then
			errorIndex = i
		elseif i > 1 then
			table.insert(successIndices, i)
		end
	end
	local types: { string } = {}
	local okType = "true"
	local okValue = { "\t\treturn Result.ok(true)" }
	if #successIndices > 0 then
		okType = api.name .. "Success"
		types = recordType(okType, fields, successIndices)
		okValue = recordLiteral(fields, successIndices, "\t\t")
		okValue[1] = "\t\treturn Result.ok({"
		okValue[#okValue] = "\t\t})"
	end
	local errorField = "r" .. errorIndex
	local fallback = override.fallback
	local errorValue = if fallback
		then "if " .. errorField .. " == nil then " .. fallback .. " else " .. errorField
		else errorField
	local lines = {
		"function Wrappers."
			.. api.name
			.. "("
			.. declaredParameters(api)
			.. "): Result<"
			.. okType
			.. ", "
			.. fields[errorIndex].type
			.. ">",
		"\tlocal " .. locals(#fields) .. " = " .. call(api),
		"\tif r1 then",
	}
	appendAll(lines, okValue)
	appendAll(lines, { "\tend", "\treturn Result.err(" .. errorValue .. ")", "end", "" })
	return types, lines
end

local function loadedType(api: Api): string
	return if api.shape.kind == "maybe" then results(api)[1].type else api.name .. "Results"
end

local function loadWrapper(api: Api, override: { event: string, request: string, key: string? }): { string }
	local first = api.parameters[1]
	if first == nil or first.variadic then
		error(api.key .. ": a load needs a first parameter to key the request", 0)
	end
	local keyApi = override.key
	local key = if keyApi then keyApi .. "(" .. first.name .. ")" else first.name
	local valueType = loadedType(api)
	return {
		"function Wrappers."
			.. api.name
			.. "Async("
			.. declaredParameters(api)
			.. "): Task<"
			.. valueType
			.. ", Loads.LoadFailed>",
		"\treturn Loads.load({",
		'\t\tapi = "' .. api.key .. '",',
		'\t\tevent = "' .. override.event .. '",',
		"\t\tkey = " .. key .. ",",
		"\t\trequest = " .. override.request .. ",",
		"\t\tread = function(): Maybe<" .. valueType .. ">",
		"\t\t\treturn Wrappers." .. api.name .. "(" .. arguments(api) .. ")",
		"\t\tend,",
		"\t})",
		"end",
		"",
	}
end

local function callbackWrapper(api: Api, override: { callback: string, resolves: string }): { string }
	local resolves = override.resolves
	local handler = if resolves == "nil"
		then "function()\n\t\tdeferred.resolve(nil)\n\tend"
		else "function(value: " .. resolves .. ")\n\t\tdeferred.resolve(value)\n\tend"
	local body = call(api, { [override.callback] = handler })
	return {
		"function Wrappers."
			.. api.name
			.. "Async("
			.. declaredParameters(api, override.callback)
			.. "): Task<"
			.. resolves
			.. ", never>",
		"\tlocal deferred = Task.withResolvers() :: Task.Deferred<" .. resolves .. ", never>",
		"\t" .. body,
		"\treturn deferred.task",
		"end",
		"",
	}
end

type Rendered = { types: { string }, functions: { string } }

local function renderWrapper(wrapper: Wrapper): Rendered
	check(wrapper.api)
	if wrapper.kind == "maybe" then
		return { types = {}, functions = maybeWrapper(wrapper.api) }
	elseif wrapper.kind == "record" then
		local types, functions = recordWrapper(wrapper.api)
		return { types = types, functions = functions }
	elseif wrapper.kind == "result" then
		local types, functions = resultWrapper(wrapper.api, wrapper.override)
		return { types = types, functions = functions }
	elseif wrapper.kind == "load" then
		return { types = {}, functions = loadWrapper(wrapper.api, wrapper.override) }
	end
	return { types = {}, functions = callbackWrapper(wrapper.api, wrapper.override) }
end

local function hasNilableSuccess(api: Api, errorName: string): boolean
	for i, field in ipairs(results(api)) do
		if i > 1 and field.name ~= errorName and field.nilable then
			return true
		end
	end
	return false
end

type Needs = { maybe: boolean, result: boolean, task: boolean, loads: boolean, reuse: boolean }

local function needsOf(module: Module): Needs
	local needs: Needs = { maybe = false, result = false, task = false, loads = false, reuse = false }
	for _, wrapper in ipairs(module.wrappers) do
		if wrapper.kind == "maybe" or wrapper.kind == "record" then
			needs.maybe = true
			needs.reuse = true
		elseif wrapper.kind == "result" then
			needs.result = true
			needs.maybe = needs.maybe or hasNilableSuccess(wrapper.api, wrapper.override.error)
		elseif wrapper.kind == "load" then
			needs.maybe = true
			needs.task = true
			needs.loads = true
		elseif wrapper.kind == "callback" then
			needs.task = true
		end
	end
	return needs
end

local function header(needs: Needs): { string }
	local lines = { "--!strict" }
	if needs.loads then
		table.insert(lines, 'local Loads = require("../Runtime/Loads")')
	end
	if needs.maybe then
		table.insert(lines, 'local Maybe = require("@truemyth/Maybe")')
	end
	if needs.result then
		table.insert(lines, 'local Result = require("@truemyth/Result")')
	end
	if needs.reuse then
		table.insert(lines, 'local Reuse = require("../Runtime/Reuse")')
	end
	if needs.task then
		table.insert(lines, 'local Task = require("@truemyth/Task")')
	end
	table.insert(lines, "")
	if needs.maybe then
		table.insert(lines, "type Maybe<T> = Maybe.Maybe<T>")
	end
	if needs.result then
		table.insert(lines, "type Result<T, E> = Result.Result<T, E>")
	end
	if needs.task then
		table.insert(lines, "type Task<T, E> = Task.Task<T, E>")
	end
	table.insert(lines, "")
	return lines
end

function Render.module(module: Module): string
	local types: { string } = {}
	local functions: { string } = {}
	for _, wrapper in ipairs(module.wrappers) do
		local rendered = renderWrapper(wrapper)
		appendAll(types, rendered.types)
		appendAll(functions, rendered.functions)
	end
	local lines = header(needsOf(module))
	appendAll(lines, types)
	table.insert(lines, "local Wrappers = {}")
	table.insert(lines, "")
	appendAll(lines, functions)
	table.insert(lines, "return Wrappers")
	return table.concat(lines, "\n") .. "\n"
end

function Render.exportedNames(module: Module): { string }
	local names: { string } = {}
	for _, wrapper in ipairs(module.wrappers) do
		local name = wrapper.api.name
		if wrapper.kind == "maybe" or wrapper.kind == "record" then
			table.insert(names, name)
			table.insert(names, name .. "Into")
		elseif wrapper.kind == "result" then
			table.insert(names, name)
		else
			table.insert(names, name .. "Async")
		end
	end
	table.sort(names)
	return names
end

function Render.index(folder: string, modules: { Module }): string
	local lines = { "--!strict" }
	local globals: Module? = nil
	for _, module in ipairs(modules) do
		table.insert(lines, "local " .. module.name .. ' = require("./' .. folder .. "/" .. module.name .. '")')
		if module.name == Plan.GLOBALS then
			globals = module
		end
	end
	table.insert(lines, "")
	table.insert(lines, "return {")
	for _, module in ipairs(modules) do
		if module.name ~= Plan.GLOBALS then
			table.insert(lines, "\t" .. module.name .. " = " .. module.name .. ",")
		end
	end
	if globals then
		for _, name in pairs(Render.exportedNames(globals)) do
			table.insert(lines, "\t" .. name .. " = " .. Plan.GLOBALS .. "." .. name .. ",")
		end
	end
	table.insert(lines, "}")
	return table.concat(lines, "\n") .. "\n"
end

return Render
