--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAchievementByID(achievementID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetAchievementByID(achievementID))
end

function Wrappers.GetAchievementByIDInto(reuse: Maybe<TooltipData>, achievementID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetAchievementByID(achievementID))
end

function Wrappers.GetAction(actionID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetAction(actionID))
end

function Wrappers.GetActionInto(reuse: Maybe<TooltipData>, actionID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetAction(actionID))
end

function Wrappers.GetArtifactItem(): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetArtifactItem())
end

function Wrappers.GetArtifactItemInto(reuse: Maybe<TooltipData>): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetArtifactItem())
end

function Wrappers.GetArtifactPowerByID(powerID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetArtifactPowerByID(powerID))
end

function Wrappers.GetArtifactPowerByIDInto(reuse: Maybe<TooltipData>, powerID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetArtifactPowerByID(powerID))
end

function Wrappers.GetAzeriteEssence(essenceID: number, rank: number?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetAzeriteEssence(essenceID, rank))
end

function Wrappers.GetAzeriteEssenceInto(reuse: Maybe<TooltipData>, essenceID: number, rank: number?): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetAzeriteEssence(essenceID, rank))
end

function Wrappers.GetAzeriteEssenceSlot(slot: Enum_AzeriteEssenceSlot): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetAzeriteEssenceSlot(slot))
end

function Wrappers.GetAzeriteEssenceSlotInto(
	reuse: Maybe<TooltipData>,
	slot: Enum_AzeriteEssenceSlot
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetAzeriteEssenceSlot(slot))
end

function Wrappers.GetAzeritePower(
	itemID: number,
	itemLevel: number,
	powerID: number,
	owningItemLink: string?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetAzeritePower(itemID, itemLevel, powerID, owningItemLink))
end

function Wrappers.GetAzeritePowerInto(
	reuse: Maybe<TooltipData>,
	itemID: number,
	itemLevel: number,
	powerID: number,
	owningItemLink: string?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetAzeritePower(itemID, itemLevel, powerID, owningItemLink))
end

function Wrappers.GetBackpackToken(index: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetBackpackToken(index))
end

function Wrappers.GetBackpackTokenInto(reuse: Maybe<TooltipData>, index: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetBackpackToken(index))
end

function Wrappers.GetBagItem(bagIndex: Enum_BagIndex, slotIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetBagItem(bagIndex, slotIndex))
end

function Wrappers.GetBagItemInto(
	reuse: Maybe<TooltipData>,
	bagIndex: Enum_BagIndex,
	slotIndex: number
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetBagItem(bagIndex, slotIndex))
end

function Wrappers.GetBagItemChild(
	bagIndex: Enum_BagIndex,
	slotIndex: number,
	equipSlotIndex: number
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetBagItemChild(bagIndex, slotIndex, equipSlotIndex))
end

function Wrappers.GetBagItemChildInto(
	reuse: Maybe<TooltipData>,
	bagIndex: Enum_BagIndex,
	slotIndex: number,
	equipSlotIndex: number
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetBagItemChild(bagIndex, slotIndex, equipSlotIndex))
end

function Wrappers.GetBuybackItem(index: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetBuybackItem(index))
end

function Wrappers.GetBuybackItemInto(reuse: Maybe<TooltipData>, index: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetBuybackItem(index))
end

function Wrappers.GetCompanionPet(petGUID: WOWGUID): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetCompanionPet(petGUID))
end

function Wrappers.GetCompanionPetInto(reuse: Maybe<TooltipData>, petGUID: WOWGUID): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetCompanionPet(petGUID))
end

function Wrappers.GetConduit(conduitID: number, conduitRank: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetConduit(conduitID, conduitRank))
end

function Wrappers.GetConduitInto(reuse: Maybe<TooltipData>, conduitID: number, conduitRank: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetConduit(conduitID, conduitRank))
end

function Wrappers.GetCurrencyByID(currencyID: number, amount: number?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetCurrencyByID(currencyID, amount))
end

function Wrappers.GetCurrencyByIDInto(
	reuse: Maybe<TooltipData>,
	currencyID: number,
	amount: number?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetCurrencyByID(currencyID, amount))
end

function Wrappers.GetCurrencyToken(tokenIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetCurrencyToken(tokenIndex))
end

function Wrappers.GetCurrencyTokenInto(reuse: Maybe<TooltipData>, tokenIndex: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetCurrencyToken(tokenIndex))
end

function Wrappers.GetEnhancedConduit(conduitID: number, rank: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetEnhancedConduit(conduitID, rank))
end

function Wrappers.GetEnhancedConduitInto(reuse: Maybe<TooltipData>, conduitID: number, rank: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetEnhancedConduit(conduitID, rank))
end

function Wrappers.GetEquipmentSet(setID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetEquipmentSet(setID))
end

function Wrappers.GetEquipmentSetInto(reuse: Maybe<TooltipData>, setID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetEquipmentSet(setID))
end

function Wrappers.GetExistingSocketGem(index: number, toDestroy: boolean?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetExistingSocketGem(index, toDestroy))
end

function Wrappers.GetExistingSocketGemInto(
	reuse: Maybe<TooltipData>,
	index: number,
	toDestroy: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetExistingSocketGem(index, toDestroy))
end

function Wrappers.GetGuildBankItem(tab: number, slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetGuildBankItem(tab, slot))
end

function Wrappers.GetGuildBankItemInto(reuse: Maybe<TooltipData>, tab: number, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetGuildBankItem(tab, slot))
end

function Wrappers.GetHeirloomByItemID(itemID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetHeirloomByItemID(itemID))
end

function Wrappers.GetHeirloomByItemIDInto(reuse: Maybe<TooltipData>, itemID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetHeirloomByItemID(itemID))
end

function Wrappers.GetHyperlink(
	hyperlink: string,
	optionalArg1: number?,
	optionalArg2: number?,
	hideVendorPrice: boolean?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetHyperlink(hyperlink, optionalArg1, optionalArg2, hideVendorPrice))
end

function Wrappers.GetHyperlinkInto(
	reuse: Maybe<TooltipData>,
	hyperlink: string,
	optionalArg1: number?,
	optionalArg2: number?,
	hideVendorPrice: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetHyperlink(hyperlink, optionalArg1, optionalArg2, hideVendorPrice))
end

function Wrappers.GetInboxItem(messageIndex: number, attachmentIndex: number?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetInboxItem(messageIndex, attachmentIndex))
end

function Wrappers.GetInboxItemInto(
	reuse: Maybe<TooltipData>,
	messageIndex: number,
	attachmentIndex: number?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetInboxItem(messageIndex, attachmentIndex))
end

function Wrappers.GetInstanceLockEncountersComplete(index: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetInstanceLockEncountersComplete(index))
end

function Wrappers.GetInstanceLockEncountersCompleteInto(reuse: Maybe<TooltipData>, index: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetInstanceLockEncountersComplete(index))
end

function Wrappers.GetInventoryItem(unit: UnitToken, slot: number, hideUselessStats: boolean?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetInventoryItem(unit, slot, hideUselessStats))
end

function Wrappers.GetInventoryItemInto(
	reuse: Maybe<TooltipData>,
	unit: UnitToken,
	slot: number,
	hideUselessStats: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetInventoryItem(unit, slot, hideUselessStats))
end

function Wrappers.GetInventoryItemByID(itemID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetInventoryItemByID(itemID))
end

function Wrappers.GetInventoryItemByIDInto(reuse: Maybe<TooltipData>, itemID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetInventoryItemByID(itemID))
end

function Wrappers.GetItemByGUID(guid: WOWGUID): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetItemByGUID(guid))
end

function Wrappers.GetItemByGUIDInto(reuse: Maybe<TooltipData>, guid: WOWGUID): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetItemByGUID(guid))
end

function Wrappers.GetItemByID(
	itemID: number,
	quality: Enum_ItemQuality?,
	itemContext: number?,
	treasureContextLevel: number?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetItemByID(itemID, quality, itemContext, treasureContextLevel))
end

function Wrappers.GetItemByIDInto(
	reuse: Maybe<TooltipData>,
	itemID: number,
	quality: Enum_ItemQuality?,
	itemContext: number?,
	treasureContextLevel: number?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetItemByID(itemID, quality, itemContext, treasureContextLevel))
end

function Wrappers.GetItemByItemModifiedAppearanceID(itemModifiedAppearanceID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetItemByItemModifiedAppearanceID(itemModifiedAppearanceID))
end

function Wrappers.GetItemByItemModifiedAppearanceIDInto(
	reuse: Maybe<TooltipData>,
	itemModifiedAppearanceID: number
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetItemByItemModifiedAppearanceID(itemModifiedAppearanceID))
end

function Wrappers.GetItemInteractionItem(): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetItemInteractionItem())
end

function Wrappers.GetItemInteractionItemInto(reuse: Maybe<TooltipData>): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetItemInteractionItem())
end

function Wrappers.GetItemKey(
	itemID: number,
	itemLevel: number,
	itemSuffix: number,
	requiredLevel: number?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetItemKey(itemID, itemLevel, itemSuffix, requiredLevel))
end

function Wrappers.GetItemKeyInto(
	reuse: Maybe<TooltipData>,
	itemID: number,
	itemLevel: number,
	itemSuffix: number,
	requiredLevel: number?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetItemKey(itemID, itemLevel, itemSuffix, requiredLevel))
end

function Wrappers.GetLFGDungeonReward(dungeonID: number, lootIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetLFGDungeonReward(dungeonID, lootIndex))
end

function Wrappers.GetLFGDungeonRewardInto(
	reuse: Maybe<TooltipData>,
	dungeonID: number,
	lootIndex: number
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetLFGDungeonReward(dungeonID, lootIndex))
end

function Wrappers.GetLFGDungeonShortageReward(
	dungeonID: number,
	shortageSeverity: number,
	lootIndex: number
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetLFGDungeonShortageReward(dungeonID, shortageSeverity, lootIndex))
end

function Wrappers.GetLFGDungeonShortageRewardInto(
	reuse: Maybe<TooltipData>,
	dungeonID: number,
	shortageSeverity: number,
	lootIndex: number
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetLFGDungeonShortageReward(dungeonID, shortageSeverity, lootIndex))
end

function Wrappers.GetLootCurrency(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetLootCurrency(slot))
end

function Wrappers.GetLootCurrencyInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetLootCurrency(slot))
end

function Wrappers.GetLootItem(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetLootItem(slot))
end

function Wrappers.GetLootItemInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetLootItem(slot))
end

function Wrappers.GetLootRollItem(id: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetLootRollItem(id))
end

function Wrappers.GetLootRollItemInto(reuse: Maybe<TooltipData>, id: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetLootRollItem(id))
end

function Wrappers.GetMerchantCostItem(slot: number, costIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetMerchantCostItem(slot, costIndex))
end

function Wrappers.GetMerchantCostItemInto(
	reuse: Maybe<TooltipData>,
	slot: number,
	costIndex: number
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetMerchantCostItem(slot, costIndex))
end

function Wrappers.GetMerchantItem(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetMerchantItem(slot))
end

function Wrappers.GetMerchantItemInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetMerchantItem(slot))
end

function Wrappers.GetMinimapMouseover(): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetMinimapMouseover())
end

function Wrappers.GetMinimapMouseoverInto(reuse: Maybe<TooltipData>): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetMinimapMouseover())
end

function Wrappers.GetMountBySpellID(spellID: SpellIdentifier, checkIndoors: boolean?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetMountBySpellID(spellID, checkIndoors))
end

function Wrappers.GetMountBySpellIDInto(
	reuse: Maybe<TooltipData>,
	spellID: SpellIdentifier,
	checkIndoors: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetMountBySpellID(spellID, checkIndoors))
end

function Wrappers.GetOutfit(outfitID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetOutfit(outfitID))
end

function Wrappers.GetOutfitInto(reuse: Maybe<TooltipData>, outfitID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetOutfit(outfitID))
end

function Wrappers.GetOwnedItemByID(itemID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetOwnedItemByID(itemID))
end

function Wrappers.GetOwnedItemByIDInto(reuse: Maybe<TooltipData>, itemID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetOwnedItemByID(itemID))
end

function Wrappers.GetPetAction(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetPetAction(slot))
end

function Wrappers.GetPetActionInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetPetAction(slot))
end

function Wrappers.GetPossession(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetPossession(slot))
end

function Wrappers.GetPossessionInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetPossession(slot))
end

function Wrappers.GetPvpBrawl(isSpecial: boolean?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetPvpBrawl(isSpecial))
end

function Wrappers.GetPvpBrawlInto(reuse: Maybe<TooltipData>, isSpecial: boolean?): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetPvpBrawl(isSpecial))
end

function Wrappers.GetPvpTalent(
	talentID: number,
	isInspect: boolean?,
	groupIndex: number?,
	talentIndex: number?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetPvpTalent(talentID, isInspect, groupIndex, talentIndex))
end

function Wrappers.GetPvpTalentInto(
	reuse: Maybe<TooltipData>,
	talentID: number,
	isInspect: boolean?,
	groupIndex: number?,
	talentIndex: number?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetPvpTalent(talentID, isInspect, groupIndex, talentIndex))
end

function Wrappers.GetQuestCurrency(type: string, currencyIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetQuestCurrency(type, currencyIndex))
end

function Wrappers.GetQuestCurrencyInto(
	reuse: Maybe<TooltipData>,
	type: string,
	currencyIndex: number
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetQuestCurrency(type, currencyIndex))
end

function Wrappers.GetQuestItem(type: string, itemIndex: number, allowCollectionText: boolean?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetQuestItem(type, itemIndex, allowCollectionText))
end

function Wrappers.GetQuestItemInto(
	reuse: Maybe<TooltipData>,
	type: string,
	itemIndex: number,
	allowCollectionText: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetQuestItem(type, itemIndex, allowCollectionText))
end

function Wrappers.GetQuestLogCurrency(type: string, currencyIndex: number, questID: number?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetQuestLogCurrency(type, currencyIndex, questID))
end

function Wrappers.GetQuestLogCurrencyInto(
	reuse: Maybe<TooltipData>,
	type: string,
	currencyIndex: number,
	questID: number?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetQuestLogCurrency(type, currencyIndex, questID))
end

function Wrappers.GetQuestLogItem(
	type: string,
	itemIndex: number,
	questID: number?,
	allowCollectionText: boolean?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetQuestLogItem(type, itemIndex, questID, allowCollectionText))
end

function Wrappers.GetQuestLogItemInto(
	reuse: Maybe<TooltipData>,
	type: string,
	itemIndex: number,
	questID: number?,
	allowCollectionText: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetQuestLogItem(type, itemIndex, questID, allowCollectionText))
end

function Wrappers.GetQuestLogSpecialItem(questIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetQuestLogSpecialItem(questIndex))
end

function Wrappers.GetQuestLogSpecialItemInto(reuse: Maybe<TooltipData>, questIndex: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetQuestLogSpecialItem(questIndex))
end

function Wrappers.GetQuestPartyProgress(
	questID: number,
	omitTitle: boolean?,
	ignoreActivePlayer: boolean?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetQuestPartyProgress(questID, omitTitle, ignoreActivePlayer))
end

function Wrappers.GetQuestPartyProgressInto(
	reuse: Maybe<TooltipData>,
	questID: number,
	omitTitle: boolean?,
	ignoreActivePlayer: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetQuestPartyProgress(questID, omitTitle, ignoreActivePlayer))
end

function Wrappers.GetRecipeRankInfo(recipeID: number, rank: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetRecipeRankInfo(recipeID, rank))
end

function Wrappers.GetRecipeRankInfoInto(reuse: Maybe<TooltipData>, recipeID: number, rank: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetRecipeRankInfo(recipeID, rank))
end

function Wrappers.GetRecipeReagentItem(recipeSpellID: number, dataSlotIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetRecipeReagentItem(recipeSpellID, dataSlotIndex))
end

function Wrappers.GetRecipeReagentItemInto(
	reuse: Maybe<TooltipData>,
	recipeSpellID: number,
	dataSlotIndex: number
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetRecipeReagentItem(recipeSpellID, dataSlotIndex))
end

function Wrappers.GetRecipeResultItem(
	recipeID: number,
	reagentInfos: { CraftingReagentInfo }?,
	recraftItemGUID: WOWGUID?,
	recipeLevel: number?,
	overrideQualityID: number?
): Maybe<TooltipData>
	return Maybe.of(
		C_TooltipInfo.GetRecipeResultItem(recipeID, reagentInfos, recraftItemGUID, recipeLevel, overrideQualityID)
	)
end

function Wrappers.GetRecipeResultItemInto(
	reuse: Maybe<TooltipData>,
	recipeID: number,
	reagentInfos: { CraftingReagentInfo }?,
	recraftItemGUID: WOWGUID?,
	recipeLevel: number?,
	overrideQualityID: number?
): Maybe<TooltipData>
	return Reuse.maybe(
		reuse,
		C_TooltipInfo.GetRecipeResultItem(recipeID, reagentInfos, recraftItemGUID, recipeLevel, overrideQualityID)
	)
end

function Wrappers.GetRecipeResultItemForOrder(
	recipeID: number,
	reagentInfos: { CraftingReagentInfo }?,
	orderID: BigUInteger?,
	recipeLevel: number?,
	overrideQualityID: number?
): Maybe<TooltipData>
	return Maybe.of(
		C_TooltipInfo.GetRecipeResultItemForOrder(recipeID, reagentInfos, orderID, recipeLevel, overrideQualityID)
	)
end

function Wrappers.GetRecipeResultItemForOrderInto(
	reuse: Maybe<TooltipData>,
	recipeID: number,
	reagentInfos: { CraftingReagentInfo }?,
	orderID: BigUInteger?,
	recipeLevel: number?,
	overrideQualityID: number?
): Maybe<TooltipData>
	return Reuse.maybe(
		reuse,
		C_TooltipInfo.GetRecipeResultItemForOrder(recipeID, reagentInfos, orderID, recipeLevel, overrideQualityID)
	)
end

function Wrappers.GetRuneforgeResultItem(
	itemGUID: WOWGUID,
	itemLevel: number,
	powerID: number?,
	modifiers: { number }?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetRuneforgeResultItem(itemGUID, itemLevel, powerID, modifiers))
end

function Wrappers.GetRuneforgeResultItemInto(
	reuse: Maybe<TooltipData>,
	itemGUID: WOWGUID,
	itemLevel: number,
	powerID: number?,
	modifiers: { number }?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetRuneforgeResultItem(itemGUID, itemLevel, powerID, modifiers))
end

function Wrappers.GetSendMailItem(attachmentIndex: number?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetSendMailItem(attachmentIndex))
end

function Wrappers.GetSendMailItemInto(reuse: Maybe<TooltipData>, attachmentIndex: number?): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetSendMailItem(attachmentIndex))
end

function Wrappers.GetShapeshift(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetShapeshift(slot))
end

function Wrappers.GetShapeshiftInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetShapeshift(slot))
end

function Wrappers.GetSlottedKeystone(): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetSlottedKeystone())
end

function Wrappers.GetSlottedKeystoneInto(reuse: Maybe<TooltipData>): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetSlottedKeystone())
end

function Wrappers.GetSocketGem(index: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetSocketGem(index))
end

function Wrappers.GetSocketGemInto(reuse: Maybe<TooltipData>, index: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetSocketGem(index))
end

function Wrappers.GetSocketedItem(): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetSocketedItem())
end

function Wrappers.GetSocketedItemInto(reuse: Maybe<TooltipData>): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetSocketedItem())
end

function Wrappers.GetSocketedRelic(slotIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetSocketedRelic(slotIndex))
end

function Wrappers.GetSocketedRelicInto(reuse: Maybe<TooltipData>, slotIndex: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetSocketedRelic(slotIndex))
end

function Wrappers.GetSpellBookItem(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetSpellBookItem(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemInto(
	reuse: Maybe<TooltipData>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetSpellBookItem(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellByID(
	spellID: SpellIdentifier,
	isPet: boolean?,
	showSubtext: boolean?,
	dontOverride: boolean?,
	difficultyID: number?,
	isLink: boolean?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetSpellByID(spellID, isPet, showSubtext, dontOverride, difficultyID, isLink))
end

function Wrappers.GetSpellByIDInto(
	reuse: Maybe<TooltipData>,
	spellID: SpellIdentifier,
	isPet: boolean?,
	showSubtext: boolean?,
	dontOverride: boolean?,
	difficultyID: number?,
	isLink: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(
		reuse,
		C_TooltipInfo.GetSpellByID(spellID, isPet, showSubtext, dontOverride, difficultyID, isLink)
	)
end

function Wrappers.GetTalent(talentID: number, isInspect: boolean?, groupIndex: number?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetTalent(talentID, isInspect, groupIndex))
end

function Wrappers.GetTalentInto(
	reuse: Maybe<TooltipData>,
	talentID: number,
	isInspect: boolean?,
	groupIndex: number?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetTalent(talentID, isInspect, groupIndex))
end

function Wrappers.GetTotem(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetTotem(slot))
end

function Wrappers.GetTotemInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetTotem(slot))
end

function Wrappers.GetToyByItemID(itemID: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetToyByItemID(itemID))
end

function Wrappers.GetToyByItemIDInto(reuse: Maybe<TooltipData>, itemID: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetToyByItemID(itemID))
end

function Wrappers.GetTradePlayerItem(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetTradePlayerItem(slot))
end

function Wrappers.GetTradePlayerItemInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetTradePlayerItem(slot))
end

function Wrappers.GetTradeTargetItem(slot: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetTradeTargetItem(slot))
end

function Wrappers.GetTradeTargetItemInto(reuse: Maybe<TooltipData>, slot: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetTradeTargetItem(slot))
end

function Wrappers.GetTrainerService(serviceIndex: number): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetTrainerService(serviceIndex))
end

function Wrappers.GetTrainerServiceInto(reuse: Maybe<TooltipData>, serviceIndex: number): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetTrainerService(serviceIndex))
end

function Wrappers.GetTraitEntry(entryID: number, rank: number?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetTraitEntry(entryID, rank))
end

function Wrappers.GetTraitEntryInto(reuse: Maybe<TooltipData>, entryID: number, rank: number?): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetTraitEntry(entryID, rank))
end

function Wrappers.GetUnit(unit: UnitTokenPvPRestrictedForAddOns, hideStatus: boolean?): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetUnit(unit, hideStatus))
end

function Wrappers.GetUnitInto(
	reuse: Maybe<TooltipData>,
	unit: UnitTokenPvPRestrictedForAddOns,
	hideStatus: boolean?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetUnit(unit, hideStatus))
end

function Wrappers.GetUnitAura(
	unitToken: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetUnitAura(unitToken, index, filter))
end

function Wrappers.GetUnitAuraInto(
	reuse: Maybe<TooltipData>,
	unitToken: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetUnitAura(unitToken, index, filter))
end

function Wrappers.GetUnitAuraByAuraInstanceID(
	unitToken: UnitTokenRestrictedForAddOns,
	auraInstanceID: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetUnitAuraByAuraInstanceID(unitToken, auraInstanceID, filter))
end

function Wrappers.GetUnitAuraByAuraInstanceIDInto(
	reuse: Maybe<TooltipData>,
	unitToken: UnitTokenRestrictedForAddOns,
	auraInstanceID: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetUnitAuraByAuraInstanceID(unitToken, auraInstanceID, filter))
end

function Wrappers.GetUnitBuff(
	unitToken: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetUnitBuff(unitToken, index, filter))
end

function Wrappers.GetUnitBuffInto(
	reuse: Maybe<TooltipData>,
	unitToken: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetUnitBuff(unitToken, index, filter))
end

function Wrappers.GetUnitBuffByAuraInstanceID(
	unitToken: UnitTokenRestrictedForAddOns,
	auraInstanceID: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetUnitBuffByAuraInstanceID(unitToken, auraInstanceID, filter))
end

function Wrappers.GetUnitBuffByAuraInstanceIDInto(
	reuse: Maybe<TooltipData>,
	unitToken: UnitTokenRestrictedForAddOns,
	auraInstanceID: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetUnitBuffByAuraInstanceID(unitToken, auraInstanceID, filter))
end

function Wrappers.GetUnitDebuff(
	unitToken: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetUnitDebuff(unitToken, index, filter))
end

function Wrappers.GetUnitDebuffInto(
	reuse: Maybe<TooltipData>,
	unitToken: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetUnitDebuff(unitToken, index, filter))
end

function Wrappers.GetUnitDebuffByAuraInstanceID(
	unitToken: UnitTokenRestrictedForAddOns,
	auraInstanceID: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetUnitDebuffByAuraInstanceID(unitToken, auraInstanceID, filter))
end

function Wrappers.GetUnitDebuffByAuraInstanceIDInto(
	reuse: Maybe<TooltipData>,
	unitToken: UnitTokenRestrictedForAddOns,
	auraInstanceID: number,
	filter: AuraFilters?
): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetUnitDebuffByAuraInstanceID(unitToken, auraInstanceID, filter))
end

function Wrappers.GetUpgradeItem(): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetUpgradeItem())
end

function Wrappers.GetUpgradeItemInto(reuse: Maybe<TooltipData>): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetUpgradeItem())
end

function Wrappers.GetWeeklyReward(itemDBID: WeeklyRewardItemDBID): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetWeeklyReward(itemDBID))
end

function Wrappers.GetWeeklyRewardInto(reuse: Maybe<TooltipData>, itemDBID: WeeklyRewardItemDBID): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetWeeklyReward(itemDBID))
end

function Wrappers.GetWorldCursor(): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetWorldCursor())
end

function Wrappers.GetWorldCursorInto(reuse: Maybe<TooltipData>): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetWorldCursor())
end

function Wrappers.GetWorldLootObject(unitTokenString: string): Maybe<TooltipData>
	return Maybe.of(C_TooltipInfo.GetWorldLootObject(unitTokenString))
end

function Wrappers.GetWorldLootObjectInto(reuse: Maybe<TooltipData>, unitTokenString: string): Maybe<TooltipData>
	return Reuse.maybe(reuse, C_TooltipInfo.GetWorldLootObject(unitTokenString))
end

return Wrappers
