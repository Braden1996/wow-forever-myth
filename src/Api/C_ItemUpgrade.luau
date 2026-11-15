--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetHighWatermarkForItemResults = {
	read characterHighWatermark: number,
	read accountHighWatermark: number,
}

export type GetHighWatermarkForSlotResults = {
	read characterHighWatermark: number,
	read accountHighWatermark: number,
}

export type GetItemUpgradeCurrentLevelResults = {
	read itemLevel: number,
	read isPvpItemLevel: boolean,
}

export type GetItemUpgradeEffectResults = {
	read outBaseEffect: string,
	read outUpgradedEffect: string,
}

export type GetItemUpgradePvpItemLevelDeltaValuesResults = {
	read currentPvPItemLevel: number,
	read upgradedPvPItemLevel: number,
}

local Wrappers = {}

function Wrappers.GetHighWatermarkForItem(itemInfo: ItemInfo): Maybe<GetHighWatermarkForItemResults>
	local r1, r2 = C_ItemUpgrade.GetHighWatermarkForItem(itemInfo)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		characterHighWatermark = r1,
		accountHighWatermark = r2,
	})
end

function Wrappers.GetHighWatermarkForItemInto(
	reuse: GetHighWatermarkForItemResults,
	itemInfo: ItemInfo
): Maybe<GetHighWatermarkForItemResults>
	local r1, r2 = C_ItemUpgrade.GetHighWatermarkForItem(itemInfo)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.characterHighWatermark = r1
	fields.accountHighWatermark = r2
	return Reuse.just(reuse)
end

function Wrappers.GetHighWatermarkForSlot(itemRedundancySlot: number): Maybe<GetHighWatermarkForSlotResults>
	local r1, r2 = C_ItemUpgrade.GetHighWatermarkForSlot(itemRedundancySlot)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		characterHighWatermark = r1,
		accountHighWatermark = r2,
	})
end

function Wrappers.GetHighWatermarkForSlotInto(
	reuse: GetHighWatermarkForSlotResults,
	itemRedundancySlot: number
): Maybe<GetHighWatermarkForSlotResults>
	local r1, r2 = C_ItemUpgrade.GetHighWatermarkForSlot(itemRedundancySlot)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.characterHighWatermark = r1
	fields.accountHighWatermark = r2
	return Reuse.just(reuse)
end

function Wrappers.GetHighWatermarkSlotForItem(itemInfo: ItemInfo): Maybe<number>
	return Maybe.of(C_ItemUpgrade.GetHighWatermarkSlotForItem(itemInfo))
end

function Wrappers.GetHighWatermarkSlotForItemInto(reuse: Maybe<number>, itemInfo: ItemInfo): Maybe<number>
	return Reuse.maybe(reuse, C_ItemUpgrade.GetHighWatermarkSlotForItem(itemInfo))
end

function Wrappers.GetItemHyperlink(): Maybe<string>
	return Maybe.of(C_ItemUpgrade.GetItemHyperlink())
end

function Wrappers.GetItemHyperlinkInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_ItemUpgrade.GetItemHyperlink())
end

function Wrappers.GetItemUpgradeCurrentLevel(): Maybe<GetItemUpgradeCurrentLevelResults>
	local r1, r2 = C_ItemUpgrade.GetItemUpgradeCurrentLevel()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemLevel = r1,
		isPvpItemLevel = r2,
	})
end

function Wrappers.GetItemUpgradeCurrentLevelInto(
	reuse: GetItemUpgradeCurrentLevelResults
): Maybe<GetItemUpgradeCurrentLevelResults>
	local r1, r2 = C_ItemUpgrade.GetItemUpgradeCurrentLevel()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemLevel = r1
	fields.isPvpItemLevel = r2
	return Reuse.just(reuse)
end

function Wrappers.GetItemUpgradeEffect(
	effectIndex: number,
	numUpgradeLevels: number?
): Maybe<GetItemUpgradeEffectResults>
	local r1, r2 = C_ItemUpgrade.GetItemUpgradeEffect(effectIndex, numUpgradeLevels)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		outBaseEffect = r1,
		outUpgradedEffect = r2,
	})
end

function Wrappers.GetItemUpgradeEffectInto(
	reuse: GetItemUpgradeEffectResults,
	effectIndex: number,
	numUpgradeLevels: number?
): Maybe<GetItemUpgradeEffectResults>
	local r1, r2 = C_ItemUpgrade.GetItemUpgradeEffect(effectIndex, numUpgradeLevels)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.outBaseEffect = r1
	fields.outUpgradedEffect = r2
	return Reuse.just(reuse)
end

function Wrappers.GetItemUpgradeItemInfo(): Maybe<ItemUpgradeItemInfo>
	return Maybe.of(C_ItemUpgrade.GetItemUpgradeItemInfo())
end

function Wrappers.GetItemUpgradeItemInfoInto(reuse: Maybe<ItemUpgradeItemInfo>): Maybe<ItemUpgradeItemInfo>
	return Reuse.maybe(reuse, C_ItemUpgrade.GetItemUpgradeItemInfo())
end

function Wrappers.GetItemUpgradePvpItemLevelDeltaValues(
	numUpgradeLevels: number
): Maybe<GetItemUpgradePvpItemLevelDeltaValuesResults>
	local r1, r2 = C_ItemUpgrade.GetItemUpgradePvpItemLevelDeltaValues(numUpgradeLevels)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		currentPvPItemLevel = r1,
		upgradedPvPItemLevel = r2,
	})
end

function Wrappers.GetItemUpgradePvpItemLevelDeltaValuesInto(
	reuse: GetItemUpgradePvpItemLevelDeltaValuesResults,
	numUpgradeLevels: number
): Maybe<GetItemUpgradePvpItemLevelDeltaValuesResults>
	local r1, r2 = C_ItemUpgrade.GetItemUpgradePvpItemLevelDeltaValues(numUpgradeLevels)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.currentPvPItemLevel = r1
	fields.upgradedPvPItemLevel = r2
	return Reuse.just(reuse)
end

return Wrappers
