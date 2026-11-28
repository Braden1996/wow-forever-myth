--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetContainerItemCooldownResults = {
	read startTime: number,
	read duration: number,
	read enable: number,
}

export type GetContainerItemDurabilityResults = {
	read durability: number,
	read maxDurability: number,
}

export type GetContainerItemEquipmentSetInfoResults = {
	read inSet: boolean,
	read setList: string,
}

export type GetContainerNumFreeSlotsResults = {
	read numFreeSlots: number,
	read bagFamily: Maybe<number>,
}

export type GetItemCooldownResults = {
	read startTime: number,
	read duration: number,
	read enable: number,
}

local Wrappers = {}

function Wrappers.ContainerIDToInventoryID(containerID: Enum_BagIndex): Maybe<number>
	return Maybe.of(C_Container.ContainerIDToInventoryID(containerID))
end

function Wrappers.ContainerIDToInventoryIDInto(reuse: Maybe<number>, containerID: Enum_BagIndex): Maybe<number>
	return Reuse.maybe(reuse, C_Container.ContainerIDToInventoryID(containerID))
end

function Wrappers.GetContainerFreeSlots(containerIndex: Enum_BagIndex): Maybe<{ number }>
	return Maybe.of(C_Container.GetContainerFreeSlots(containerIndex))
end

function Wrappers.GetContainerFreeSlotsInto(reuse: Maybe<{ number }>, containerIndex: Enum_BagIndex): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Container.GetContainerFreeSlots(containerIndex))
end

function Wrappers.GetContainerItemCooldown(
	containerIndex: Enum_BagIndex,
	slotIndex: number
): GetContainerItemCooldownResults
	local r1, r2, r3 = C_Container.GetContainerItemCooldown(containerIndex, slotIndex)
	return {
		startTime = r1,
		duration = r2,
		enable = r3,
	}
end

function Wrappers.GetContainerItemCooldownInto(
	reuse: GetContainerItemCooldownResults,
	containerIndex: Enum_BagIndex,
	slotIndex: number
): GetContainerItemCooldownResults
	local r1, r2, r3 = C_Container.GetContainerItemCooldown(containerIndex, slotIndex)
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return reuse
end

function Wrappers.GetContainerItemDurability(
	containerIndex: Enum_BagIndex,
	slotIndex: number
): Maybe<GetContainerItemDurabilityResults>
	local r1, r2 = C_Container.GetContainerItemDurability(containerIndex, slotIndex)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		durability = r1,
		maxDurability = r2,
	})
end

function Wrappers.GetContainerItemDurabilityInto(
	reuse: GetContainerItemDurabilityResults,
	containerIndex: Enum_BagIndex,
	slotIndex: number
): Maybe<GetContainerItemDurabilityResults>
	local r1, r2 = C_Container.GetContainerItemDurability(containerIndex, slotIndex)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.durability = r1
	fields.maxDurability = r2
	return Reuse.just(reuse)
end

function Wrappers.GetContainerItemEquipmentSetInfo(
	containerIndex: Enum_BagIndex,
	slotIndex: number
): GetContainerItemEquipmentSetInfoResults
	local r1, r2 = C_Container.GetContainerItemEquipmentSetInfo(containerIndex, slotIndex)
	return {
		inSet = r1,
		setList = r2,
	}
end

function Wrappers.GetContainerItemEquipmentSetInfoInto(
	reuse: GetContainerItemEquipmentSetInfoResults,
	containerIndex: Enum_BagIndex,
	slotIndex: number
): GetContainerItemEquipmentSetInfoResults
	local r1, r2 = C_Container.GetContainerItemEquipmentSetInfo(containerIndex, slotIndex)
	local fields = Reuse.fields(reuse)
	fields.inSet = r1
	fields.setList = r2
	return reuse
end

function Wrappers.GetContainerItemID(containerIndex: Enum_BagIndex, slotIndex: number): Maybe<number>
	return Maybe.of(C_Container.GetContainerItemID(containerIndex, slotIndex))
end

function Wrappers.GetContainerItemIDInto(
	reuse: Maybe<number>,
	containerIndex: Enum_BagIndex,
	slotIndex: number
): Maybe<number>
	return Reuse.maybe(reuse, C_Container.GetContainerItemID(containerIndex, slotIndex))
end

function Wrappers.GetContainerItemInfo(containerIndex: Enum_BagIndex, slotIndex: number): Maybe<ContainerItemInfo>
	return Maybe.of(C_Container.GetContainerItemInfo(containerIndex, slotIndex))
end

function Wrappers.GetContainerItemInfoInto(
	reuse: Maybe<ContainerItemInfo>,
	containerIndex: Enum_BagIndex,
	slotIndex: number
): Maybe<ContainerItemInfo>
	return Reuse.maybe(reuse, C_Container.GetContainerItemInfo(containerIndex, slotIndex))
end

function Wrappers.GetContainerItemPurchaseCurrency(
	containerIndex: Enum_BagIndex,
	slotIndex: number,
	itemIndex: number,
	isEquipped: boolean
): Maybe<ItemPurchaseCurrency>
	return Maybe.of(C_Container.GetContainerItemPurchaseCurrency(containerIndex, slotIndex, itemIndex, isEquipped))
end

function Wrappers.GetContainerItemPurchaseCurrencyInto(
	reuse: Maybe<ItemPurchaseCurrency>,
	containerIndex: Enum_BagIndex,
	slotIndex: number,
	itemIndex: number,
	isEquipped: boolean
): Maybe<ItemPurchaseCurrency>
	return Reuse.maybe(
		reuse,
		C_Container.GetContainerItemPurchaseCurrency(containerIndex, slotIndex, itemIndex, isEquipped)
	)
end

function Wrappers.GetContainerItemPurchaseInfo(
	containerIndex: Enum_BagIndex,
	slotIndex: number,
	isEquipped: boolean
): Maybe<ItemPurchaseInfo>
	return Maybe.of(C_Container.GetContainerItemPurchaseInfo(containerIndex, slotIndex, isEquipped))
end

function Wrappers.GetContainerItemPurchaseInfoInto(
	reuse: Maybe<ItemPurchaseInfo>,
	containerIndex: Enum_BagIndex,
	slotIndex: number,
	isEquipped: boolean
): Maybe<ItemPurchaseInfo>
	return Reuse.maybe(reuse, C_Container.GetContainerItemPurchaseInfo(containerIndex, slotIndex, isEquipped))
end

function Wrappers.GetContainerItemPurchaseItem(
	containerIndex: Enum_BagIndex,
	slotIndex: number,
	itemIndex: number,
	isEquipped: boolean
): Maybe<ItemPurchaseItem>
	return Maybe.of(C_Container.GetContainerItemPurchaseItem(containerIndex, slotIndex, itemIndex, isEquipped))
end

function Wrappers.GetContainerItemPurchaseItemInto(
	reuse: Maybe<ItemPurchaseItem>,
	containerIndex: Enum_BagIndex,
	slotIndex: number,
	itemIndex: number,
	isEquipped: boolean
): Maybe<ItemPurchaseItem>
	return Reuse.maybe(
		reuse,
		C_Container.GetContainerItemPurchaseItem(containerIndex, slotIndex, itemIndex, isEquipped)
	)
end

function Wrappers.GetContainerNumFreeSlots(bagIndex: Enum_BagIndex): GetContainerNumFreeSlotsResults
	local r1, r2 = C_Container.GetContainerNumFreeSlots(bagIndex)
	return {
		numFreeSlots = r1,
		bagFamily = Maybe.of(r2),
	}
end

function Wrappers.GetContainerNumFreeSlotsInto(
	reuse: GetContainerNumFreeSlotsResults,
	bagIndex: Enum_BagIndex
): GetContainerNumFreeSlotsResults
	local r1, r2 = C_Container.GetContainerNumFreeSlots(bagIndex)
	local fields = Reuse.fields(reuse)
	fields.numFreeSlots = r1
	fields.bagFamily = Reuse.maybe(fields.bagFamily, r2)
	return reuse
end

function Wrappers.GetItemCooldown(itemID: number): Maybe<GetItemCooldownResults>
	local r1, r2, r3 = C_Container.GetItemCooldown(itemID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		startTime = r1,
		duration = r2,
		enable = r3,
	})
end

function Wrappers.GetItemCooldownInto(reuse: GetItemCooldownResults, itemID: number): Maybe<GetItemCooldownResults>
	local r1, r2, r3 = C_Container.GetItemCooldown(itemID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return Reuse.just(reuse)
end

function Wrappers.PlayerHasHearthstone(): Maybe<number>
	return Maybe.of(C_Container.PlayerHasHearthstone())
end

function Wrappers.PlayerHasHearthstoneInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Container.PlayerHasHearthstone())
end

return Wrappers
