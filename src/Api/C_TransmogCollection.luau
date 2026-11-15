--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type AccountCanCollectSourceResults = {
	read hasItemData: boolean,
	read canCollect: boolean,
}

export type GetArtifactAppearanceStringsResults = {
	read name: string,
	read hyperlink: string,
}

export type GetCategoryInfoResults = {
	read name: string,
	read isWeapon: boolean,
	read canHaveIllusions: boolean,
	read canMainHand: boolean,
	read canOffHand: boolean,
	read canRanged: boolean,
}

export type GetCustomSetInfoResults = {
	read name: string,
	read icon: fileID,
}

export type GetIllusionStringsResults = {
	read name: string,
	read hyperlink: string,
	read sourceText: Maybe<string>,
}

export type GetItemInfoResults = {
	read itemAppearanceID: number,
	read itemModifiedAppearanceID: number,
}

export type GetLatestAppearanceResults = {
	read visualID: number,
	read category: Enum_TransmogCollectionType,
}

export type PlayerCanCollectSourceResults = {
	read hasItemData: boolean,
	read canCollect: boolean,
}

local Wrappers = {}

function Wrappers.AccountCanCollectSource(sourceID: number): AccountCanCollectSourceResults
	local r1, r2 = C_TransmogCollection.AccountCanCollectSource(sourceID)
	return {
		hasItemData = r1,
		canCollect = r2,
	}
end

function Wrappers.AccountCanCollectSourceInto(
	reuse: AccountCanCollectSourceResults,
	sourceID: number
): AccountCanCollectSourceResults
	local r1, r2 = C_TransmogCollection.AccountCanCollectSource(sourceID)
	local fields = Reuse.fields(reuse)
	fields.hasItemData = r1
	fields.canCollect = r2
	return reuse
end

function Wrappers.GetAppearanceInfoBySource(itemModifiedAppearanceID: number): Maybe<TransmogAppearanceInfoBySourceData>
	return Maybe.of(C_TransmogCollection.GetAppearanceInfoBySource(itemModifiedAppearanceID))
end

function Wrappers.GetAppearanceInfoBySourceInto(
	reuse: Maybe<TransmogAppearanceInfoBySourceData>,
	itemModifiedAppearanceID: number
): Maybe<TransmogAppearanceInfoBySourceData>
	return Reuse.maybe(reuse, C_TransmogCollection.GetAppearanceInfoBySource(itemModifiedAppearanceID))
end

function Wrappers.GetAppearanceSourceDrops(
	itemModifiedAppearanceID: number
): Maybe<{ TransmogAppearanceJournalEncounterInfo }>
	return Maybe.of(C_TransmogCollection.GetAppearanceSourceDrops(itemModifiedAppearanceID))
end

function Wrappers.GetAppearanceSourceDropsInto(
	reuse: Maybe<{ TransmogAppearanceJournalEncounterInfo }>,
	itemModifiedAppearanceID: number
): Maybe<{ TransmogAppearanceJournalEncounterInfo }>
	return Reuse.maybe(reuse, C_TransmogCollection.GetAppearanceSourceDrops(itemModifiedAppearanceID))
end

function Wrappers.GetAppearanceSourceInfo(itemModifiedAppearanceID: number): Maybe<TransmogAppearanceSourceInfoData>
	return Maybe.of(C_TransmogCollection.GetAppearanceSourceInfo(itemModifiedAppearanceID))
end

function Wrappers.GetAppearanceSourceInfoInto(
	reuse: Maybe<TransmogAppearanceSourceInfoData>,
	itemModifiedAppearanceID: number
): Maybe<TransmogAppearanceSourceInfoData>
	return Reuse.maybe(reuse, C_TransmogCollection.GetAppearanceSourceInfo(itemModifiedAppearanceID))
end

function Wrappers.GetAppearanceSources(
	appearanceID: number,
	categoryType: Enum_TransmogCollectionType?,
	transmogLocation: TransmogLocationMixin?
): Maybe<{ AppearanceSourceInfo }>
	return Maybe.of(C_TransmogCollection.GetAppearanceSources(appearanceID, categoryType, transmogLocation))
end

function Wrappers.GetAppearanceSourcesInto(
	reuse: Maybe<{ AppearanceSourceInfo }>,
	appearanceID: number,
	categoryType: Enum_TransmogCollectionType?,
	transmogLocation: TransmogLocationMixin?
): Maybe<{ AppearanceSourceInfo }>
	return Reuse.maybe(reuse, C_TransmogCollection.GetAppearanceSources(appearanceID, categoryType, transmogLocation))
end

function Wrappers.GetArtifactAppearanceStrings(appearanceID: number): Maybe<GetArtifactAppearanceStringsResults>
	local r1, r2 = C_TransmogCollection.GetArtifactAppearanceStrings(appearanceID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		hyperlink = r2,
	})
end

function Wrappers.GetArtifactAppearanceStringsInto(
	reuse: GetArtifactAppearanceStringsResults,
	appearanceID: number
): Maybe<GetArtifactAppearanceStringsResults>
	local r1, r2 = C_TransmogCollection.GetArtifactAppearanceStrings(appearanceID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.hyperlink = r2
	return Reuse.just(reuse)
end

function Wrappers.GetCategoryAppearances(
	category: Enum_TransmogCollectionType,
	transmogLocation: TransmogLocationMixin?,
	option: Enum_TransmogOutfitSlotOption?
): Maybe<{ TransmogCategoryAppearanceInfo }>
	return Maybe.of(C_TransmogCollection.GetCategoryAppearances(category, transmogLocation, option))
end

function Wrappers.GetCategoryAppearancesInto(
	reuse: Maybe<{ TransmogCategoryAppearanceInfo }>,
	category: Enum_TransmogCollectionType,
	transmogLocation: TransmogLocationMixin?,
	option: Enum_TransmogOutfitSlotOption?
): Maybe<{ TransmogCategoryAppearanceInfo }>
	return Reuse.maybe(reuse, C_TransmogCollection.GetCategoryAppearances(category, transmogLocation, option))
end

function Wrappers.GetCategoryForItem(itemModifiedAppearanceID: number): Maybe<Enum_TransmogCollectionType>
	return Maybe.of(C_TransmogCollection.GetCategoryForItem(itemModifiedAppearanceID))
end

function Wrappers.GetCategoryForItemInto(
	reuse: Maybe<Enum_TransmogCollectionType>,
	itemModifiedAppearanceID: number
): Maybe<Enum_TransmogCollectionType>
	return Reuse.maybe(reuse, C_TransmogCollection.GetCategoryForItem(itemModifiedAppearanceID))
end

function Wrappers.GetCategoryInfo(category: Enum_TransmogCollectionType): Maybe<GetCategoryInfoResults>
	local r1, r2, r3, r4, r5, r6 = C_TransmogCollection.GetCategoryInfo(category)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		isWeapon = r2,
		canHaveIllusions = r3,
		canMainHand = r4,
		canOffHand = r5,
		canRanged = r6,
	})
end

function Wrappers.GetCategoryInfoInto(
	reuse: GetCategoryInfoResults,
	category: Enum_TransmogCollectionType
): Maybe<GetCategoryInfoResults>
	local r1, r2, r3, r4, r5, r6 = C_TransmogCollection.GetCategoryInfo(category)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.isWeapon = r2
	fields.canHaveIllusions = r3
	fields.canMainHand = r4
	fields.canOffHand = r5
	fields.canRanged = r6
	return Reuse.just(reuse)
end

function Wrappers.GetCustomSetHyperlinkFromItemTransmogInfoList(
	itemTransmogInfoList: { ItemTransmogInfo }
): Maybe<string>
	return Maybe.of(C_TransmogCollection.GetCustomSetHyperlinkFromItemTransmogInfoList(itemTransmogInfoList))
end

function Wrappers.GetCustomSetHyperlinkFromItemTransmogInfoListInto(
	reuse: Maybe<string>,
	itemTransmogInfoList: { ItemTransmogInfo }
): Maybe<string>
	return Reuse.maybe(reuse, C_TransmogCollection.GetCustomSetHyperlinkFromItemTransmogInfoList(itemTransmogInfoList))
end

function Wrappers.GetCustomSetInfo(customSetID: number): Maybe<GetCustomSetInfoResults>
	local r1, r2 = C_TransmogCollection.GetCustomSetInfo(customSetID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		icon = r2,
	})
end

function Wrappers.GetCustomSetInfoInto(
	reuse: GetCustomSetInfoResults,
	customSetID: number
): Maybe<GetCustomSetInfoResults>
	local r1, r2 = C_TransmogCollection.GetCustomSetInfo(customSetID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	return Reuse.just(reuse)
end

function Wrappers.GetCustomSetItemTransmogInfoList(customSetID: number): Maybe<{ ItemTransmogInfo }>
	return Maybe.of(C_TransmogCollection.GetCustomSetItemTransmogInfoList(customSetID))
end

function Wrappers.GetCustomSetItemTransmogInfoListInto(
	reuse: Maybe<{ ItemTransmogInfo }>,
	customSetID: number
): Maybe<{ ItemTransmogInfo }>
	return Reuse.maybe(reuse, C_TransmogCollection.GetCustomSetItemTransmogInfoList(customSetID))
end

function Wrappers.GetFallbackWeaponAppearance(): Maybe<number>
	return Maybe.of(C_TransmogCollection.GetFallbackWeaponAppearance())
end

function Wrappers.GetFallbackWeaponAppearanceInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_TransmogCollection.GetFallbackWeaponAppearance())
end

function Wrappers.GetIllusionInfo(illusionID: number): Maybe<TransmogIllusionInfo>
	return Maybe.of(C_TransmogCollection.GetIllusionInfo(illusionID))
end

function Wrappers.GetIllusionInfoInto(
	reuse: Maybe<TransmogIllusionInfo>,
	illusionID: number
): Maybe<TransmogIllusionInfo>
	return Reuse.maybe(reuse, C_TransmogCollection.GetIllusionInfo(illusionID))
end

function Wrappers.GetIllusionStrings(illusionID: number): Maybe<GetIllusionStringsResults>
	local r1, r2, r3 = C_TransmogCollection.GetIllusionStrings(illusionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		hyperlink = r2,
		sourceText = Maybe.of(r3),
	})
end

function Wrappers.GetIllusionStringsInto(
	reuse: GetIllusionStringsResults,
	illusionID: number
): Maybe<GetIllusionStringsResults>
	local r1, r2, r3 = C_TransmogCollection.GetIllusionStrings(illusionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.hyperlink = r2
	fields.sourceText = Reuse.maybe(fields.sourceText, r3)
	return Reuse.just(reuse)
end

function Wrappers.GetInspectItemTransmogInfoList(): Maybe<{ ItemTransmogInfo }>
	return Maybe.of(C_TransmogCollection.GetInspectItemTransmogInfoList())
end

function Wrappers.GetInspectItemTransmogInfoListInto(reuse: Maybe<{ ItemTransmogInfo }>): Maybe<{ ItemTransmogInfo }>
	return Reuse.maybe(reuse, C_TransmogCollection.GetInspectItemTransmogInfoList())
end

function Wrappers.GetItemInfo(itemInfo: ItemInfo): Maybe<GetItemInfoResults>
	local r1, r2 = C_TransmogCollection.GetItemInfo(itemInfo)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemAppearanceID = r1,
		itemModifiedAppearanceID = r2,
	})
end

function Wrappers.GetItemInfoInto(reuse: GetItemInfoResults, itemInfo: ItemInfo): Maybe<GetItemInfoResults>
	local r1, r2 = C_TransmogCollection.GetItemInfo(itemInfo)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemAppearanceID = r1
	fields.itemModifiedAppearanceID = r2
	return Reuse.just(reuse)
end

function Wrappers.GetItemTransmogInfoListFromCustomSetHyperlink(hyperlink: string): Maybe<{ ItemTransmogInfo }>
	return Maybe.of(C_TransmogCollection.GetItemTransmogInfoListFromCustomSetHyperlink(hyperlink))
end

function Wrappers.GetItemTransmogInfoListFromCustomSetHyperlinkInto(
	reuse: Maybe<{ ItemTransmogInfo }>,
	hyperlink: string
): Maybe<{ ItemTransmogInfo }>
	return Reuse.maybe(reuse, C_TransmogCollection.GetItemTransmogInfoListFromCustomSetHyperlink(hyperlink))
end

function Wrappers.GetLatestAppearance(): Maybe<GetLatestAppearanceResults>
	local r1, r2 = C_TransmogCollection.GetLatestAppearance()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		visualID = r1,
		category = r2,
	})
end

function Wrappers.GetLatestAppearanceInto(reuse: GetLatestAppearanceResults): Maybe<GetLatestAppearanceResults>
	local r1, r2 = C_TransmogCollection.GetLatestAppearance()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.visualID = r1
	fields.category = r2
	return Reuse.just(reuse)
end

function Wrappers.GetPairedArtifactAppearance(itemModifiedAppearanceID: number): Maybe<number>
	return Maybe.of(C_TransmogCollection.GetPairedArtifactAppearance(itemModifiedAppearanceID))
end

function Wrappers.GetPairedArtifactAppearanceInto(reuse: Maybe<number>, itemModifiedAppearanceID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TransmogCollection.GetPairedArtifactAppearance(itemModifiedAppearanceID))
end

function Wrappers.GetSourceIcon(itemModifiedAppearanceID: number): Maybe<fileID>
	return Maybe.of(C_TransmogCollection.GetSourceIcon(itemModifiedAppearanceID))
end

function Wrappers.GetSourceIconInto(reuse: Maybe<fileID>, itemModifiedAppearanceID: number): Maybe<fileID>
	return Reuse.maybe(reuse, C_TransmogCollection.GetSourceIcon(itemModifiedAppearanceID))
end

function Wrappers.GetSourceInfo(sourceID: number): Maybe<AppearanceSourceInfo>
	return Maybe.of(C_TransmogCollection.GetSourceInfo(sourceID))
end

function Wrappers.GetSourceInfoInto(reuse: Maybe<AppearanceSourceInfo>, sourceID: number): Maybe<AppearanceSourceInfo>
	return Reuse.maybe(reuse, C_TransmogCollection.GetSourceInfo(sourceID))
end

function Wrappers.GetSourceItemID(itemModifiedAppearanceID: number): Maybe<number>
	return Maybe.of(C_TransmogCollection.GetSourceItemID(itemModifiedAppearanceID))
end

function Wrappers.GetSourceItemIDInto(reuse: Maybe<number>, itemModifiedAppearanceID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TransmogCollection.GetSourceItemID(itemModifiedAppearanceID))
end

function Wrappers.GetSourceRequiredHoliday(itemModifiedAppearanceID: number): Maybe<string>
	return Maybe.of(C_TransmogCollection.GetSourceRequiredHoliday(itemModifiedAppearanceID))
end

function Wrappers.GetSourceRequiredHolidayInto(reuse: Maybe<string>, itemModifiedAppearanceID: number): Maybe<string>
	return Reuse.maybe(reuse, C_TransmogCollection.GetSourceRequiredHoliday(itemModifiedAppearanceID))
end

function Wrappers.GetValidAppearanceSourcesForClass(
	appearanceID: number,
	classID: number,
	categoryType: Enum_TransmogCollectionType?,
	transmogLocation: TransmogLocationMixin?
): Maybe<{ AppearanceSourceInfo }>
	return Maybe.of(
		C_TransmogCollection.GetValidAppearanceSourcesForClass(appearanceID, classID, categoryType, transmogLocation)
	)
end

function Wrappers.GetValidAppearanceSourcesForClassInto(
	reuse: Maybe<{ AppearanceSourceInfo }>,
	appearanceID: number,
	classID: number,
	categoryType: Enum_TransmogCollectionType?,
	transmogLocation: TransmogLocationMixin?
): Maybe<{ AppearanceSourceInfo }>
	return Reuse.maybe(
		reuse,
		C_TransmogCollection.GetValidAppearanceSourcesForClass(appearanceID, classID, categoryType, transmogLocation)
	)
end

function Wrappers.NewCustomSet(name: string, icon: fileID, itemTransmogInfoList: { ItemTransmogInfo }): Maybe<number>
	return Maybe.of(C_TransmogCollection.NewCustomSet(name, icon, itemTransmogInfoList))
end

function Wrappers.NewCustomSetInto(
	reuse: Maybe<number>,
	name: string,
	icon: fileID,
	itemTransmogInfoList: { ItemTransmogInfo }
): Maybe<number>
	return Reuse.maybe(reuse, C_TransmogCollection.NewCustomSet(name, icon, itemTransmogInfoList))
end

function Wrappers.PlayerCanCollectSource(sourceID: number): PlayerCanCollectSourceResults
	local r1, r2 = C_TransmogCollection.PlayerCanCollectSource(sourceID)
	return {
		hasItemData = r1,
		canCollect = r2,
	}
end

function Wrappers.PlayerCanCollectSourceInto(
	reuse: PlayerCanCollectSourceResults,
	sourceID: number
): PlayerCanCollectSourceResults
	local r1, r2 = C_TransmogCollection.PlayerCanCollectSource(sourceID)
	local fields = Reuse.fields(reuse)
	fields.hasItemData = r1
	fields.canCollect = r2
	return reuse
end

return Wrappers
