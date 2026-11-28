--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetHideUnownedFlagsResults = {
	read cannotModifyHideUnowned: boolean,
	read alwaysShowUnowned: boolean,
}

export type GetOriginalCraftRecipeIDResults = {
	read recipeID: Maybe<number>,
	read skillLineAbilityID: Maybe<number>,
}

export type GetReagentSlotStatusResults = {
	read locked: boolean,
	read lockedReason: string,
}

export type GetTradeSkillLineForRecipeResults = {
	read tradeSkillID: number,
	read skillLineName: string,
	read parentTradeSkillID: number,
}

local Wrappers = {}

function Wrappers.GetCraftingOperationInfo(
	recipeID: number,
	craftingReagents: { CraftingReagentInfo },
	allocationItemGUID: WOWGUID?,
	applyConcentration: boolean
): Maybe<CraftingOperationInfo>
	return Maybe.of(
		C_TradeSkillUI.GetCraftingOperationInfo(recipeID, craftingReagents, allocationItemGUID, applyConcentration)
	)
end

function Wrappers.GetCraftingOperationInfoInto(
	reuse: Maybe<CraftingOperationInfo>,
	recipeID: number,
	craftingReagents: { CraftingReagentInfo },
	allocationItemGUID: WOWGUID?,
	applyConcentration: boolean
): Maybe<CraftingOperationInfo>
	return Reuse.maybe(
		reuse,
		C_TradeSkillUI.GetCraftingOperationInfo(recipeID, craftingReagents, allocationItemGUID, applyConcentration)
	)
end

function Wrappers.GetCraftingOperationInfoForOrder(
	recipeID: number,
	craftingReagents: { CraftingReagentInfo },
	orderID: BigUInteger,
	applyConcentration: boolean
): Maybe<CraftingOperationInfo>
	return Maybe.of(
		C_TradeSkillUI.GetCraftingOperationInfoForOrder(recipeID, craftingReagents, orderID, applyConcentration)
	)
end

function Wrappers.GetCraftingOperationInfoForOrderInto(
	reuse: Maybe<CraftingOperationInfo>,
	recipeID: number,
	craftingReagents: { CraftingReagentInfo },
	orderID: BigUInteger,
	applyConcentration: boolean
): Maybe<CraftingOperationInfo>
	return Reuse.maybe(
		reuse,
		C_TradeSkillUI.GetCraftingOperationInfoForOrder(recipeID, craftingReagents, orderID, applyConcentration)
	)
end

function Wrappers.GetFactionSpecificOutputItem(recipeSpellID: number): Maybe<number>
	return Maybe.of(C_TradeSkillUI.GetFactionSpecificOutputItem(recipeSpellID))
end

function Wrappers.GetFactionSpecificOutputItemInto(reuse: Maybe<number>, recipeSpellID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetFactionSpecificOutputItem(recipeSpellID))
end

function Wrappers.GetGatheringOperationInfo(recipeID: number): Maybe<GatheringOperationInfo>
	return Maybe.of(C_TradeSkillUI.GetGatheringOperationInfo(recipeID))
end

function Wrappers.GetGatheringOperationInfoInto(
	reuse: Maybe<GatheringOperationInfo>,
	recipeID: number
): Maybe<GatheringOperationInfo>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetGatheringOperationInfo(recipeID))
end

function Wrappers.GetHideUnownedFlags(recipeID: number): GetHideUnownedFlagsResults
	local r1, r2 = C_TradeSkillUI.GetHideUnownedFlags(recipeID)
	return {
		cannotModifyHideUnowned = r1,
		alwaysShowUnowned = r2,
	}
end

function Wrappers.GetHideUnownedFlagsInto(
	reuse: GetHideUnownedFlagsResults,
	recipeID: number
): GetHideUnownedFlagsResults
	local r1, r2 = C_TradeSkillUI.GetHideUnownedFlags(recipeID)
	local fields = Reuse.fields(reuse)
	fields.cannotModifyHideUnowned = r1
	fields.alwaysShowUnowned = r2
	return reuse
end

function Wrappers.GetItemCraftedQualityByItemInfo(itemInfo: ItemInfo): Maybe<number>
	return Maybe.of(C_TradeSkillUI.GetItemCraftedQualityByItemInfo(itemInfo))
end

function Wrappers.GetItemCraftedQualityByItemInfoInto(reuse: Maybe<number>, itemInfo: ItemInfo): Maybe<number>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetItemCraftedQualityByItemInfo(itemInfo))
end

function Wrappers.GetItemCraftedQualityInfo(itemInfo: ItemInfo): Maybe<CraftingQualityInfo>
	return Maybe.of(C_TradeSkillUI.GetItemCraftedQualityInfo(itemInfo))
end

function Wrappers.GetItemCraftedQualityInfoInto(
	reuse: Maybe<CraftingQualityInfo>,
	itemInfo: ItemInfo
): Maybe<CraftingQualityInfo>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetItemCraftedQualityInfo(itemInfo))
end

function Wrappers.GetItemReagentQualityByItemInfo(itemInfo: ItemInfo): Maybe<number>
	return Maybe.of(C_TradeSkillUI.GetItemReagentQualityByItemInfo(itemInfo))
end

function Wrappers.GetItemReagentQualityByItemInfoInto(reuse: Maybe<number>, itemInfo: ItemInfo): Maybe<number>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetItemReagentQualityByItemInfo(itemInfo))
end

function Wrappers.GetItemReagentQualityInfo(itemInfo: ItemInfo): Maybe<CraftingQualityInfo>
	return Maybe.of(C_TradeSkillUI.GetItemReagentQualityInfo(itemInfo))
end

function Wrappers.GetItemReagentQualityInfoInto(
	reuse: Maybe<CraftingQualityInfo>,
	itemInfo: ItemInfo
): Maybe<CraftingQualityInfo>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetItemReagentQualityInfo(itemInfo))
end

function Wrappers.GetOriginalCraftRecipeID(itemGUID: WOWGUID): GetOriginalCraftRecipeIDResults
	local r1, r2 = C_TradeSkillUI.GetOriginalCraftRecipeID(itemGUID)
	return {
		recipeID = Maybe.of(r1),
		skillLineAbilityID = Maybe.of(r2),
	}
end

function Wrappers.GetOriginalCraftRecipeIDInto(
	reuse: GetOriginalCraftRecipeIDResults,
	itemGUID: WOWGUID
): GetOriginalCraftRecipeIDResults
	local r1, r2 = C_TradeSkillUI.GetOriginalCraftRecipeID(itemGUID)
	local fields = Reuse.fields(reuse)
	fields.recipeID = Reuse.maybe(fields.recipeID, r1)
	fields.skillLineAbilityID = Reuse.maybe(fields.skillLineAbilityID, r2)
	return reuse
end

function Wrappers.GetProfessionByInventorySlot(slot: number): Maybe<Enum_Profession>
	return Maybe.of(C_TradeSkillUI.GetProfessionByInventorySlot(slot))
end

function Wrappers.GetProfessionByInventorySlotInto(reuse: Maybe<Enum_Profession>, slot: number): Maybe<Enum_Profession>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetProfessionByInventorySlot(slot))
end

function Wrappers.GetProfessionForCursorItem(): Maybe<Enum_Profession>
	return Maybe.of(C_TradeSkillUI.GetProfessionForCursorItem())
end

function Wrappers.GetProfessionForCursorItemInto(reuse: Maybe<Enum_Profession>): Maybe<Enum_Profession>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetProfessionForCursorItem())
end

function Wrappers.GetQualitiesForRecipe(recipeID: number): Maybe<{ number }>
	return Maybe.of(C_TradeSkillUI.GetQualitiesForRecipe(recipeID))
end

function Wrappers.GetQualitiesForRecipeInto(reuse: Maybe<{ number }>, recipeID: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetQualitiesForRecipe(recipeID))
end

function Wrappers.GetReagentSlotStatus(
	mcrSlotID: number,
	recipeSpellID: number,
	skillLineAbilityID: number
): GetReagentSlotStatusResults
	local r1, r2 = C_TradeSkillUI.GetReagentSlotStatus(mcrSlotID, recipeSpellID, skillLineAbilityID)
	return {
		locked = r1,
		lockedReason = r2,
	}
end

function Wrappers.GetReagentSlotStatusInto(
	reuse: GetReagentSlotStatusResults,
	mcrSlotID: number,
	recipeSpellID: number,
	skillLineAbilityID: number
): GetReagentSlotStatusResults
	local r1, r2 = C_TradeSkillUI.GetReagentSlotStatus(mcrSlotID, recipeSpellID, skillLineAbilityID)
	local fields = Reuse.fields(reuse)
	fields.locked = r1
	fields.lockedReason = r2
	return reuse
end

function Wrappers.GetRecipeInfo(recipeSpellID: number, recipeLevel: number?): Maybe<TradeSkillRecipeInfo>
	return Maybe.of(C_TradeSkillUI.GetRecipeInfo(recipeSpellID, recipeLevel))
end

function Wrappers.GetRecipeInfoInto(
	reuse: Maybe<TradeSkillRecipeInfo>,
	recipeSpellID: number,
	recipeLevel: number?
): Maybe<TradeSkillRecipeInfo>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetRecipeInfo(recipeSpellID, recipeLevel))
end

function Wrappers.GetRecipeInfoForSkillLineAbility(
	skillLineAbilityID: number,
	recipeLevel: number?
): Maybe<TradeSkillRecipeInfo>
	return Maybe.of(C_TradeSkillUI.GetRecipeInfoForSkillLineAbility(skillLineAbilityID, recipeLevel))
end

function Wrappers.GetRecipeInfoForSkillLineAbilityInto(
	reuse: Maybe<TradeSkillRecipeInfo>,
	skillLineAbilityID: number,
	recipeLevel: number?
): Maybe<TradeSkillRecipeInfo>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetRecipeInfoForSkillLineAbility(skillLineAbilityID, recipeLevel))
end

function Wrappers.GetRecipeItemQualityInfo(recipeID: number, quality: number): Maybe<CraftingQualityInfo>
	return Maybe.of(C_TradeSkillUI.GetRecipeItemQualityInfo(recipeID, quality))
end

function Wrappers.GetRecipeItemQualityInfoInto(
	reuse: Maybe<CraftingQualityInfo>,
	recipeID: number,
	quality: number
): Maybe<CraftingQualityInfo>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetRecipeItemQualityInfo(recipeID, quality))
end

function Wrappers.GetRecipeQualityItemIDs(recipeSpellID: number): Maybe<{ number }>
	return Maybe.of(C_TradeSkillUI.GetRecipeQualityItemIDs(recipeSpellID))
end

function Wrappers.GetRecipeQualityItemIDsInto(reuse: Maybe<{ number }>, recipeSpellID: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetRecipeQualityItemIDs(recipeSpellID))
end

function Wrappers.GetSkillLineForGear(itemInfo: ItemInfo): Maybe<number>
	return Maybe.of(C_TradeSkillUI.GetSkillLineForGear(itemInfo))
end

function Wrappers.GetSkillLineForGearInto(reuse: Maybe<number>, itemInfo: ItemInfo): Maybe<number>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetSkillLineForGear(itemInfo))
end

function Wrappers.GetTradeSkillLineForRecipe(recipeID: number): GetTradeSkillLineForRecipeResults
	local r1, r2, r3 = C_TradeSkillUI.GetTradeSkillLineForRecipe(recipeID)
	return {
		tradeSkillID = r1,
		skillLineName = r2,
		parentTradeSkillID = r3,
	}
end

function Wrappers.GetTradeSkillLineForRecipeInto(
	reuse: GetTradeSkillLineForRecipeResults,
	recipeID: number
): GetTradeSkillLineForRecipeResults
	local r1, r2, r3 = C_TradeSkillUI.GetTradeSkillLineForRecipe(recipeID)
	local fields = Reuse.fields(reuse)
	fields.tradeSkillID = r1
	fields.skillLineName = r2
	fields.parentTradeSkillID = r3
	return reuse
end

function Wrappers.GetTradeSkillListLink(): Maybe<string>
	return Maybe.of(C_TradeSkillUI.GetTradeSkillListLink())
end

function Wrappers.GetTradeSkillListLinkInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_TradeSkillUI.GetTradeSkillListLink())
end

return Wrappers
