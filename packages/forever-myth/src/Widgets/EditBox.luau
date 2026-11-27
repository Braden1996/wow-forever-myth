--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetFontResults = {
	read name: string,
	read fontHeight: uiUnit,
	read flags: TBFFlags,
}

export type GetHighlightColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
	read colorA: number,
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

export type GetTextInsetsResults = {
	read left: uiUnit,
	read right: uiUnit,
	read top: uiUnit,
	read bottom: uiUnit,
}

local Wrappers = {}

function Wrappers.GetDisplayText(object: EditBox): Maybe<string>
	return Maybe.of(object:GetDisplayText())
end

function Wrappers.GetDisplayTextInto(reuse: Maybe<string>, object: EditBox): Maybe<string>
	return Reuse.maybe(reuse, object:GetDisplayText())
end

function Wrappers.GetFont(object: EditBox): GetFontResults
	local r1, r2, r3 = object:GetFont()
	return {
		name = r1,
		fontHeight = r2,
		flags = r3,
	}
end

function Wrappers.GetFontInto(reuse: GetFontResults, object: EditBox): GetFontResults
	local r1, r2, r3 = object:GetFont()
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.fontHeight = r2
	fields.flags = r3
	return reuse
end

function Wrappers.GetHighlightColor(object: EditBox): GetHighlightColorResults
	local r1, r2, r3, r4 = object:GetHighlightColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	}
end

function Wrappers.GetHighlightColorInto(reuse: GetHighlightColorResults, object: EditBox): GetHighlightColorResults
	local r1, r2, r3, r4 = object:GetHighlightColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return reuse
end

function Wrappers.GetNumLetters(object: EditBox): Maybe<number>
	return Maybe.of(object:GetNumLetters())
end

function Wrappers.GetNumLettersInto(reuse: Maybe<number>, object: EditBox): Maybe<number>
	return Reuse.maybe(reuse, object:GetNumLetters())
end

function Wrappers.GetNumber(object: EditBox): Maybe<number>
	return Maybe.of(object:GetNumber())
end

function Wrappers.GetNumberInto(reuse: Maybe<number>, object: EditBox): Maybe<number>
	return Reuse.maybe(reuse, object:GetNumber())
end

function Wrappers.GetShadowColor(object: EditBox): GetShadowColorResults
	local r1, r2, r3, r4 = object:GetShadowColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	}
end

function Wrappers.GetShadowColorInto(reuse: GetShadowColorResults, object: EditBox): GetShadowColorResults
	local r1, r2, r3, r4 = object:GetShadowColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return reuse
end

function Wrappers.GetShadowOffset(object: EditBox): GetShadowOffsetResults
	local r1, r2 = object:GetShadowOffset()
	return {
		offsetX = r1,
		offsetY = r2,
	}
end

function Wrappers.GetShadowOffsetInto(reuse: GetShadowOffsetResults, object: EditBox): GetShadowOffsetResults
	local r1, r2 = object:GetShadowOffset()
	local fields = Reuse.fields(reuse)
	fields.offsetX = r1
	fields.offsetY = r2
	return reuse
end

function Wrappers.GetTextColor(object: EditBox): GetTextColorResults
	local r1, r2, r3, r4 = object:GetTextColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	}
end

function Wrappers.GetTextColorInto(reuse: GetTextColorResults, object: EditBox): GetTextColorResults
	local r1, r2, r3, r4 = object:GetTextColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return reuse
end

function Wrappers.GetTextInsets(object: EditBox): GetTextInsetsResults
	local r1, r2, r3, r4 = object:GetTextInsets()
	return {
		left = r1,
		right = r2,
		top = r3,
		bottom = r4,
	}
end

function Wrappers.GetTextInsetsInto(reuse: GetTextInsetsResults, object: EditBox): GetTextInsetsResults
	local r1, r2, r3, r4 = object:GetTextInsets()
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.right = r2
	fields.top = r3
	fields.bottom = r4
	return reuse
end

return Wrappers
