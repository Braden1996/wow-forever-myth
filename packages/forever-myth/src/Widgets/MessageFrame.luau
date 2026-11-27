--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetFontResults = {
	read fontFile: string,
	read height: uiFontHeight,
	read flags: TBFFlags,
}

export type GetShadowColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
	read colorA: number,
}

export type GetShadowOffsetResults = {
	read offsetX: number,
	read offsetY: number,
}

export type GetTextColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
	read colorA: number,
}

local Wrappers = {}

function Wrappers.GetFont(object: MessageFrame): GetFontResults
	local r1, r2, r3 = object:GetFont()
	return {
		fontFile = r1,
		height = r2,
		flags = r3,
	}
end

function Wrappers.GetFontInto(reuse: GetFontResults, object: MessageFrame): GetFontResults
	local r1, r2, r3 = object:GetFont()
	local fields = Reuse.fields(reuse)
	fields.fontFile = r1
	fields.height = r2
	fields.flags = r3
	return reuse
end

function Wrappers.GetShadowColor(object: MessageFrame): GetShadowColorResults
	local r1, r2, r3, r4 = object:GetShadowColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	}
end

function Wrappers.GetShadowColorInto(reuse: GetShadowColorResults, object: MessageFrame): GetShadowColorResults
	local r1, r2, r3, r4 = object:GetShadowColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return reuse
end

function Wrappers.GetShadowOffset(object: MessageFrame): GetShadowOffsetResults
	local r1, r2 = object:GetShadowOffset()
	return {
		offsetX = r1,
		offsetY = r2,
	}
end

function Wrappers.GetShadowOffsetInto(reuse: GetShadowOffsetResults, object: MessageFrame): GetShadowOffsetResults
	local r1, r2 = object:GetShadowOffset()
	local fields = Reuse.fields(reuse)
	fields.offsetX = r1
	fields.offsetY = r2
	return reuse
end

function Wrappers.GetTextColor(object: MessageFrame): GetTextColorResults
	local r1, r2, r3, r4 = object:GetTextColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	}
end

function Wrappers.GetTextColorInto(reuse: GetTextColorResults, object: MessageFrame): GetTextColorResults
	local r1, r2, r3, r4 = object:GetTextColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return reuse
end

return Wrappers
