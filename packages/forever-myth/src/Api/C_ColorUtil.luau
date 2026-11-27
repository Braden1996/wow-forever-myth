--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type ConvertHSLToHSVResults = {
	read hsvH: number,
	read hsvS: number,
	read hsvV: number,
}

export type ConvertHSVToHSLResults = {
	read hslH: number,
	read hslS: number,
	read hslL: number,
}

export type ConvertHSVToRGBResults = {
	read rgbR: number,
	read rgbG: number,
	read rgbB: number,
}

export type ConvertRGBToHSVResults = {
	read hsvH: number,
	read hsvS: number,
	read hsvV: number,
}

local Wrappers = {}

function Wrappers.ConvertHSLToHSV(hslH: number, hslS: number, hslL: number): ConvertHSLToHSVResults
	local r1, r2, r3 = C_ColorUtil.ConvertHSLToHSV(hslH, hslS, hslL)
	return {
		hsvH = r1,
		hsvS = r2,
		hsvV = r3,
	}
end

function Wrappers.ConvertHSLToHSVInto(
	reuse: ConvertHSLToHSVResults,
	hslH: number,
	hslS: number,
	hslL: number
): ConvertHSLToHSVResults
	local r1, r2, r3 = C_ColorUtil.ConvertHSLToHSV(hslH, hslS, hslL)
	local fields = Reuse.fields(reuse)
	fields.hsvH = r1
	fields.hsvS = r2
	fields.hsvV = r3
	return reuse
end

function Wrappers.ConvertHSVToHSL(hsvH: number, hsvS: number, hsvV: number): ConvertHSVToHSLResults
	local r1, r2, r3 = C_ColorUtil.ConvertHSVToHSL(hsvH, hsvS, hsvV)
	return {
		hslH = r1,
		hslS = r2,
		hslL = r3,
	}
end

function Wrappers.ConvertHSVToHSLInto(
	reuse: ConvertHSVToHSLResults,
	hsvH: number,
	hsvS: number,
	hsvV: number
): ConvertHSVToHSLResults
	local r1, r2, r3 = C_ColorUtil.ConvertHSVToHSL(hsvH, hsvS, hsvV)
	local fields = Reuse.fields(reuse)
	fields.hslH = r1
	fields.hslS = r2
	fields.hslL = r3
	return reuse
end

function Wrappers.ConvertHSVToRGB(hsvH: number, hsvS: number, hsvV: number): ConvertHSVToRGBResults
	local r1, r2, r3 = C_ColorUtil.ConvertHSVToRGB(hsvH, hsvS, hsvV)
	return {
		rgbR = r1,
		rgbG = r2,
		rgbB = r3,
	}
end

function Wrappers.ConvertHSVToRGBInto(
	reuse: ConvertHSVToRGBResults,
	hsvH: number,
	hsvS: number,
	hsvV: number
): ConvertHSVToRGBResults
	local r1, r2, r3 = C_ColorUtil.ConvertHSVToRGB(hsvH, hsvS, hsvV)
	local fields = Reuse.fields(reuse)
	fields.rgbR = r1
	fields.rgbG = r2
	fields.rgbB = r3
	return reuse
end

function Wrappers.ConvertRGBToHSV(rgbR: number, rgbG: number, rgbB: number): ConvertRGBToHSVResults
	local r1, r2, r3 = C_ColorUtil.ConvertRGBToHSV(rgbR, rgbG, rgbB)
	return {
		hsvH = r1,
		hsvS = r2,
		hsvV = r3,
	}
end

function Wrappers.ConvertRGBToHSVInto(
	reuse: ConvertRGBToHSVResults,
	rgbR: number,
	rgbG: number,
	rgbB: number
): ConvertRGBToHSVResults
	local r1, r2, r3 = C_ColorUtil.ConvertRGBToHSV(rgbR, rgbG, rgbB)
	local fields = Reuse.fields(reuse)
	fields.hsvH = r1
	fields.hsvS = r2
	fields.hsvV = r3
	return reuse
end

return Wrappers
