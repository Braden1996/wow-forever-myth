--!strict
local fs = require("@lune/fs")

local Lib = require("../support/Lib")
local OverrideTypes = require("../../generator/OverrideTypes")
local ShapeFile = require("../../generator/ShapeFile")
local Validate = require("../../generator/Validate")

local SHAPES = ".deps/wow-forever-luau-types/api-shapes.json"

local function none(): OverrideTypes.Overrides
	return { results = {}, loads = {}, callbacks = {} }
end

local spec: Lib.Spec = function(_lib, t, _world)
	local shapes = ShapeFile.decode(fs.readFile(SHAPES))
	local function problems(overrides: OverrideTypes.Overrides): { string }
		return Validate.overrides(shapes, overrides)
	end
	t.test("validate: an unknown API is rejected", function()
		local o = none()
		o.results["C_Nowhere.Nothing"] = { error = "reason", why = "" }
		t.equal(problems(o), { "C_Nowhere.Nothing: not in api-shapes.json" })
	end)
	t.test("validate: a Result override needs a boolean-first record", function()
		local o = none()
		o.results.UnitLevel = { error = "result", why = "" }
		t.equal(problems(o), { "UnitLevel: shape value cannot take this override" })
	end)
	t.test("validate: a Result override names an existing error result", function()
		local o = none()
		o.results["C_AddOns.IsAddOnLoadable"] = { error = "why", why = "" }
		t.equal(problems(o), { "C_AddOns.IsAddOnLoadable: no result named why after the first" })
	end)
	t.test("validate: a nilable error result needs a fallback", function()
		local o = none()
		o.results["C_AddOns.LoadAddOn"] = { error = "value", why = "" }
		t.equal(problems(o), { "C_AddOns.LoadAddOn: value may be nil, so a fallback is required" })
	end)
	t.test("validate: a never-nil error result takes no fallback", function()
		local o = none()
		o.results["C_AddOns.IsAddOnLoadable"] = { error = "reason", fallback = '""', why = "" }
		t.equal(problems(o), { "C_AddOns.IsAddOnLoadable: reason is never nil, so the fallback is unused" })
	end)
	t.test("validate: a protected API is never wrapped", function()
		local o = none()
		o.callbacks["Frame:ClearAttributes"] = { callback = "x", resolves = "nil", why = "" }
		t.equal(problems(o), { "Frame:ClearAttributes: protected; it is never wrapped" })
	end)
	t.test("validate: a load needs a void request API", function()
		local o = none()
		o.loads["C_QuestLog.GetTitleForQuestID"] = { event = "QUEST_DATA_LOAD_RESULT", request = "UnitLevel", why = "" }
		t.equal(problems(o), { "UnitLevel: shape value cannot take this override" })
	end)
	t.test("validate: a callback override names a callback parameter", function()
		local o = none()
		o.callbacks["C_Timer.After"] = { callback = "seconds", resolves = "nil", why = "" }
		t.equal(problems(o), { "C_Timer.After: seconds is not a callback parameter" })
	end)
	t.test("validate: the reviewed overrides are valid", function()
		t.equal(
			problems({
				results = require("../../overrides/Results"),
				loads = require("../../overrides/Loads"),
				callbacks = require("../../overrides/Callbacks"),
			}),
			{}
		)
	end)
end

return spec
