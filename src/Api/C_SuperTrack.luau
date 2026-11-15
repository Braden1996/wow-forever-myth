--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetSuperTrackedContentResults = {
	read trackableType: Enum_ContentTrackingType,
	read trackableID: number,
}

export type GetSuperTrackedItemNameResults = {
	read name: string,
	read description: string,
}

export type GetSuperTrackedMapPinResults = {
	read type: Enum_SuperTrackingMapPinType,
	read typeID: number,
}

local Wrappers = {}

function Wrappers.GetHighestPrioritySuperTrackingType(): Maybe<Enum_SuperTrackingType>
	return Maybe.of(C_SuperTrack.GetHighestPrioritySuperTrackingType())
end

function Wrappers.GetHighestPrioritySuperTrackingTypeInto(
	reuse: Maybe<Enum_SuperTrackingType>
): Maybe<Enum_SuperTrackingType>
	return Reuse.maybe(reuse, C_SuperTrack.GetHighestPrioritySuperTrackingType())
end

function Wrappers.GetSuperTrackedContent(): Maybe<GetSuperTrackedContentResults>
	local r1, r2 = C_SuperTrack.GetSuperTrackedContent()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		trackableType = r1,
		trackableID = r2,
	})
end

function Wrappers.GetSuperTrackedContentInto(reuse: GetSuperTrackedContentResults): Maybe<GetSuperTrackedContentResults>
	local r1, r2 = C_SuperTrack.GetSuperTrackedContent()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.trackableType = r1
	fields.trackableID = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSuperTrackedItemName(): Maybe<GetSuperTrackedItemNameResults>
	local r1, r2 = C_SuperTrack.GetSuperTrackedItemName()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		description = r2,
	})
end

function Wrappers.GetSuperTrackedItemNameInto(
	reuse: GetSuperTrackedItemNameResults
): Maybe<GetSuperTrackedItemNameResults>
	local r1, r2 = C_SuperTrack.GetSuperTrackedItemName()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.description = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSuperTrackedMapPin(): Maybe<GetSuperTrackedMapPinResults>
	local r1, r2 = C_SuperTrack.GetSuperTrackedMapPin()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		type = r1,
		typeID = r2,
	})
end

function Wrappers.GetSuperTrackedMapPinInto(reuse: GetSuperTrackedMapPinResults): Maybe<GetSuperTrackedMapPinResults>
	local r1, r2 = C_SuperTrack.GetSuperTrackedMapPin()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.type = r1
	fields.typeID = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSuperTrackedQuestID(): Maybe<number>
	return Maybe.of(C_SuperTrack.GetSuperTrackedQuestID())
end

function Wrappers.GetSuperTrackedQuestIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_SuperTrack.GetSuperTrackedQuestID())
end

function Wrappers.GetSuperTrackedVignette(): Maybe<WOWGUID>
	return Maybe.of(C_SuperTrack.GetSuperTrackedVignette())
end

function Wrappers.GetSuperTrackedVignetteInto(reuse: Maybe<WOWGUID>): Maybe<WOWGUID>
	return Reuse.maybe(reuse, C_SuperTrack.GetSuperTrackedVignette())
end

return Wrappers
