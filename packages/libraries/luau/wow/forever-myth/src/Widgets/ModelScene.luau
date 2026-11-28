--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCameraForwardResults = {
	read forwardX: number,
	read forwardY: number,
	read forwardZ: number,
}

export type GetCameraPositionResults = {
	read positionX: number,
	read positionY: number,
	read positionZ: number,
}

export type GetCameraRightResults = {
	read rightX: number,
	read rightY: number,
	read rightZ: number,
}

export type GetCameraUpResults = {
	read upX: number,
	read upY: number,
	read upZ: number,
}

export type GetDrawLayerResults = {
	read layer: DrawLayer,
	read sublevel: number,
}

export type GetFogColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
}

export type GetLightAmbientColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
}

export type GetLightDiffuseColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
}

export type GetLightDirectionResults = {
	read directionX: number,
	read directionY: number,
	read directionZ: number,
}

export type GetLightPositionResults = {
	read positionX: number,
	read positionY: number,
	read positionZ: number,
}

export type GetViewTranslationResults = {
	read translationX: number,
	read translationY: number,
}

export type Project3DPointTo2DResults = {
	read point2DX: number,
	read point2DY: number,
	read depth: number,
}

local Wrappers = {}

function Wrappers.GetCameraForward(object: ModelScene): GetCameraForwardResults
	local r1, r2, r3 = object:GetCameraForward()
	return {
		forwardX = r1,
		forwardY = r2,
		forwardZ = r3,
	}
end

function Wrappers.GetCameraForwardInto(reuse: GetCameraForwardResults, object: ModelScene): GetCameraForwardResults
	local r1, r2, r3 = object:GetCameraForward()
	local fields = Reuse.fields(reuse)
	fields.forwardX = r1
	fields.forwardY = r2
	fields.forwardZ = r3
	return reuse
end

function Wrappers.GetCameraPosition(object: ModelScene): GetCameraPositionResults
	local r1, r2, r3 = object:GetCameraPosition()
	return {
		positionX = r1,
		positionY = r2,
		positionZ = r3,
	}
end

function Wrappers.GetCameraPositionInto(reuse: GetCameraPositionResults, object: ModelScene): GetCameraPositionResults
	local r1, r2, r3 = object:GetCameraPosition()
	local fields = Reuse.fields(reuse)
	fields.positionX = r1
	fields.positionY = r2
	fields.positionZ = r3
	return reuse
end

function Wrappers.GetCameraRight(object: ModelScene): GetCameraRightResults
	local r1, r2, r3 = object:GetCameraRight()
	return {
		rightX = r1,
		rightY = r2,
		rightZ = r3,
	}
end

function Wrappers.GetCameraRightInto(reuse: GetCameraRightResults, object: ModelScene): GetCameraRightResults
	local r1, r2, r3 = object:GetCameraRight()
	local fields = Reuse.fields(reuse)
	fields.rightX = r1
	fields.rightY = r2
	fields.rightZ = r3
	return reuse
end

function Wrappers.GetCameraUp(object: ModelScene): GetCameraUpResults
	local r1, r2, r3 = object:GetCameraUp()
	return {
		upX = r1,
		upY = r2,
		upZ = r3,
	}
end

function Wrappers.GetCameraUpInto(reuse: GetCameraUpResults, object: ModelScene): GetCameraUpResults
	local r1, r2, r3 = object:GetCameraUp()
	local fields = Reuse.fields(reuse)
	fields.upX = r1
	fields.upY = r2
	fields.upZ = r3
	return reuse
end

function Wrappers.GetDrawLayer(object: ModelScene): GetDrawLayerResults
	local r1, r2 = object:GetDrawLayer()
	return {
		layer = r1,
		sublevel = r2,
	}
end

function Wrappers.GetDrawLayerInto(reuse: GetDrawLayerResults, object: ModelScene): GetDrawLayerResults
	local r1, r2 = object:GetDrawLayer()
	local fields = Reuse.fields(reuse)
	fields.layer = r1
	fields.sublevel = r2
	return reuse
end

function Wrappers.GetFogColor(object: ModelScene): GetFogColorResults
	local r1, r2, r3 = object:GetFogColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
	}
end

function Wrappers.GetFogColorInto(reuse: GetFogColorResults, object: ModelScene): GetFogColorResults
	local r1, r2, r3 = object:GetFogColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	return reuse
end

function Wrappers.GetLightAmbientColor(object: ModelScene): GetLightAmbientColorResults
	local r1, r2, r3 = object:GetLightAmbientColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
	}
end

function Wrappers.GetLightAmbientColorInto(
	reuse: GetLightAmbientColorResults,
	object: ModelScene
): GetLightAmbientColorResults
	local r1, r2, r3 = object:GetLightAmbientColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	return reuse
end

function Wrappers.GetLightDiffuseColor(object: ModelScene): GetLightDiffuseColorResults
	local r1, r2, r3 = object:GetLightDiffuseColor()
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
	}
end

function Wrappers.GetLightDiffuseColorInto(
	reuse: GetLightDiffuseColorResults,
	object: ModelScene
): GetLightDiffuseColorResults
	local r1, r2, r3 = object:GetLightDiffuseColor()
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	return reuse
end

function Wrappers.GetLightDirection(object: ModelScene): GetLightDirectionResults
	local r1, r2, r3 = object:GetLightDirection()
	return {
		directionX = r1,
		directionY = r2,
		directionZ = r3,
	}
end

function Wrappers.GetLightDirectionInto(reuse: GetLightDirectionResults, object: ModelScene): GetLightDirectionResults
	local r1, r2, r3 = object:GetLightDirection()
	local fields = Reuse.fields(reuse)
	fields.directionX = r1
	fields.directionY = r2
	fields.directionZ = r3
	return reuse
end

function Wrappers.GetLightPosition(object: ModelScene): GetLightPositionResults
	local r1, r2, r3 = object:GetLightPosition()
	return {
		positionX = r1,
		positionY = r2,
		positionZ = r3,
	}
end

function Wrappers.GetLightPositionInto(reuse: GetLightPositionResults, object: ModelScene): GetLightPositionResults
	local r1, r2, r3 = object:GetLightPosition()
	local fields = Reuse.fields(reuse)
	fields.positionX = r1
	fields.positionY = r2
	fields.positionZ = r3
	return reuse
end

function Wrappers.GetLightType(object: ModelScene): Maybe<Enum_ModelLightType>
	return Maybe.of(object:GetLightType())
end

function Wrappers.GetLightTypeInto(reuse: Maybe<Enum_ModelLightType>, object: ModelScene): Maybe<Enum_ModelLightType>
	return Reuse.maybe(reuse, object:GetLightType())
end

function Wrappers.GetViewTranslation(object: ModelScene): GetViewTranslationResults
	local r1, r2 = object:GetViewTranslation()
	return {
		translationX = r1,
		translationY = r2,
	}
end

function Wrappers.GetViewTranslationInto(
	reuse: GetViewTranslationResults,
	object: ModelScene
): GetViewTranslationResults
	local r1, r2 = object:GetViewTranslation()
	local fields = Reuse.fields(reuse)
	fields.translationX = r1
	fields.translationY = r2
	return reuse
end

function Wrappers.Project3DPointTo2D(
	object: ModelScene,
	pointX: number,
	pointY: number,
	pointZ: number
): Maybe<Project3DPointTo2DResults>
	local r1, r2, r3 = object:Project3DPointTo2D(pointX, pointY, pointZ)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		point2DX = r1,
		point2DY = r2,
		depth = r3,
	})
end

function Wrappers.Project3DPointTo2DInto(
	reuse: Project3DPointTo2DResults,
	object: ModelScene,
	pointX: number,
	pointY: number,
	pointZ: number
): Maybe<Project3DPointTo2DResults>
	local r1, r2, r3 = object:Project3DPointTo2D(pointX, pointY, pointZ)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.point2DX = r1
	fields.point2DY = r2
	fields.depth = r3
	return Reuse.just(reuse)
end

return Wrappers
