--!strict
local Maybe = require("@truemyth/Maybe")
local Task = require("@truemyth/Task")

local Loads = require("../Runtime/Loads")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Task<T, E> = Task.Task<T, E>

export type CanItemTransmogAppearanceResults = {
	read canTransmog: boolean,
	read errorCode: Enum_TransmogOutfitSlotError,
}

export type GetDetailedItemLevelInfoResults = {
	read actualItemLevel: number,
	read previewLevel: boolean,
	read sparseItemLevel: number,
}

export type GetItemCooldownResults = {
	read startTimeSeconds: number,
	read durationSeconds: number,
	read enableCooldownTimer: boolean,
}

export type GetItemCreationContextResults = {
	read itemID: number,
	read creationContext: string,
}

export type GetItemGemResults = {
	read gemName: string,
	read gemLink: string,
}

export type GetItemInfoResults = {
	read itemName: string,
	read itemLink: string,
	read itemQuality: Enum_ItemQuality,
	read itemLevel: number,
	read itemMinLevel: number,
	read itemType: string,
	read itemSubType: string,
	read itemStackCount: number,
	read itemEquipLoc: string,
	read itemTexture: fileID,
	read sellPrice: number,
	read classID: number,
	read subclassID: number,
	read bindType: number,
	read expansionID: number,
	read setID: Maybe<number>,
	read isCraftingReagent: boolean,
	read itemDescription: string,
}

export type GetItemInfoInstantResults = {
	read itemID: number,
	read itemType: string,
	read itemSubType: string,
	read itemEquipLoc: string,
	read icon: fileID,
	read classID: number,
	read subClassID: number,
}

export type GetItemQualityColorResults = {
	read colorRGBR: number,
	read colorRGBG: number,
	read colorRGBB: number,
	read qualityString: string,
}

export type GetItemSpellResults = {
	read spellName: string,
	read spellID: number,
}

export type GetItemSubClassInfoResults = {
	read subClassName: string,
	read subClassUsesInvType: boolean,
}

export type GetItemUniquenessResults = {
	read limitCategory: number,
	read limitMax: number,
}

export type GetItemUniquenessByIDResults = {
	read isUnique: boolean,
	read limitCategoryName: Maybe<string>,
	read limitCategoryCount: Maybe<number>,
	read limitCategoryID: Maybe<number>,
}

export type GetLimitedCurrencyItemInfoResults = {
	read name: string,
	read icon: fileID,
	read quantity: number,
	read maxQuantity: number,
	read totalEarned: number,
}

export type IsUsableItemResults = {
	read usable: boolean,
	read noMana: boolean,
}

local Wrappers = {}

function Wrappers.CanItemTransmogAppearance(itemLoc: ItemLocationMixin): CanItemTransmogAppearanceResults
	local r1, r2 = C_Item.CanItemTransmogAppearance(itemLoc)
	return {
		canTransmog = r1,
		errorCode = r2,
	}
end

function Wrappers.CanItemTransmogAppearanceInto(
	reuse: CanItemTransmogAppearanceResults,
	itemLoc: ItemLocationMixin
): CanItemTransmogAppearanceResults
	local r1, r2 = C_Item.CanItemTransmogAppearance(itemLoc)
	local fields = Reuse.fields(reuse)
	fields.canTransmog = r1
	fields.errorCode = r2
	return reuse
end

function Wrappers.GetAppliedItemTransmogInfo(itemLoc: ItemLocationMixin): Maybe<ItemTransmogInfoMixin>
	return Maybe.of(C_Item.GetAppliedItemTransmogInfo(itemLoc))
end

function Wrappers.GetAppliedItemTransmogInfoInto(
	reuse: Maybe<ItemTransmogInfoMixin>,
	itemLoc: ItemLocationMixin
): Maybe<ItemTransmogInfoMixin>
	return Reuse.maybe(reuse, C_Item.GetAppliedItemTransmogInfo(itemLoc))
end

function Wrappers.GetBaseItemTransmogInfo(itemLoc: ItemLocationMixin): Maybe<ItemTransmogInfoMixin>
	return Maybe.of(C_Item.GetBaseItemTransmogInfo(itemLoc))
end

function Wrappers.GetBaseItemTransmogInfoInto(
	reuse: Maybe<ItemTransmogInfoMixin>,
	itemLoc: ItemLocationMixin
): Maybe<ItemTransmogInfoMixin>
	return Reuse.maybe(reuse, C_Item.GetBaseItemTransmogInfo(itemLoc))
end

function Wrappers.GetCurrentItemLevel(itemLocation: ItemLocationMixin): Maybe<number>
	return Maybe.of(C_Item.GetCurrentItemLevel(itemLocation))
end

function Wrappers.GetCurrentItemLevelInto(reuse: Maybe<number>, itemLocation: ItemLocationMixin): Maybe<number>
	return Reuse.maybe(reuse, C_Item.GetCurrentItemLevel(itemLocation))
end

function Wrappers.GetCurrentItemTransmogInfo(itemLoc: ItemLocationMixin): Maybe<ItemTransmogInfoMixin>
	return Maybe.of(C_Item.GetCurrentItemTransmogInfo(itemLoc))
end

function Wrappers.GetCurrentItemTransmogInfoInto(
	reuse: Maybe<ItemTransmogInfoMixin>,
	itemLoc: ItemLocationMixin
): Maybe<ItemTransmogInfoMixin>
	return Reuse.maybe(reuse, C_Item.GetCurrentItemTransmogInfo(itemLoc))
end

function Wrappers.GetDelvePreviewItemLink(itemID: number, context: Enum_ItemCreationContext): Maybe<string>
	return Maybe.of(C_Item.GetDelvePreviewItemLink(itemID, context))
end

function Wrappers.GetDelvePreviewItemLinkInto(
	reuse: Maybe<string>,
	itemID: number,
	context: Enum_ItemCreationContext
): Maybe<string>
	return Reuse.maybe(reuse, C_Item.GetDelvePreviewItemLink(itemID, context))
end

function Wrappers.GetDetailedItemLevelInfo(itemInfo: ItemInfo): Maybe<GetDetailedItemLevelInfoResults>
	local r1, r2, r3 = C_Item.GetDetailedItemLevelInfo(itemInfo)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		actualItemLevel = r1,
		previewLevel = r2,
		sparseItemLevel = r3,
	})
end

function Wrappers.GetDetailedItemLevelInfoInto(
	reuse: GetDetailedItemLevelInfoResults,
	itemInfo: ItemInfo
): Maybe<GetDetailedItemLevelInfoResults>
	local r1, r2, r3 = C_Item.GetDetailedItemLevelInfo(itemInfo)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.actualItemLevel = r1
	fields.previewLevel = r2
	fields.sparseItemLevel = r3
	return Reuse.just(reuse)
end

function Wrappers.GetFirstTriggeredSpellForItem(itemID: number, itemQuality: Enum_ItemQuality): Maybe<number>
	return Maybe.of(C_Item.GetFirstTriggeredSpellForItem(itemID, itemQuality))
end

function Wrappers.GetFirstTriggeredSpellForItemInto(
	reuse: Maybe<number>,
	itemID: number,
	itemQuality: Enum_ItemQuality
): Maybe<number>
	return Reuse.maybe(reuse, C_Item.GetFirstTriggeredSpellForItem(itemID, itemQuality))
end

function Wrappers.GetItemConversionOutputIcon(itemLoc: ItemLocationMixin): Maybe<fileID>
	return Maybe.of(C_Item.GetItemConversionOutputIcon(itemLoc))
end

function Wrappers.GetItemConversionOutputIconInto(reuse: Maybe<fileID>, itemLoc: ItemLocationMixin): Maybe<fileID>
	return Reuse.maybe(reuse, C_Item.GetItemConversionOutputIcon(itemLoc))
end

function Wrappers.GetItemCooldown(itemInfo: ItemInfo): GetItemCooldownResults
	local r1, r2, r3 = C_Item.GetItemCooldown(itemInfo)
	return {
		startTimeSeconds = r1,
		durationSeconds = r2,
		enableCooldownTimer = r3,
	}
end

function Wrappers.GetItemCooldownInto(reuse: GetItemCooldownResults, itemInfo: ItemInfo): GetItemCooldownResults
	local r1, r2, r3 = C_Item.GetItemCooldown(itemInfo)
	local fields = Reuse.fields(reuse)
	fields.startTimeSeconds = r1
	fields.durationSeconds = r2
	fields.enableCooldownTimer = r3
	return reuse
end

function Wrappers.GetItemCreationContext(itemInfo: ItemInfo): GetItemCreationContextResults
	local r1, r2 = C_Item.GetItemCreationContext(itemInfo)
	return {
		itemID = r1,
		creationContext = r2,
	}
end

function Wrappers.GetItemCreationContextInto(
	reuse: GetItemCreationContextResults,
	itemInfo: ItemInfo
): GetItemCreationContextResults
	local r1, r2 = C_Item.GetItemCreationContext(itemInfo)
	local fields = Reuse.fields(reuse)
	fields.itemID = r1
	fields.creationContext = r2
	return reuse
end

function Wrappers.GetItemFamily(itemInfo: ItemInfo): Maybe<number>
	return Maybe.of(C_Item.GetItemFamily(itemInfo))
end

function Wrappers.GetItemFamilyInto(reuse: Maybe<number>, itemInfo: ItemInfo): Maybe<number>
	return Reuse.maybe(reuse, C_Item.GetItemFamily(itemInfo))
end

function Wrappers.GetItemGem(hyperlink: string, index: number): Maybe<GetItemGemResults>
	local r1, r2 = C_Item.GetItemGem(hyperlink, index)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		gemName = r1,
		gemLink = r2,
	})
end

function Wrappers.GetItemGemInto(reuse: GetItemGemResults, hyperlink: string, index: number): Maybe<GetItemGemResults>
	local r1, r2 = C_Item.GetItemGem(hyperlink, index)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.gemName = r1
	fields.gemLink = r2
	return Reuse.just(reuse)
end

function Wrappers.GetItemGemID(itemInfo: ItemInfo, index: number): Maybe<number>
	return Maybe.of(C_Item.GetItemGemID(itemInfo, index))
end

function Wrappers.GetItemGemIDInto(reuse: Maybe<number>, itemInfo: ItemInfo, index: number): Maybe<number>
	return Reuse.maybe(reuse, C_Item.GetItemGemID(itemInfo, index))
end

function Wrappers.GetItemIDByGUID(itemGUID: WOWGUID): Maybe<number>
	return Maybe.of(C_Item.GetItemIDByGUID(itemGUID))
end

function Wrappers.GetItemIDByGUIDInto(reuse: Maybe<number>, itemGUID: WOWGUID): Maybe<number>
	return Reuse.maybe(reuse, C_Item.GetItemIDByGUID(itemGUID))
end

function Wrappers.GetItemIcon(itemLocation: ItemLocationMixin): Maybe<fileID>
	return Maybe.of(C_Item.GetItemIcon(itemLocation))
end

function Wrappers.GetItemIconInto(reuse: Maybe<fileID>, itemLocation: ItemLocationMixin): Maybe<fileID>
	return Reuse.maybe(reuse, C_Item.GetItemIcon(itemLocation))
end

function Wrappers.GetItemIconByID(itemInfo: ItemInfo): Maybe<fileID>
	return Maybe.of(C_Item.GetItemIconByID(itemInfo))
end

function Wrappers.GetItemIconByIDInto(reuse: Maybe<fileID>, itemInfo: ItemInfo): Maybe<fileID>
	return Reuse.maybe(reuse, C_Item.GetItemIconByID(itemInfo))
end

function Wrappers.GetItemInfo(itemInfo: ItemInfo): Maybe<GetItemInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 = C_Item.GetItemInfo(itemInfo)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
		or r14 == nil
		or r15 == nil
		or r17 == nil
		or r18 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemName = r1,
		itemLink = r2,
		itemQuality = r3,
		itemLevel = r4,
		itemMinLevel = r5,
		itemType = r6,
		itemSubType = r7,
		itemStackCount = r8,
		itemEquipLoc = r9,
		itemTexture = r10,
		sellPrice = r11,
		classID = r12,
		subclassID = r13,
		bindType = r14,
		expansionID = r15,
		setID = Maybe.of(r16),
		isCraftingReagent = r17,
		itemDescription = r18,
	})
end

function Wrappers.GetItemInfoInto(reuse: GetItemInfoResults, itemInfo: ItemInfo): Maybe<GetItemInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 = C_Item.GetItemInfo(itemInfo)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
		or r14 == nil
		or r15 == nil
		or r17 == nil
		or r18 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemName = r1
	fields.itemLink = r2
	fields.itemQuality = r3
	fields.itemLevel = r4
	fields.itemMinLevel = r5
	fields.itemType = r6
	fields.itemSubType = r7
	fields.itemStackCount = r8
	fields.itemEquipLoc = r9
	fields.itemTexture = r10
	fields.sellPrice = r11
	fields.classID = r12
	fields.subclassID = r13
	fields.bindType = r14
	fields.expansionID = r15
	fields.setID = Reuse.maybe(fields.setID, r16)
	fields.isCraftingReagent = r17
	fields.itemDescription = r18
	return Reuse.just(reuse)
end

function Wrappers.GetItemInfoAsync(itemInfo: ItemInfo): Task<GetItemInfoResults, Loads.LoadFailed>
	return Loads.load({
		api = "C_Item.GetItemInfo",
		event = "ITEM_DATA_LOAD_RESULT",
		key = C_Item.GetItemIDForItemInfo(itemInfo),
		request = C_Item.RequestLoadItemDataByID,
		read = function(): Maybe<GetItemInfoResults>
			return Wrappers.GetItemInfo(itemInfo)
		end,
	})
end

function Wrappers.GetItemInfoInstant(itemInfo: ItemInfo): Maybe<GetItemInfoInstantResults>
	local r1, r2, r3, r4, r5, r6, r7 = C_Item.GetItemInfoInstant(itemInfo)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemID = r1,
		itemType = r2,
		itemSubType = r3,
		itemEquipLoc = r4,
		icon = r5,
		classID = r6,
		subClassID = r7,
	})
end

function Wrappers.GetItemInfoInstantInto(
	reuse: GetItemInfoInstantResults,
	itemInfo: ItemInfo
): Maybe<GetItemInfoInstantResults>
	local r1, r2, r3, r4, r5, r6, r7 = C_Item.GetItemInfoInstant(itemInfo)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemID = r1
	fields.itemType = r2
	fields.itemSubType = r3
	fields.itemEquipLoc = r4
	fields.icon = r5
	fields.classID = r6
	fields.subClassID = r7
	return Reuse.just(reuse)
end

function Wrappers.GetItemInventoryType(itemLocation: ItemLocationMixin): Maybe<Enum_InventoryType>
	return Maybe.of(C_Item.GetItemInventoryType(itemLocation))
end

function Wrappers.GetItemInventoryTypeInto(
	reuse: Maybe<Enum_InventoryType>,
	itemLocation: ItemLocationMixin
): Maybe<Enum_InventoryType>
	return Reuse.maybe(reuse, C_Item.GetItemInventoryType(itemLocation))
end

function Wrappers.GetItemInventoryTypeByID(itemInfo: ItemInfo): Maybe<Enum_InventoryType>
	return Maybe.of(C_Item.GetItemInventoryTypeByID(itemInfo))
end

function Wrappers.GetItemInventoryTypeByIDInto(
	reuse: Maybe<Enum_InventoryType>,
	itemInfo: ItemInfo
): Maybe<Enum_InventoryType>
	return Reuse.maybe(reuse, C_Item.GetItemInventoryTypeByID(itemInfo))
end

function Wrappers.GetItemLearnTransmogSet(itemInfo: ItemInfo): Maybe<number>
	return Maybe.of(C_Item.GetItemLearnTransmogSet(itemInfo))
end

function Wrappers.GetItemLearnTransmogSetInto(reuse: Maybe<number>, itemInfo: ItemInfo): Maybe<number>
	return Reuse.maybe(reuse, C_Item.GetItemLearnTransmogSet(itemInfo))
end

function Wrappers.GetItemLink(itemLocation: ItemLocationMixin): Maybe<string>
	return Maybe.of(C_Item.GetItemLink(itemLocation))
end

function Wrappers.GetItemLinkInto(reuse: Maybe<string>, itemLocation: ItemLocationMixin): Maybe<string>
	return Reuse.maybe(reuse, C_Item.GetItemLink(itemLocation))
end

function Wrappers.GetItemLinkByGUID(itemGUID: WOWGUID): Maybe<string>
	return Maybe.of(C_Item.GetItemLinkByGUID(itemGUID))
end

function Wrappers.GetItemLinkByGUIDInto(reuse: Maybe<string>, itemGUID: WOWGUID): Maybe<string>
	return Reuse.maybe(reuse, C_Item.GetItemLinkByGUID(itemGUID))
end

function Wrappers.GetItemLocation(itemGUID: WOWGUID): Maybe<ItemLocationMixin>
	return Maybe.of(C_Item.GetItemLocation(itemGUID))
end

function Wrappers.GetItemLocationInto(reuse: Maybe<ItemLocationMixin>, itemGUID: WOWGUID): Maybe<ItemLocationMixin>
	return Reuse.maybe(reuse, C_Item.GetItemLocation(itemGUID))
end

function Wrappers.GetItemMaxStackSize(itemLocation: ItemLocationMixin): Maybe<number>
	return Maybe.of(C_Item.GetItemMaxStackSize(itemLocation))
end

function Wrappers.GetItemMaxStackSizeInto(reuse: Maybe<number>, itemLocation: ItemLocationMixin): Maybe<number>
	return Reuse.maybe(reuse, C_Item.GetItemMaxStackSize(itemLocation))
end

function Wrappers.GetItemMaxStackSizeByID(itemInfo: ItemInfo): Maybe<number>
	return Maybe.of(C_Item.GetItemMaxStackSizeByID(itemInfo))
end

function Wrappers.GetItemMaxStackSizeByIDInto(reuse: Maybe<number>, itemInfo: ItemInfo): Maybe<number>
	return Reuse.maybe(reuse, C_Item.GetItemMaxStackSizeByID(itemInfo))
end

function Wrappers.GetItemName(itemLocation: ItemLocationMixin): Maybe<string>
	return Maybe.of(C_Item.GetItemName(itemLocation))
end

function Wrappers.GetItemNameInto(reuse: Maybe<string>, itemLocation: ItemLocationMixin): Maybe<string>
	return Reuse.maybe(reuse, C_Item.GetItemName(itemLocation))
end

function Wrappers.GetItemNameByID(itemInfo: ItemInfo): Maybe<string>
	return Maybe.of(C_Item.GetItemNameByID(itemInfo))
end

function Wrappers.GetItemNameByIDInto(reuse: Maybe<string>, itemInfo: ItemInfo): Maybe<string>
	return Reuse.maybe(reuse, C_Item.GetItemNameByID(itemInfo))
end

function Wrappers.GetItemNameByIDAsync(itemInfo: ItemInfo): Task<string, Loads.LoadFailed>
	return Loads.load({
		api = "C_Item.GetItemNameByID",
		event = "ITEM_DATA_LOAD_RESULT",
		key = C_Item.GetItemIDForItemInfo(itemInfo),
		request = C_Item.RequestLoadItemDataByID,
		read = function(): Maybe<string>
			return Wrappers.GetItemNameByID(itemInfo)
		end,
	})
end

function Wrappers.GetItemQuality(itemLocation: ItemLocationMixin): Maybe<Enum_ItemQuality>
	return Maybe.of(C_Item.GetItemQuality(itemLocation))
end

function Wrappers.GetItemQualityInto(
	reuse: Maybe<Enum_ItemQuality>,
	itemLocation: ItemLocationMixin
): Maybe<Enum_ItemQuality>
	return Reuse.maybe(reuse, C_Item.GetItemQuality(itemLocation))
end

function Wrappers.GetItemQualityByID(itemInfo: ItemInfo): Maybe<Enum_ItemQuality>
	return Maybe.of(C_Item.GetItemQualityByID(itemInfo))
end

function Wrappers.GetItemQualityByIDInto(reuse: Maybe<Enum_ItemQuality>, itemInfo: ItemInfo): Maybe<Enum_ItemQuality>
	return Reuse.maybe(reuse, C_Item.GetItemQualityByID(itemInfo))
end

function Wrappers.GetItemQualityColor(quality: Enum_ItemQuality): GetItemQualityColorResults
	local r1, r2, r3, r4 = C_Item.GetItemQualityColor(quality)
	return {
		colorRGBR = r1,
		colorRGBG = r2,
		colorRGBB = r3,
		qualityString = r4,
	}
end

function Wrappers.GetItemQualityColorInto(
	reuse: GetItemQualityColorResults,
	quality: Enum_ItemQuality
): GetItemQualityColorResults
	local r1, r2, r3, r4 = C_Item.GetItemQualityColor(quality)
	local fields = Reuse.fields(reuse)
	fields.colorRGBR = r1
	fields.colorRGBG = r2
	fields.colorRGBB = r3
	fields.qualityString = r4
	return reuse
end

function Wrappers.GetItemSpecInfo(itemInfo: ItemInfo): Maybe<{ number }>
	return Maybe.of(C_Item.GetItemSpecInfo(itemInfo))
end

function Wrappers.GetItemSpecInfoInto(reuse: Maybe<{ number }>, itemInfo: ItemInfo): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Item.GetItemSpecInfo(itemInfo))
end

function Wrappers.GetItemSpell(itemInfo: ItemInfo): Maybe<GetItemSpellResults>
	local r1, r2 = C_Item.GetItemSpell(itemInfo)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		spellName = r1,
		spellID = r2,
	})
end

function Wrappers.GetItemSpellInto(reuse: GetItemSpellResults, itemInfo: ItemInfo): Maybe<GetItemSpellResults>
	local r1, r2 = C_Item.GetItemSpell(itemInfo)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.spellName = r1
	fields.spellID = r2
	return Reuse.just(reuse)
end

function Wrappers.GetItemStatDelta(itemLink1: string, itemLink2: string): Maybe<unknown>
	return Maybe.of(C_Item.GetItemStatDelta(itemLink1, itemLink2))
end

function Wrappers.GetItemStatDeltaInto(reuse: Maybe<unknown>, itemLink1: string, itemLink2: string): Maybe<unknown>
	return Reuse.maybe(reuse, C_Item.GetItemStatDelta(itemLink1, itemLink2))
end

function Wrappers.GetItemStats(itemLink: string): Maybe<unknown>
	return Maybe.of(C_Item.GetItemStats(itemLink))
end

function Wrappers.GetItemStatsInto(reuse: Maybe<unknown>, itemLink: string): Maybe<unknown>
	return Reuse.maybe(reuse, C_Item.GetItemStats(itemLink))
end

function Wrappers.GetItemSubClassInfo(itemClassID: number, itemSubClassID: number): Maybe<GetItemSubClassInfoResults>
	local r1, r2 = C_Item.GetItemSubClassInfo(itemClassID, itemSubClassID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		subClassName = r1,
		subClassUsesInvType = r2,
	})
end

function Wrappers.GetItemSubClassInfoInto(
	reuse: GetItemSubClassInfoResults,
	itemClassID: number,
	itemSubClassID: number
): Maybe<GetItemSubClassInfoResults>
	local r1, r2 = C_Item.GetItemSubClassInfo(itemClassID, itemSubClassID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.subClassName = r1
	fields.subClassUsesInvType = r2
	return Reuse.just(reuse)
end

function Wrappers.GetItemUniqueness(itemInfo: ItemInfo): Maybe<GetItemUniquenessResults>
	local r1, r2 = C_Item.GetItemUniqueness(itemInfo)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		limitCategory = r1,
		limitMax = r2,
	})
end

function Wrappers.GetItemUniquenessInto(
	reuse: GetItemUniquenessResults,
	itemInfo: ItemInfo
): Maybe<GetItemUniquenessResults>
	local r1, r2 = C_Item.GetItemUniqueness(itemInfo)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.limitCategory = r1
	fields.limitMax = r2
	return Reuse.just(reuse)
end

function Wrappers.GetItemUniquenessByID(itemInfo: ItemInfo): Maybe<GetItemUniquenessByIDResults>
	local r1, r2, r3, r4 = C_Item.GetItemUniquenessByID(itemInfo)
	if r1 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		isUnique = r1,
		limitCategoryName = Maybe.of(r2),
		limitCategoryCount = Maybe.of(r3),
		limitCategoryID = Maybe.of(r4),
	})
end

function Wrappers.GetItemUniquenessByIDInto(
	reuse: GetItemUniquenessByIDResults,
	itemInfo: ItemInfo
): Maybe<GetItemUniquenessByIDResults>
	local r1, r2, r3, r4 = C_Item.GetItemUniquenessByID(itemInfo)
	if r1 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.isUnique = r1
	fields.limitCategoryName = Reuse.maybe(fields.limitCategoryName, r2)
	fields.limitCategoryCount = Reuse.maybe(fields.limitCategoryCount, r3)
	fields.limitCategoryID = Reuse.maybe(fields.limitCategoryID, r4)
	return Reuse.just(reuse)
end

function Wrappers.GetItemUpgradeInfo(itemInfo: ItemInfo): Maybe<ItemUpgradeInfo>
	return Maybe.of(C_Item.GetItemUpgradeInfo(itemInfo))
end

function Wrappers.GetItemUpgradeInfoInto(reuse: Maybe<ItemUpgradeInfo>, itemInfo: ItemInfo): Maybe<ItemUpgradeInfo>
	return Reuse.maybe(reuse, C_Item.GetItemUpgradeInfo(itemInfo))
end

function Wrappers.GetLimitedCurrencyItemInfo(itemInfo: ItemInfo): Maybe<GetLimitedCurrencyItemInfoResults>
	local r1, r2, r3, r4, r5 = C_Item.GetLimitedCurrencyItemInfo(itemInfo)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		icon = r2,
		quantity = r3,
		maxQuantity = r4,
		totalEarned = r5,
	})
end

function Wrappers.GetLimitedCurrencyItemInfoInto(
	reuse: GetLimitedCurrencyItemInfoResults,
	itemInfo: ItemInfo
): Maybe<GetLimitedCurrencyItemInfoResults>
	local r1, r2, r3, r4, r5 = C_Item.GetLimitedCurrencyItemInfo(itemInfo)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.quantity = r3
	fields.maxQuantity = r4
	fields.totalEarned = r5
	return Reuse.just(reuse)
end

function Wrappers.GetSetBonusesForSpecializationByItemID(specID: number, itemID: number): Maybe<{ number }>
	return Maybe.of(C_Item.GetSetBonusesForSpecializationByItemID(specID, itemID))
end

function Wrappers.GetSetBonusesForSpecializationByItemIDInto(
	reuse: Maybe<{ number }>,
	specID: number,
	itemID: number
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Item.GetSetBonusesForSpecializationByItemID(specID, itemID))
end

function Wrappers.IsCorruptedItem(itemInfo: ItemInfo): Maybe<boolean>
	return Maybe.of(C_Item.IsCorruptedItem(itemInfo))
end

function Wrappers.IsCorruptedItemInto(reuse: Maybe<boolean>, itemInfo: ItemInfo): Maybe<boolean>
	return Reuse.maybe(reuse, C_Item.IsCorruptedItem(itemInfo))
end

function Wrappers.IsCosmeticItem(itemInfo: ItemInfo): Maybe<boolean>
	return Maybe.of(C_Item.IsCosmeticItem(itemInfo))
end

function Wrappers.IsCosmeticItemInto(reuse: Maybe<boolean>, itemInfo: ItemInfo): Maybe<boolean>
	return Reuse.maybe(reuse, C_Item.IsCosmeticItem(itemInfo))
end

function Wrappers.IsCurioItem(itemInfo: ItemInfo): Maybe<boolean>
	return Maybe.of(C_Item.IsCurioItem(itemInfo))
end

function Wrappers.IsCurioItemInto(reuse: Maybe<boolean>, itemInfo: ItemInfo): Maybe<boolean>
	return Reuse.maybe(reuse, C_Item.IsCurioItem(itemInfo))
end

function Wrappers.IsDecorItem(itemInfo: ItemInfo): Maybe<boolean>
	return Maybe.of(C_Item.IsDecorItem(itemInfo))
end

function Wrappers.IsDecorItemInto(reuse: Maybe<boolean>, itemInfo: ItemInfo): Maybe<boolean>
	return Reuse.maybe(reuse, C_Item.IsDecorItem(itemInfo))
end

function Wrappers.IsItemInRange(itemInfo: ItemInfo, targetToken: string): Maybe<boolean>
	return Maybe.of(C_Item.IsItemInRange(itemInfo, targetToken))
end

function Wrappers.IsItemInRangeInto(reuse: Maybe<boolean>, itemInfo: ItemInfo, targetToken: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_Item.IsItemInRange(itemInfo, targetToken))
end

function Wrappers.IsRelicItem(itemInfo: ItemInfo): Maybe<boolean>
	return Maybe.of(C_Item.IsRelicItem(itemInfo))
end

function Wrappers.IsRelicItemInto(reuse: Maybe<boolean>, itemInfo: ItemInfo): Maybe<boolean>
	return Reuse.maybe(reuse, C_Item.IsRelicItem(itemInfo))
end

function Wrappers.IsUsableItem(itemInfo: ItemInfo): IsUsableItemResults
	local r1, r2 = C_Item.IsUsableItem(itemInfo)
	return {
		usable = r1,
		noMana = r2,
	}
end

function Wrappers.IsUsableItemInto(reuse: IsUsableItemResults, itemInfo: ItemInfo): IsUsableItemResults
	local r1, r2 = C_Item.IsUsableItem(itemInfo)
	local fields = Reuse.fields(reuse)
	fields.usable = r1
	fields.noMana = r2
	return reuse
end

return Wrappers
