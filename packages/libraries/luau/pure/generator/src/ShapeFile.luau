--!strict
local serde = require("@lune/serde")

export type Parameter = { name: string, type: string, variadic: boolean? }
export type Field = { name: string, type: string, nilable: boolean }
export type Kind =
	"excluded"
	| "untyped"
	| "opaque"
	| "protected"
	| "generic"
	| "overloaded"
	| "void"
	| "value"
	| "variadic"
	| "maybe"
	| "record"

export type Shape = {
	kind: Kind,
	parameters: { { Parameter } }?,
	results: { Field }?,
	absent: { string }?,
	booleanFirst: boolean?,
	callbacks: { string }?,
	predicates: { string }?,
	note: string?,
}

export type ShapeFile = { functions: { [string]: Shape }, widgetMethods: { [string]: Shape } }

local ShapeFile = {}

local function uncheckedShapeFile(decoded: unknown): ShapeFile
	return decoded :: any
end

local function isTable(value: unknown): boolean
	return type(value) == "table"
end

function ShapeFile.decode(text: string): ShapeFile
	local decoded = serde.decode("json", text)
	local file = uncheckedShapeFile(decoded)
	if not isTable(decoded) or not isTable(file.functions) or not isTable(file.widgetMethods) then
		error("api-shapes.json: expected the categories functions and widgetMethods", 0)
	end
	return file
end

function ShapeFile.lookup(file: ShapeFile, key: string): Shape?
	return file.functions[key] or file.widgetMethods[key]
end

function ShapeFile.isMethodKey(key: string): boolean
	return string.find(key, ":", 1, true) ~= nil
end

return ShapeFile
