--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetBoundsRectResults = {
	read left: uiUnit,
	read bottom: uiUnit,
	read width: uiUnit,
	read height: uiUnit,
}

export type GetClampRectInsetsResults = {
	read left: uiUnit,
	read right: uiUnit,
	read top: uiUnit,
	read bottom: uiUnit,
}

export type GetHitRectInsetsResults = {
	read left: uiUnit,
	read right: uiUnit,
	read top: uiUnit,
	read bottom: uiUnit,
}

export type GetResizeBoundsResults = {
	read minWidth: uiUnit,
	read minHeight: uiUnit,
	read maxWidth: uiUnit,
	read maxHeight: uiUnit,
}

local Wrappers = {}

function Wrappers.GetBoundsRect(object: Frame): GetBoundsRectResults
	local r1, r2, r3, r4 = object:GetBoundsRect()
	return {
		left = r1,
		bottom = r2,
		width = r3,
		height = r4,
	}
end

function Wrappers.GetBoundsRectInto(reuse: GetBoundsRectResults, object: Frame): GetBoundsRectResults
	local r1, r2, r3, r4 = object:GetBoundsRect()
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.bottom = r2
	fields.width = r3
	fields.height = r4
	return reuse
end

function Wrappers.GetClampRectInsets(object: Frame): GetClampRectInsetsResults
	local r1, r2, r3, r4 = object:GetClampRectInsets()
	return {
		left = r1,
		right = r2,
		top = r3,
		bottom = r4,
	}
end

function Wrappers.GetClampRectInsetsInto(reuse: GetClampRectInsetsResults, object: Frame): GetClampRectInsetsResults
	local r1, r2, r3, r4 = object:GetClampRectInsets()
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.right = r2
	fields.top = r3
	fields.bottom = r4
	return reuse
end

function Wrappers.GetHitRectInsets(object: Frame): GetHitRectInsetsResults
	local r1, r2, r3, r4 = object:GetHitRectInsets()
	return {
		left = r1,
		right = r2,
		top = r3,
		bottom = r4,
	}
end

function Wrappers.GetHitRectInsetsInto(reuse: GetHitRectInsetsResults, object: Frame): GetHitRectInsetsResults
	local r1, r2, r3, r4 = object:GetHitRectInsets()
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.right = r2
	fields.top = r3
	fields.bottom = r4
	return reuse
end

function Wrappers.GetResizeBounds(object: Frame): GetResizeBoundsResults
	local r1, r2, r3, r4 = object:GetResizeBounds()
	return {
		minWidth = r1,
		minHeight = r2,
		maxWidth = r3,
		maxHeight = r4,
	}
end

function Wrappers.GetResizeBoundsInto(reuse: GetResizeBoundsResults, object: Frame): GetResizeBoundsResults
	local r1, r2, r3, r4 = object:GetResizeBounds()
	local fields = Reuse.fields(reuse)
	fields.minWidth = r1
	fields.minHeight = r2
	fields.maxWidth = r3
	fields.maxHeight = r4
	return reuse
end

return Wrappers
