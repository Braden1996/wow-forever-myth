--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCameraPositionResults = {
	read positionX: number,
	read positionY: number,
	read positionZ: number,
}

export type GetCameraTargetResults = {
	read targetX: number,
	read targetY: number,
	read targetZ: number,
}

export type GetFogColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
	read colorA: number,
}

export type GetLightResults = {
	read enabled: boolean,
	read light: ModelLight,
}

export type GetModelDrawLayerResults = {
	read layer: DrawLayer,
	read sublayer: number,
}

export type GetPositionResults = {
	read positionX: number,
	read positionY: number,
	read positionZ: number,
}

export type GetViewInsetsResults = {
	read left: uiUnit,
	read right: uiUnit,
	read top: uiUnit,
	read bottom: uiUnit,
}

export type GetViewTranslationResults = {
	read x: uiUnit,
	read y: uiUnit,
}

local Wrappers = {}

function Wrappers.GetCameraPosition(object: Model): GetCameraPositionResults
	local r1, r2, r3 = object:GetCameraPosition()
	return {
		positionX = r1,
		positionY = r2,
		positionZ = r3,
	}
end

function Wrappers.GetCameraPositionInto(reuse: GetCameraPositionResults, object: Model): GetCameraPositionResults
	local r1, r2, r3 = object:GetCameraPosition()
	local fields = Reuse.fields(reuse)
	fields.positionX = r1
	fields.positionY = r2
	fields.positionZ = r3
	return reuse
end

function Wrappers.GetCameraTarget(object: Model): GetCameraTargetResults
	local r1, r2, r3 = object:GetCameraTarget()
	return {
		targetX = r1,
		targetY = r2,
		targetZ = r3,
	}
end

function Wrappers.GetCameraTargetInto(reuse: GetCameraTargetResults, object: Model): GetCameraTargetResults
	local r1, r2, r3 = object:GetCameraTarget()
	local fields = Reuse.fields(reuse)
	fields.targetX = r1
	fields.targetY = r2
	fields.targetZ = r3
	return reuse
end

function Wrappers.GetFogColor(object: Model): GetFogColorResults
	local r1, r2, r3, r4 = object:GetFogColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
		colorA = r4,
	}
end

function Wrappers.GetFogColorInto(reuse: GetFogColorResults, object: Model): GetFogColorResults
	local r1, r2, r3, r4 = object:GetFogColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	fields.colorA = r4
	return reuse
end

function Wrappers.GetLight(object: Model): GetLightResults
	local r1, r2 = object:GetLight()
	return {
		enabled = r1,
		light = r2,
	}
end

function Wrappers.GetLightInto(reuse: GetLightResults, object: Model): GetLightResults
	local r1, r2 = object:GetLight()
	local fields = Reuse.fields(reuse)
	fields.enabled = r1
	fields.light = r2
	return reuse
end

function Wrappers.GetModelDrawLayer(object: Model): GetModelDrawLayerResults
	local r1, r2 = object:GetModelDrawLayer()
	return {
		layer = r1,
		sublayer = r2,
	}
end

function Wrappers.GetModelDrawLayerInto(reuse: GetModelDrawLayerResults, object: Model): GetModelDrawLayerResults
	local r1, r2 = object:GetModelDrawLayer()
	local fields = Reuse.fields(reuse)
	fields.layer = r1
	fields.sublayer = r2
	return reuse
end

function Wrappers.GetPosition(object: Model): GetPositionResults
	local r1, r2, r3 = object:GetPosition()
	return {
		positionX = r1,
		positionY = r2,
		positionZ = r3,
	}
end

function Wrappers.GetPositionInto(reuse: GetPositionResults, object: Model): GetPositionResults
	local r1, r2, r3 = object:GetPosition()
	local fields = Reuse.fields(reuse)
	fields.positionX = r1
	fields.positionY = r2
	fields.positionZ = r3
	return reuse
end

function Wrappers.GetViewInsets(object: Model): GetViewInsetsResults
	local r1, r2, r3, r4 = object:GetViewInsets()
	return {
		left = r1,
		right = r2,
		top = r3,
		bottom = r4,
	}
end

function Wrappers.GetViewInsetsInto(reuse: GetViewInsetsResults, object: Model): GetViewInsetsResults
	local r1, r2, r3, r4 = object:GetViewInsets()
	local fields = Reuse.fields(reuse)
	fields.left = r1
	fields.right = r2
	fields.top = r3
	fields.bottom = r4
	return reuse
end

function Wrappers.GetViewTranslation(object: Model): GetViewTranslationResults
	local r1, r2 = object:GetViewTranslation()
	return {
		x = r1,
		y = r2,
	}
end

function Wrappers.GetViewTranslationInto(reuse: GetViewTranslationResults, object: Model): GetViewTranslationResults
	local r1, r2 = object:GetViewTranslation()
	local fields = Reuse.fields(reuse)
	fields.x = r1
	fields.y = r2
	return reuse
end

return Wrappers
