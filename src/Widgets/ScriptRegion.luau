--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCenterResults = {
	read x: uiUnit,
	read y: uiUnit,
}

export type GetPointResults = {
	read point: FramePoint,
	read relativeTo: ScriptRegion,
	read relativePoint: FramePoint,
	read offsetX: uiUnit,
	read offsetY: uiUnit,
}

export type GetPointByNameResults = {
	read point: FramePoint,
	read relativeTo: ScriptRegion,
	read relativePoint: FramePoint,
	read offsetX: uiUnit,
	read offsetY: uiUnit,
}

export type GetRectResults = {
	read left: uiUnit,
	read bottom: uiUnit,
	read width: uiUnit,
	read height: uiUnit,
}

export type GetScaledRectResults = {
	read left: uiUnit,
	read bottom: uiUnit,
	read width: uiUnit,
	read height: uiUnit,
}

export type GetSizeResults = {
	read width: uiUnit,
	read height: uiUnit,
}

export type IsProtectedResults = {
	read isProtected: boolean,
	read isProtectedExplicitly: boolean,
}

local Wrappers = {}

function Wrappers.GetBottom(object: ScriptRegion): Maybe<uiUnit>
	return Maybe.of(object:GetBottom())
end

function Wrappers.GetBottomInto(reuse: Maybe<uiUnit>, object: ScriptRegion): Maybe<uiUnit>
	return Reuse.maybe(reuse, object:GetBottom())
end

function Wrappers.GetCenter(object: ScriptRegion): Maybe<GetCenterResults>
	local r1, r2 = object:GetCenter()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		x = r1,
		y = r2,
	})
end

function Wrappers.GetCenterInto(reuse: GetCenterResults, object: ScriptRegion): Maybe<GetCenterResults>
	local r1, r2 = object:GetCenter()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.x = r1
	fields.y = r2
	return Reuse.just(reuse)
end

function Wrappers.GetLeft(object: ScriptRegion): Maybe<uiUnit>
	return Maybe.of(object:GetLeft())
end

function Wrappers.GetLeftInto(reuse: Maybe<uiUnit>, object: ScriptRegion): Maybe<uiUnit>
	return Reuse.maybe(reuse, object:GetLeft())
end

function Wrappers.GetPoint(
	object: ScriptRegion,
	anchorIndex: number?,
	resolveCollapsed: boolean?
): Maybe<GetPointResults>
	local r1, r2, r3, r4, r5 = object:GetPoint(anchorIndex, resolveCollapsed)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		point = r1,
		relativeTo = r2,
		relativePoint = r3,
		offsetX = r4,
		offsetY = r5,
	})
end

function Wrappers.GetPointInto(
	reuse: GetPointResults,
	object: ScriptRegion,
	anchorIndex: number?,
	resolveCollapsed: boolean?
): Maybe<GetPointResults>
	local r1, r2, r3, r4, r5 = object:GetPoint(anchorIndex, resolveCollapsed)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.point = r1
	fields.relativeTo = r2
	fields.relativePoint = r3
	fields.offsetX = r4
	fields.offsetY = r5
	return Reuse.just(reuse)
end

function Wrappers.GetPointByName(
	object: ScriptRegion,
	point: FramePoint,
	resolveCollapsed: boolean?
): Maybe<GetPointByNameResults>
	local r1, r2, r3, r4, r5 = object:GetPointByName(point, resolveCollapsed)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		point = r1,
		relativeTo = r2,
		relativePoint = r3,
		offsetX = r4,
		offsetY = r5,
	})
end

function Wrappers.GetPointByNameInto(
	reuse: GetPointByNameResults,
	object: ScriptRegion,
	point: FramePoint,
	resolveCollapsed: boolean?
): Maybe<GetPointByNameResults>
	local r1, r2, r3, r4, r5 = object:GetPointByName(point, resolveCollapsed)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.point = r1
	fields.relativeTo = r2
	fields.relativePoint = r3
	fields.offsetX = r4
	fields.offsetY = r5
	return Reuse.just(reuse)
end

function Wrappers.GetRect(object: ScriptRegion): Maybe<GetRectResults>
	local r1, r2, r3, r4 = object:GetRect()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		left = r1,
		bottom = r2,
		width = r3,
		height = r4,
	})
end

function Wrappers.GetRectInto(reuse: GetRectResults, object: ScriptRegion): Maybe<GetRectResults>
	local r1, r2, r3, r4 = object:GetRect()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.bottom = r2
	fields.width = r3
	fields.height = r4
	return Reuse.just(reuse)
end

function Wrappers.GetRight(object: ScriptRegion): Maybe<uiUnit>
	return Maybe.of(object:GetRight())
end

function Wrappers.GetRightInto(reuse: Maybe<uiUnit>, object: ScriptRegion): Maybe<uiUnit>
	return Reuse.maybe(reuse, object:GetRight())
end

function Wrappers.GetScaledRect(object: ScriptRegion): Maybe<GetScaledRectResults>
	local r1, r2, r3, r4 = object:GetScaledRect()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		left = r1,
		bottom = r2,
		width = r3,
		height = r4,
	})
end

function Wrappers.GetScaledRectInto(reuse: GetScaledRectResults, object: ScriptRegion): Maybe<GetScaledRectResults>
	local r1, r2, r3, r4 = object:GetScaledRect()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.bottom = r2
	fields.width = r3
	fields.height = r4
	return Reuse.just(reuse)
end

function Wrappers.GetSize(object: ScriptRegion, ignoreRect: boolean?): GetSizeResults
	local r1, r2 = object:GetSize(ignoreRect)
	return {
		width = r1,
		height = r2,
	}
end

function Wrappers.GetSizeInto(reuse: GetSizeResults, object: ScriptRegion, ignoreRect: boolean?): GetSizeResults
	local r1, r2 = object:GetSize(ignoreRect)
	local fields = Reuse.fields(reuse)
	fields.width = r1
	fields.height = r2
	return reuse
end

function Wrappers.GetTop(object: ScriptRegion): Maybe<uiUnit>
	return Maybe.of(object:GetTop())
end

function Wrappers.GetTopInto(reuse: Maybe<uiUnit>, object: ScriptRegion): Maybe<uiUnit>
	return Reuse.maybe(reuse, object:GetTop())
end

function Wrappers.IsProtected(object: ScriptRegion): IsProtectedResults
	local r1, r2 = object:IsProtected()
	return {
		isProtected = r1,
		isProtectedExplicitly = r2,
	}
end

function Wrappers.IsProtectedInto(reuse: IsProtectedResults, object: ScriptRegion): IsProtectedResults
	local r1, r2 = object:IsProtected()
	local fields = Reuse.fields(reuse)
	fields.isProtected = r1
	fields.isProtectedExplicitly = r2
	return reuse
end

return Wrappers
