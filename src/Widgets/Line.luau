--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetEndPointResults = {
	read relativePoint: FramePoint,
	read relativeTo: ScriptRegion,
	read offsetX: uiUnit,
	read offsetY: uiUnit,
}

export type GetStartPointResults = {
	read relativePoint: FramePoint,
	read relativeTo: ScriptRegion,
	read offsetX: uiUnit,
	read offsetY: uiUnit,
}

local Wrappers = {}

function Wrappers.GetEndPoint(object: Line): GetEndPointResults
	local r1, r2, r3, r4 = object:GetEndPoint()
	return {
		relativePoint = r1,
		relativeTo = r2,
		offsetX = r3,
		offsetY = r4,
	}
end

function Wrappers.GetEndPointInto(reuse: GetEndPointResults, object: Line): GetEndPointResults
	local r1, r2, r3, r4 = object:GetEndPoint()
	local fields = Reuse.fields(reuse)
	fields.relativePoint = r1
	fields.relativeTo = r2
	fields.offsetX = r3
	fields.offsetY = r4
	return reuse
end

function Wrappers.GetStartPoint(object: Line): GetStartPointResults
	local r1, r2, r3, r4 = object:GetStartPoint()
	return {
		relativePoint = r1,
		relativeTo = r2,
		offsetX = r3,
		offsetY = r4,
	}
end

function Wrappers.GetStartPointInto(reuse: GetStartPointResults, object: Line): GetStartPointResults
	local r1, r2, r3, r4 = object:GetStartPoint()
	local fields = Reuse.fields(reuse)
	fields.relativePoint = r1
	fields.relativeTo = r2
	fields.offsetX = r3
	fields.offsetY = r4
	return reuse
end

return Wrappers
