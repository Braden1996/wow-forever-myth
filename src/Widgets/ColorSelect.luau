--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetColorHSVResults = {
	read hsvX: number,
	read hsvY: number,
	read hsvZ: number,
}

export type GetColorRGBResults = {
	read rgbR: number,
	read rgbG: number,
	read rgbB: number,
}

local Wrappers = {}

function Wrappers.GetColorHSV(object: ColorSelect): GetColorHSVResults
	local r1, r2, r3 = object:GetColorHSV()
	return {
		hsvX = r1,
		hsvY = r2,
		hsvZ = r3,
	}
end

function Wrappers.GetColorHSVInto(reuse: GetColorHSVResults, object: ColorSelect): GetColorHSVResults
	local r1, r2, r3 = object:GetColorHSV()
	local fields = Reuse.fields(reuse)
	fields.hsvX = r1
	fields.hsvY = r2
	fields.hsvZ = r3
	return reuse
end

function Wrappers.GetColorRGB(object: ColorSelect): GetColorRGBResults
	local r1, r2, r3 = object:GetColorRGB()
	return {
		rgbR = r1,
		rgbG = r2,
		rgbB = r3,
	}
end

function Wrappers.GetColorRGBInto(reuse: GetColorRGBResults, object: ColorSelect): GetColorRGBResults
	local r1, r2, r3 = object:GetColorRGB()
	local fields = Reuse.fields(reuse)
	fields.rgbR = r1
	fields.rgbG = r2
	fields.rgbB = r3
	return reuse
end

return Wrappers
