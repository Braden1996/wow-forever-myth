--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetOriginResults = {
	read point: FramePoint,
	read originX: number,
	read originY: number,
}

export type GetScaleResults = {
	read scaleX: number,
	read scaleY: number,
}

export type GetScaleFromResults = {
	read scaleX: number,
	read scaleY: number,
}

export type GetScaleToResults = {
	read scaleX: number,
	read scaleY: number,
}

local Wrappers = {}

function Wrappers.GetOrigin(object: Scale): GetOriginResults
	local r1, r2, r3 = object:GetOrigin()
	return {
		point = r1,
		originX = r2,
		originY = r3,
	}
end

function Wrappers.GetOriginInto(reuse: GetOriginResults, object: Scale): GetOriginResults
	local r1, r2, r3 = object:GetOrigin()
	local fields = Reuse.fields(reuse)
	fields.point = r1
	fields.originX = r2
	fields.originY = r3
	return reuse
end

function Wrappers.GetScale(object: Scale): GetScaleResults
	local r1, r2 = object:GetScale()
	return {
		scaleX = r1,
		scaleY = r2,
	}
end

function Wrappers.GetScaleInto(reuse: GetScaleResults, object: Scale): GetScaleResults
	local r1, r2 = object:GetScale()
	local fields = Reuse.fields(reuse)
	fields.scaleX = r1
	fields.scaleY = r2
	return reuse
end

function Wrappers.GetScaleFrom(object: Scale): GetScaleFromResults
	local r1, r2 = object:GetScaleFrom()
	return {
		scaleX = r1,
		scaleY = r2,
	}
end

function Wrappers.GetScaleFromInto(reuse: GetScaleFromResults, object: Scale): GetScaleFromResults
	local r1, r2 = object:GetScaleFrom()
	local fields = Reuse.fields(reuse)
	fields.scaleX = r1
	fields.scaleY = r2
	return reuse
end

function Wrappers.GetScaleTo(object: Scale): GetScaleToResults
	local r1, r2 = object:GetScaleTo()
	return {
		scaleX = r1,
		scaleY = r2,
	}
end

function Wrappers.GetScaleToInto(reuse: GetScaleToResults, object: Scale): GetScaleToResults
	local r1, r2 = object:GetScaleTo()
	local fields = Reuse.fields(reuse)
	fields.scaleX = r1
	fields.scaleY = r2
	return reuse
end

return Wrappers
