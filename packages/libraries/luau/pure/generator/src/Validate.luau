--!strict
local OverrideTypes = require("./OverrideTypes")
local ShapeFile = require("./ShapeFile")

type Shape = ShapeFile.Shape
type ShapeFile = ShapeFile.ShapeFile
type Overrides = OverrideTypes.Overrides

local Validate = {}

local function fieldNamed(shape: Shape, name: string): ShapeFile.Field?
	for index, field in ipairs(shape.results or {}) do
		if index > 1 and field.name == name then
			return field
		end
	end
	return nil
end

local function requireShape(file: ShapeFile, key: string, problems: { string }): Shape?
	local shape = ShapeFile.lookup(file, key)
	if shape == nil then
		table.insert(problems, key .. ": not in api-shapes.json")
	elseif shape.kind == "protected" then
		table.insert(problems, key .. ": protected; it is never wrapped")
		return nil
	end
	return shape
end

local function expectKind(key: string, shape: Shape, kinds: { [string]: boolean }, problems: { string }): boolean
	if kinds[shape.kind] then
		return true
	end
	table.insert(problems, key .. ": shape " .. shape.kind .. " cannot take this override")
	return false
end

local function checkResult(file: ShapeFile, key: string, override: OverrideTypes.ResultOverride, problems: { string })
	local shape = requireShape(file, key, problems)
	if shape == nil or not expectKind(key, shape, { record = true }, problems) then
		return
	end
	if not shape.booleanFirst then
		table.insert(problems, key .. ": the first result is not a boolean")
	end
	local field = fieldNamed(shape, override.error)
	if field == nil then
		table.insert(problems, key .. ": no result named " .. override.error .. " after the first")
	elseif (field.nilable or shape.absent ~= nil) and override.fallback == nil then
		table.insert(problems, key .. ": " .. override.error .. " may be nil, so a fallback is required")
	elseif not (field.nilable or shape.absent ~= nil) and override.fallback ~= nil then
		table.insert(problems, key .. ": " .. override.error .. " is never nil, so the fallback is unused")
	end
end

local function checkLoad(file: ShapeFile, key: string, override: OverrideTypes.LoadOverride, problems: { string })
	local shape = requireShape(file, key, problems)
	if shape == nil or not expectKind(key, shape, { maybe = true, record = true }, problems) then
		return
	end
	if shape.kind == "record" and shape.absent == nil then
		table.insert(problems, key .. ": a record that is never absent has nothing to load")
	end
	local request = requireShape(file, override.request, problems)
	if request then
		expectKind(override.request, request, { void = true }, problems)
	end
	local keyApi = override.key
	if keyApi then
		local keyShape = requireShape(file, keyApi, problems)
		if keyShape then
			expectKind(keyApi, keyShape, { value = true, maybe = true }, problems)
		end
	end
end

local function checkCallback(
	file: ShapeFile,
	key: string,
	override: OverrideTypes.CallbackOverride,
	problems: { string }
)
	local shape = requireShape(file, key, problems)
	if shape == nil or not expectKind(key, shape, { void = true }, problems) then
		return
	end
	local callbacks: { string } = shape.callbacks or {}
	for _, callback in ipairs(callbacks) do
		if callback == override.callback then
			return
		end
	end
	table.insert(problems, key .. ": " .. override.callback .. " is not a callback parameter")
end

function Validate.overrides(file: ShapeFile, overrides: Overrides): { string }
	local problems: { string } = {}
	for key, override in pairs(overrides.results) do
		checkResult(file, key, override, problems)
	end
	for key, override in pairs(overrides.loads) do
		checkLoad(file, key, override, problems)
	end
	for key, override in pairs(overrides.callbacks) do
		checkCallback(file, key, override, problems)
	end
	table.sort(problems)
	return problems
end

return Validate
