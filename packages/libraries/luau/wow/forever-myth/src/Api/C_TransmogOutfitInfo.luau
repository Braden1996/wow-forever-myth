--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetAllSlotLocationInfoResults = {
	read appearanceSlotInfo: { TransmogOutfitSlotInfo },
	read illusionSlotInfo: { TransmogOutfitSlotInfo },
}

export type GetOptionsForSlotResults = {
	read options: { TransmogOutfitOptionInfo },
	read artifactOptions: Maybe<{ TransmogOutfitOptionInfo }>,
}

export type GetPendingTransmogCostResults = {
	read cost: BigUInteger,
	read modifierFlags: number,
}

local Wrappers = {}

function Wrappers.GetAllSlotLocationInfo(): Maybe<GetAllSlotLocationInfoResults>
	local r1, r2 = C_TransmogOutfitInfo.GetAllSlotLocationInfo()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		appearanceSlotInfo = r1,
		illusionSlotInfo = r2,
	})
end

function Wrappers.GetAllSlotLocationInfoInto(reuse: GetAllSlotLocationInfoResults): Maybe<GetAllSlotLocationInfoResults>
	local r1, r2 = C_TransmogOutfitInfo.GetAllSlotLocationInfo()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.appearanceSlotInfo = r1
	fields.illusionSlotInfo = r2
	return Reuse.just(reuse)
end

function Wrappers.GetAllTransmogOutfitOptionSheatheCategoryInfo(
	imaID: number
): Maybe<{ TransmogOutfitOptionSheatheCategoryInfo }>
	return Maybe.of(C_TransmogOutfitInfo.GetAllTransmogOutfitOptionSheatheCategoryInfo(imaID))
end

function Wrappers.GetAllTransmogOutfitOptionSheatheCategoryInfoInto(
	reuse: Maybe<
		{ TransmogOutfitOptionSheatheCategoryInfo }
	>,
	imaID: number
): Maybe<{ TransmogOutfitOptionSheatheCategoryInfo }>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetAllTransmogOutfitOptionSheatheCategoryInfo(imaID))
end

function Wrappers.GetCollectionInfoForSlotAndOption(
	slot: Enum_TransmogOutfitSlot,
	option: Enum_TransmogOutfitSlotOption,
	collectionType: Enum_TransmogCollectionType
): Maybe<TransmogOutfitCollectionInfo>
	return Maybe.of(C_TransmogOutfitInfo.GetCollectionInfoForSlotAndOption(slot, option, collectionType))
end

function Wrappers.GetCollectionInfoForSlotAndOptionInto(
	reuse: Maybe<TransmogOutfitCollectionInfo>,
	slot: Enum_TransmogOutfitSlot,
	option: Enum_TransmogOutfitSlotOption,
	collectionType: Enum_TransmogCollectionType
): Maybe<TransmogOutfitCollectionInfo>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetCollectionInfoForSlotAndOption(slot, option, collectionType))
end

function Wrappers.GetEquippedSlotOptionFromTransmogSlot(
	slot: Enum_TransmogOutfitSlot
): Maybe<Enum_TransmogOutfitSlotOption>
	return Maybe.of(C_TransmogOutfitInfo.GetEquippedSlotOptionFromTransmogSlot(slot))
end

function Wrappers.GetEquippedSlotOptionFromTransmogSlotInto(
	reuse: Maybe<Enum_TransmogOutfitSlotOption>,
	slot: Enum_TransmogOutfitSlot
): Maybe<Enum_TransmogOutfitSlotOption>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetEquippedSlotOptionFromTransmogSlot(slot))
end

function Wrappers.GetIllusionDefaultIMAIDForCollectionType(collectionType: Enum_TransmogCollectionType): Maybe<number>
	return Maybe.of(C_TransmogOutfitInfo.GetIllusionDefaultIMAIDForCollectionType(collectionType))
end

function Wrappers.GetIllusionDefaultIMAIDForCollectionTypeInto(
	reuse: Maybe<number>,
	collectionType: Enum_TransmogCollectionType
): Maybe<number>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetIllusionDefaultIMAIDForCollectionType(collectionType))
end

function Wrappers.GetLinkedSlotInfo(slot: Enum_TransmogOutfitSlot): Maybe<TransmogOutfitLinkedSlotInfo>
	return Maybe.of(C_TransmogOutfitInfo.GetLinkedSlotInfo(slot))
end

function Wrappers.GetLinkedSlotInfoInto(
	reuse: Maybe<TransmogOutfitLinkedSlotInfo>,
	slot: Enum_TransmogOutfitSlot
): Maybe<TransmogOutfitLinkedSlotInfo>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetLinkedSlotInfo(slot))
end

function Wrappers.GetOptionsForSlot(slot: Enum_TransmogOutfitSlot): Maybe<GetOptionsForSlotResults>
	local r1, r2 = C_TransmogOutfitInfo.GetOptionsForSlot(slot)
	if r1 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		options = r1,
		artifactOptions = Maybe.of(r2),
	})
end

function Wrappers.GetOptionsForSlotInto(
	reuse: GetOptionsForSlotResults,
	slot: Enum_TransmogOutfitSlot
): Maybe<GetOptionsForSlotResults>
	local r1, r2 = C_TransmogOutfitInfo.GetOptionsForSlot(slot)
	if r1 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.options = r1
	fields.artifactOptions = Reuse.maybe(fields.artifactOptions, r2)
	return Reuse.just(reuse)
end

function Wrappers.GetOutfitInfo(outfitID: number): Maybe<TransmogOutfitEntryInfo>
	return Maybe.of(C_TransmogOutfitInfo.GetOutfitInfo(outfitID))
end

function Wrappers.GetOutfitInfoInto(
	reuse: Maybe<TransmogOutfitEntryInfo>,
	outfitID: number
): Maybe<TransmogOutfitEntryInfo>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetOutfitInfo(outfitID))
end

function Wrappers.GetOutfitInfoByName(name: string): Maybe<TransmogOutfitEntryInfo>
	return Maybe.of(C_TransmogOutfitInfo.GetOutfitInfoByName(name))
end

function Wrappers.GetOutfitInfoByNameInto(
	reuse: Maybe<TransmogOutfitEntryInfo>,
	name: string
): Maybe<TransmogOutfitEntryInfo>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetOutfitInfoByName(name))
end

function Wrappers.GetOutfitInfoByPlayerFacingIndex(playerFacingOutfitIndex: number): Maybe<TransmogOutfitEntryInfo>
	return Maybe.of(C_TransmogOutfitInfo.GetOutfitInfoByPlayerFacingIndex(playerFacingOutfitIndex))
end

function Wrappers.GetOutfitInfoByPlayerFacingIndexInto(
	reuse: Maybe<TransmogOutfitEntryInfo>,
	playerFacingOutfitIndex: number
): Maybe<TransmogOutfitEntryInfo>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetOutfitInfoByPlayerFacingIndex(playerFacingOutfitIndex))
end

function Wrappers.GetOutfitsInfo(): Maybe<{ TransmogOutfitEntryInfo }>
	return Maybe.of(C_TransmogOutfitInfo.GetOutfitsInfo())
end

function Wrappers.GetOutfitsInfoInto(reuse: Maybe<{ TransmogOutfitEntryInfo }>): Maybe<{ TransmogOutfitEntryInfo }>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetOutfitsInfo())
end

function Wrappers.GetPendingTransmogCost(): Maybe<GetPendingTransmogCostResults>
	local r1, r2 = C_TransmogOutfitInfo.GetPendingTransmogCost()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		cost = r1,
		modifierFlags = r2,
	})
end

function Wrappers.GetPendingTransmogCostInto(reuse: GetPendingTransmogCostResults): Maybe<GetPendingTransmogCostResults>
	local r1, r2 = C_TransmogOutfitInfo.GetPendingTransmogCost()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.cost = r1
	fields.modifierFlags = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSetSourcesForSlot(
	transmogSetID: number,
	slot: Enum_TransmogOutfitSlot
): Maybe<{ AppearanceSourceInfo }>
	return Maybe.of(C_TransmogOutfitInfo.GetSetSourcesForSlot(transmogSetID, slot))
end

function Wrappers.GetSetSourcesForSlotInto(
	reuse: Maybe<{ AppearanceSourceInfo }>,
	transmogSetID: number,
	slot: Enum_TransmogOutfitSlot
): Maybe<{ AppearanceSourceInfo }>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetSetSourcesForSlot(transmogSetID, slot))
end

function Wrappers.GetSlotGroupInfo(): Maybe<{ TransmogOutfitSlotGroup }>
	return Maybe.of(C_TransmogOutfitInfo.GetSlotGroupInfo())
end

function Wrappers.GetSlotGroupInfoInto(reuse: Maybe<{ TransmogOutfitSlotGroup }>): Maybe<{ TransmogOutfitSlotGroup }>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetSlotGroupInfo())
end

function Wrappers.GetSourceIDsForSlot(transmogSetID: number, slot: Enum_TransmogOutfitSlot): Maybe<{ number }>
	return Maybe.of(C_TransmogOutfitInfo.GetSourceIDsForSlot(transmogSetID, slot))
end

function Wrappers.GetSourceIDsForSlotInto(
	reuse: Maybe<{ number }>,
	transmogSetID: number,
	slot: Enum_TransmogOutfitSlot
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetSourceIDsForSlot(transmogSetID, slot))
end

function Wrappers.GetTransmogOutfitSlotForInventoryType(
	inventoryType: Enum_InventoryType
): Maybe<Enum_TransmogOutfitSlot>
	return Maybe.of(C_TransmogOutfitInfo.GetTransmogOutfitSlotForInventoryType(inventoryType))
end

function Wrappers.GetTransmogOutfitSlotForInventoryTypeInto(
	reuse: Maybe<Enum_TransmogOutfitSlot>,
	inventoryType: Enum_InventoryType
): Maybe<Enum_TransmogOutfitSlot>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetTransmogOutfitSlotForInventoryType(inventoryType))
end

function Wrappers.GetTransmogOutfitSlotFromInventorySlot(inventorySlot: InventorySlots): Maybe<Enum_TransmogOutfitSlot>
	return Maybe.of(C_TransmogOutfitInfo.GetTransmogOutfitSlotFromInventorySlot(inventorySlot))
end

function Wrappers.GetTransmogOutfitSlotFromInventorySlotInto(
	reuse: Maybe<Enum_TransmogOutfitSlot>,
	inventorySlot: InventorySlots
): Maybe<Enum_TransmogOutfitSlot>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetTransmogOutfitSlotFromInventorySlot(inventorySlot))
end

function Wrappers.GetUISituationCategoriesAndOptions(): Maybe<{ TransmogSituationCategory }>
	return Maybe.of(C_TransmogOutfitInfo.GetUISituationCategoriesAndOptions())
end

function Wrappers.GetUISituationCategoriesAndOptionsInto(
	reuse: Maybe<{ TransmogSituationCategory }>
): Maybe<{ TransmogSituationCategory }>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetUISituationCategoriesAndOptions())
end

function Wrappers.GetUnassignedAtlasForSlot(slot: Enum_TransmogOutfitSlot): Maybe<textureAtlas>
	return Maybe.of(C_TransmogOutfitInfo.GetUnassignedAtlasForSlot(slot))
end

function Wrappers.GetUnassignedAtlasForSlotInto(
	reuse: Maybe<textureAtlas>,
	slot: Enum_TransmogOutfitSlot
): Maybe<textureAtlas>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetUnassignedAtlasForSlot(slot))
end

function Wrappers.GetUnassignedDisplayAtlasForSlot(slot: Enum_TransmogOutfitSlot): Maybe<textureAtlas>
	return Maybe.of(C_TransmogOutfitInfo.GetUnassignedDisplayAtlasForSlot(slot))
end

function Wrappers.GetUnassignedDisplayAtlasForSlotInto(
	reuse: Maybe<textureAtlas>,
	slot: Enum_TransmogOutfitSlot
): Maybe<textureAtlas>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetUnassignedDisplayAtlasForSlot(slot))
end

function Wrappers.GetViewedOutfitSlotInfo(
	slot: Enum_TransmogOutfitSlot,
	type: Enum_TransmogType,
	option: Enum_TransmogOutfitSlotOption
): Maybe<ViewedTransmogOutfitSlotInfo>
	return Maybe.of(C_TransmogOutfitInfo.GetViewedOutfitSlotInfo(slot, type, option))
end

function Wrappers.GetViewedOutfitSlotInfoInto(
	reuse: Maybe<ViewedTransmogOutfitSlotInfo>,
	slot: Enum_TransmogOutfitSlot,
	type: Enum_TransmogType,
	option: Enum_TransmogOutfitSlotOption
): Maybe<ViewedTransmogOutfitSlotInfo>
	return Reuse.maybe(reuse, C_TransmogOutfitInfo.GetViewedOutfitSlotInfo(slot, type, option))
end

return Wrappers
