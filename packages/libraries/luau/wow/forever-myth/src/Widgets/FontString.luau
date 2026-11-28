--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type FindCharacterIndexAtCoordinateResults = {
	read characterIndex: number,
	read inside: boolean,
}

export type GetAlphaGradientResults = {
	read start: number,
	read length: number,
}

export type GetFontResults = {
	read fontFile: Maybe<string>,
	read fontHeight: uiUnit,
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

function Wrappers.CalculateScreenAreaFromCharacterSpan(
	object: FontString,
	leftIndex: number,
	rightIndex: number
): Maybe<{ uiBoundsRect }>
	return Maybe.of(object:CalculateScreenAreaFromCharacterSpan(leftIndex, rightIndex))
end

function Wrappers.CalculateScreenAreaFromCharacterSpanInto(
	reuse: Maybe<{ uiBoundsRect }>,
	object: FontString,
	leftIndex: number,
	rightIndex: number
): Maybe<{ uiBoundsRect }>
	return Reuse.maybe(reuse, object:CalculateScreenAreaFromCharacterSpan(leftIndex, rightIndex))
end

function Wrappers.FindCharacterIndexAtCoordinate(
	object: FontString,
	x: uiUnit,
	y: uiUnit
): Maybe<FindCharacterIndexAtCoordinateResults>
	local r1, r2 = object:FindCharacterIndexAtCoordinate(x, y)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		characterIndex = r1,
		inside = r2,
	})
end

function Wrappers.FindCharacterIndexAtCoordinateInto(
	reuse: FindCharacterIndexAtCoordinateResults,
	object: FontString,
	x: uiUnit,
	y: uiUnit
): Maybe<FindCharacterIndexAtCoordinateResults>
	local r1, r2 = object:FindCharacterIndexAtCoordinate(x, y)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.characterIndex = r1
	fields.inside = r2
	return Reuse.just(reuse)
end

function Wrappers.GetAlphaGradient(object: FontString): GetAlphaGradientResults
	local r1, r2 = object:GetAlphaGradient()
	return {
		start = r1,
		length = r2,
	}
end

function Wrappers.GetAlphaGradientInto(reuse: GetAlphaGradientResults, object: FontString): GetAlphaGradientResults
	local r1, r2 = object:GetAlphaGradient()
	local fields = Reuse.fields(reuse)
	fields.start = r1
	fields.length = r2
	return reuse
end

function Wrappers.GetFont(object: FontString): GetFontResults
	local r1, r2, r3 = object:GetFont()
	return {
		fontFile = Maybe.of(r1),
		fontHeight = r2,
		flags = r3,
	}
end

function Wrappers.GetFontInto(reuse: GetFontResults, object: FontString): GetFontResults
	local r1, r2, r3 = object:GetFont()
	local fields = Reuse.fields(reuse)
	fields.fontFile = Reuse.maybe(fields.fontFile, r1)
	fields.fontHeight = r2
	fields.flags = r3
	return reuse
end

function Wrappers.GetShadowColor(object: FontString): GetShadowColorResults
	local r1, r2, r3, r4 = object:GetShadowColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	}
end

function Wrappers.GetShadowColorInto(reuse: GetShadowColorResults, object: FontString): GetShadowColorResults
	local r1, r2, r3, r4 = object:GetShadowColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return reuse
end

function Wrappers.GetShadowOffset(object: FontString): GetShadowOffsetResults
	local r1, r2 = object:GetShadowOffset()
	return {
		offsetX = r1,
		offsetY = r2,
	}
end

function Wrappers.GetShadowOffsetInto(reuse: GetShadowOffsetResults, object: FontString): GetShadowOffsetResults
	local r1, r2 = object:GetShadowOffset()
	local fields = Reuse.fields(reuse)
	fields.offsetX = r1
	fields.offsetY = r2
	return reuse
end

function Wrappers.GetTextColor(object: FontString): Maybe<GetTextColorResults>
	local r1, r2, r3, r4 = object:GetTextColor()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	})
end

function Wrappers.GetTextColorInto(reuse: GetTextColorResults, object: FontString): Maybe<GetTextColorResults>
	local r1, r2, r3, r4 = object:GetTextColor()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return Reuse.just(reuse)
end

return Wrappers
