--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCameraIDsResults = {
	read detailsCameraID: Maybe<number>,
	read vendorCameraID: Maybe<number>,
}

export type GetFilteredBaseSetsCountsResults = {
	read numCollected: number,
	read numTotal: number,
}

export type GetFullBaseSetsCountsResults = {
	read numCollected: number,
	read numTotal: number,
}

export type GetIsFavoriteResults = {
	read isFavorite: boolean,
	read isGroupFavorite: boolean,
}

export type GetValidBaseSetsCountsForCharacterResults = {
	read numCollected: number,
	read numTotal: number,
}

local Wrappers = {}

function Wrappers.GetAllSourceIDs(transmogSetID: number): Maybe<{ number }>
	return Maybe.of(C_TransmogSets.GetAllSourceIDs(transmogSetID))
end

function Wrappers.GetAllSourceIDsInto(reuse: Maybe<{ number }>, transmogSetID: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_TransmogSets.GetAllSourceIDs(transmogSetID))
end

function Wrappers.GetBaseSetID(transmogSetID: number): Maybe<number>
	return Maybe.of(C_TransmogSets.GetBaseSetID(transmogSetID))
end

function Wrappers.GetBaseSetIDInto(reuse: Maybe<number>, transmogSetID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TransmogSets.GetBaseSetID(transmogSetID))
end

function Wrappers.GetBaseSetsFilter(index: number): Maybe<boolean>
	return Maybe.of(C_TransmogSets.GetBaseSetsFilter(index))
end

function Wrappers.GetBaseSetsFilterInto(reuse: Maybe<boolean>, index: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_TransmogSets.GetBaseSetsFilter(index))
end

function Wrappers.GetCameraIDs(): GetCameraIDsResults
	local r1, r2 = C_TransmogSets.GetCameraIDs()
	return {
		detailsCameraID = Maybe.of(r1),
		vendorCameraID = Maybe.of(r2),
	}
end

function Wrappers.GetCameraIDsInto(reuse: GetCameraIDsResults): GetCameraIDsResults
	local r1, r2 = C_TransmogSets.GetCameraIDs()
	local fields = Reuse.fields(reuse)
	fields.detailsCameraID = Reuse.maybe(fields.detailsCameraID, r1)
	fields.vendorCameraID = Reuse.maybe(fields.vendorCameraID, r2)
	return reuse
end

function Wrappers.GetFilteredBaseSetsCounts(): GetFilteredBaseSetsCountsResults
	local r1, r2 = C_TransmogSets.GetFilteredBaseSetsCounts()
	return {
		numCollected = r1,
		numTotal = r2,
	}
end

function Wrappers.GetFilteredBaseSetsCountsInto(
	reuse: GetFilteredBaseSetsCountsResults
): GetFilteredBaseSetsCountsResults
	local r1, r2 = C_TransmogSets.GetFilteredBaseSetsCounts()
	local fields = Reuse.fields(reuse)
	fields.numCollected = r1
	fields.numTotal = r2
	return reuse
end

function Wrappers.GetFullBaseSetsCounts(): GetFullBaseSetsCountsResults
	local r1, r2 = C_TransmogSets.GetFullBaseSetsCounts()
	return {
		numCollected = r1,
		numTotal = r2,
	}
end

function Wrappers.GetFullBaseSetsCountsInto(reuse: GetFullBaseSetsCountsResults): GetFullBaseSetsCountsResults
	local r1, r2 = C_TransmogSets.GetFullBaseSetsCounts()
	local fields = Reuse.fields(reuse)
	fields.numCollected = r1
	fields.numTotal = r2
	return reuse
end

function Wrappers.GetIsFavorite(transmogSetID: number): Maybe<GetIsFavoriteResults>
	local r1, r2 = C_TransmogSets.GetIsFavorite(transmogSetID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		isFavorite = r1,
		isGroupFavorite = r2,
	})
end

function Wrappers.GetIsFavoriteInto(reuse: GetIsFavoriteResults, transmogSetID: number): Maybe<GetIsFavoriteResults>
	local r1, r2 = C_TransmogSets.GetIsFavorite(transmogSetID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.isFavorite = r1
	fields.isGroupFavorite = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSetInfo(transmogSetID: number): Maybe<TransmogSetInfo>
	return Maybe.of(C_TransmogSets.GetSetInfo(transmogSetID))
end

function Wrappers.GetSetInfoInto(reuse: Maybe<TransmogSetInfo>, transmogSetID: number): Maybe<TransmogSetInfo>
	return Reuse.maybe(reuse, C_TransmogSets.GetSetInfo(transmogSetID))
end

function Wrappers.GetSetNewSources(transmogSetID: number): Maybe<{ number }>
	return Maybe.of(C_TransmogSets.GetSetNewSources(transmogSetID))
end

function Wrappers.GetSetNewSourcesInto(reuse: Maybe<{ number }>, transmogSetID: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_TransmogSets.GetSetNewSources(transmogSetID))
end

function Wrappers.GetSetPrimaryAppearances(transmogSetID: number): Maybe<{ TransmogSetPrimaryAppearanceInfo }>
	return Maybe.of(C_TransmogSets.GetSetPrimaryAppearances(transmogSetID))
end

function Wrappers.GetSetPrimaryAppearancesInto(
	reuse: Maybe<{ TransmogSetPrimaryAppearanceInfo }>,
	transmogSetID: number
): Maybe<{ TransmogSetPrimaryAppearanceInfo }>
	return Reuse.maybe(reuse, C_TransmogSets.GetSetPrimaryAppearances(transmogSetID))
end

function Wrappers.GetSetsContainingSourceID(sourceID: number): Maybe<{ number }>
	return Maybe.of(C_TransmogSets.GetSetsContainingSourceID(sourceID))
end

function Wrappers.GetSetsContainingSourceIDInto(reuse: Maybe<{ number }>, sourceID: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_TransmogSets.GetSetsContainingSourceID(sourceID))
end

function Wrappers.GetSetsFilter(index: number): Maybe<boolean>
	return Maybe.of(C_TransmogSets.GetSetsFilter(index))
end

function Wrappers.GetSetsFilterInto(reuse: Maybe<boolean>, index: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_TransmogSets.GetSetsFilter(index))
end

function Wrappers.GetSourceIDsForSlot(transmogSetID: number, slot: number): Maybe<{ number }>
	return Maybe.of(C_TransmogSets.GetSourceIDsForSlot(transmogSetID, slot))
end

function Wrappers.GetSourceIDsForSlotInto(
	reuse: Maybe<{ number }>,
	transmogSetID: number,
	slot: number
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_TransmogSets.GetSourceIDsForSlot(transmogSetID, slot))
end

function Wrappers.GetSourcesForSlot(transmogSetID: number, slot: number): Maybe<{ AppearanceSourceInfo }>
	return Maybe.of(C_TransmogSets.GetSourcesForSlot(transmogSetID, slot))
end

function Wrappers.GetSourcesForSlotInto(
	reuse: Maybe<{ AppearanceSourceInfo }>,
	transmogSetID: number,
	slot: number
): Maybe<{ AppearanceSourceInfo }>
	return Reuse.maybe(reuse, C_TransmogSets.GetSourcesForSlot(transmogSetID, slot))
end

function Wrappers.GetValidBaseSetsCountsForCharacter(): GetValidBaseSetsCountsForCharacterResults
	local r1, r2 = C_TransmogSets.GetValidBaseSetsCountsForCharacter()
	return {
		numCollected = r1,
		numTotal = r2,
	}
end

function Wrappers.GetValidBaseSetsCountsForCharacterInto(
	reuse: GetValidBaseSetsCountsForCharacterResults
): GetValidBaseSetsCountsForCharacterResults
	local r1, r2 = C_TransmogSets.GetValidBaseSetsCountsForCharacter()
	local fields = Reuse.fields(reuse)
	fields.numCollected = r1
	fields.numTotal = r2
	return reuse
end

function Wrappers.GetValidClassForSet(transmogSetID: number): Maybe<number>
	return Maybe.of(C_TransmogSets.GetValidClassForSet(transmogSetID))
end

function Wrappers.GetValidClassForSetInto(reuse: Maybe<number>, transmogSetID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TransmogSets.GetValidClassForSet(transmogSetID))
end

function Wrappers.GetVariantSets(transmogSetID: number): Maybe<{ TransmogSetInfo }>
	return Maybe.of(C_TransmogSets.GetVariantSets(transmogSetID))
end

function Wrappers.GetVariantSetsInto(
	reuse: Maybe<{ TransmogSetInfo }>,
	transmogSetID: number
): Maybe<{ TransmogSetInfo }>
	return Reuse.maybe(reuse, C_TransmogSets.GetVariantSets(transmogSetID))
end

return Wrappers
