--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetActiveBoundingBoxResults = {
	read boxBottom: Vector3DMixin,
	read boxTop: Vector3DMixin,
}

export type GetMaxBoundingBoxResults = {
	read boxBottom: Vector3DMixin,
	read boxTop: Vector3DMixin,
}

export type GetPausedResults = {
	read paused: boolean,
	read globalPaused: boolean,
}

export type GetPositionResults = {
	read positionX: number,
	read positionY: number,
	read positionZ: number,
}

export type IsUsingCenterForOriginResults = {
	read x: boolean,
	read y: boolean,
	read z: boolean,
}

local Wrappers = {}

function Wrappers.GetActiveBoundingBox(object: ModelSceneActor): GetActiveBoundingBoxResults
	local r1, r2 = object:GetActiveBoundingBox()
	return {
		boxBottom = r1,
		boxTop = r2,
	}
end

function Wrappers.GetActiveBoundingBoxInto(
	reuse: GetActiveBoundingBoxResults,
	object: ModelSceneActor
): GetActiveBoundingBoxResults
	local r1, r2 = object:GetActiveBoundingBox()
	local fields = Reuse.fields(reuse)
	fields.boxBottom = r1
	fields.boxTop = r2
	return reuse
end

function Wrappers.GetItemTransmogInfo(object: ModelSceneActor, inventorySlots: number): Maybe<ItemTransmogInfoMixin>
	return Maybe.of(object:GetItemTransmogInfo(inventorySlots))
end

function Wrappers.GetItemTransmogInfoInto(
	reuse: Maybe<ItemTransmogInfoMixin>,
	object: ModelSceneActor,
	inventorySlots: number
): Maybe<ItemTransmogInfoMixin>
	return Reuse.maybe(reuse, object:GetItemTransmogInfo(inventorySlots))
end

function Wrappers.GetMaxBoundingBox(object: ModelSceneActor): GetMaxBoundingBoxResults
	local r1, r2 = object:GetMaxBoundingBox()
	return {
		boxBottom = r1,
		boxTop = r2,
	}
end

function Wrappers.GetMaxBoundingBoxInto(
	reuse: GetMaxBoundingBoxResults,
	object: ModelSceneActor
): GetMaxBoundingBoxResults
	local r1, r2 = object:GetMaxBoundingBox()
	local fields = Reuse.fields(reuse)
	fields.boxBottom = r1
	fields.boxTop = r2
	return reuse
end

function Wrappers.GetParticleOverrideScale(object: ModelSceneActor): Maybe<number>
	return Maybe.of(object:GetParticleOverrideScale())
end

function Wrappers.GetParticleOverrideScaleInto(reuse: Maybe<number>, object: ModelSceneActor): Maybe<number>
	return Reuse.maybe(reuse, object:GetParticleOverrideScale())
end

function Wrappers.GetPaused(object: ModelSceneActor): GetPausedResults
	local r1, r2 = object:GetPaused()
	return {
		paused = r1,
		globalPaused = r2,
	}
end

function Wrappers.GetPausedInto(reuse: GetPausedResults, object: ModelSceneActor): GetPausedResults
	local r1, r2 = object:GetPaused()
	local fields = Reuse.fields(reuse)
	fields.paused = r1
	fields.globalPaused = r2
	return reuse
end

function Wrappers.GetPosition(object: ModelSceneActor): GetPositionResults
	local r1, r2, r3 = object:GetPosition()
	return {
		positionX = r1,
		positionY = r2,
		positionZ = r3,
	}
end

function Wrappers.GetPositionInto(reuse: GetPositionResults, object: ModelSceneActor): GetPositionResults
	local r1, r2, r3 = object:GetPosition()
	local fields = Reuse.fields(reuse)
	fields.positionX = r1
	fields.positionY = r2
	fields.positionZ = r3
	return reuse
end

function Wrappers.IsUsingCenterForOrigin(object: ModelSceneActor): IsUsingCenterForOriginResults
	local r1, r2, r3 = object:IsUsingCenterForOrigin()
	return {
		x = r1,
		y = r2,
		z = r3,
	}
end

function Wrappers.IsUsingCenterForOriginInto(
	reuse: IsUsingCenterForOriginResults,
	object: ModelSceneActor
): IsUsingCenterForOriginResults
	local r1, r2, r3 = object:IsUsingCenterForOrigin()
	local fields = Reuse.fields(reuse)
	fields.x = r1
	fields.y = r2
	fields.z = r3
	return reuse
end

function Wrappers.TryOn(
	object: ModelSceneActor,
	itemLinkOrItemModifiedAppearanceID: string,
	handSlotName: string?,
	spellEnchantmentID: number?
): Maybe<Enum_ItemTryOnReason>
	return Maybe.of(object:TryOn(itemLinkOrItemModifiedAppearanceID, handSlotName, spellEnchantmentID))
end

function Wrappers.TryOnInto(
	reuse: Maybe<Enum_ItemTryOnReason>,
	object: ModelSceneActor,
	itemLinkOrItemModifiedAppearanceID: string,
	handSlotName: string?,
	spellEnchantmentID: number?
): Maybe<Enum_ItemTryOnReason>
	return Reuse.maybe(reuse, object:TryOn(itemLinkOrItemModifiedAppearanceID, handSlotName, spellEnchantmentID))
end

return Wrappers
