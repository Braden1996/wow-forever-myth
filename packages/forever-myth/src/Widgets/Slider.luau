--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetMinMaxValuesResults = {
	read minValue: number,
	read maxValue: number,
}

local Wrappers = {}

function Wrappers.GetMinMaxValues(object: Slider): GetMinMaxValuesResults
	local r1, r2 = object:GetMinMaxValues()
	return {
		minValue = r1,
		maxValue = r2,
	}
end

function Wrappers.GetMinMaxValuesInto(reuse: GetMinMaxValuesResults, object: Slider): GetMinMaxValuesResults
	local r1, r2 = object:GetMinMaxValues()
	local fields = Reuse.fields(reuse)
	fields.minValue = r1
	fields.maxValue = r2
	return reuse
end

return Wrappers
