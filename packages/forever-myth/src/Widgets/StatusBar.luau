--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetMinMaxValuesResults = {
	read minValue: number,
	read maxValue: number,
}

export type GetStatusBarColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
	read colorA: number,
}

local Wrappers = {}

function Wrappers.GetMinMaxValues(object: StatusBar): GetMinMaxValuesResults
	local r1, r2 = object:GetMinMaxValues()
	return {
		minValue = r1,
		maxValue = r2,
	}
end

function Wrappers.GetMinMaxValuesInto(reuse: GetMinMaxValuesResults, object: StatusBar): GetMinMaxValuesResults
	local r1, r2 = object:GetMinMaxValues()
	local fields = Reuse.fields(reuse)
	fields.minValue = r1
	fields.maxValue = r2
	return reuse
end

function Wrappers.GetStatusBarColor(object: StatusBar): GetStatusBarColorResults
	local r1, r2, r3, r4 = object:GetStatusBarColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	}
end

function Wrappers.GetStatusBarColorInto(reuse: GetStatusBarColorResults, object: StatusBar): GetStatusBarColorResults
	local r1, r2, r3, r4 = object:GetStatusBarColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return reuse
end

return Wrappers
