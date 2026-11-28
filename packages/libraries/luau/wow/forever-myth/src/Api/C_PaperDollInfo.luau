--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetInspectGuildInfoResults = {
	read achievementPoints: number,
	read numMembers: number,
	read guildName: string,
	read realmName: string,
}

export type GetInventorySlotInfoResults = {
	read invSlot: number,
	read slotTexture: fileID,
	read checkRelic: boolean,
}

export type GetInventorySlotInfoForInvSlotResults = {
	read invSlot: number,
	read slotTexture: fileID,
	read checkRelic: boolean,
	read slotName: string,
}

export type GetStaggerPercentageResults = {
	read stagger: number,
	read staggerAgainstTarget: Maybe<number>,
}

local Wrappers = {}

function Wrappers.GetArmorEffectivenessAgainstTarget(armor: number): Maybe<number>
	return Maybe.of(C_PaperDollInfo.GetArmorEffectivenessAgainstTarget(armor))
end

function Wrappers.GetArmorEffectivenessAgainstTargetInto(reuse: Maybe<number>, armor: number): Maybe<number>
	return Reuse.maybe(reuse, C_PaperDollInfo.GetArmorEffectivenessAgainstTarget(armor))
end

function Wrappers.GetInspectAzeriteItemEmpoweredChoices(unit: UnitToken, equipmentSlotIndex: number): Maybe<{ number }>
	return Maybe.of(C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices(unit, equipmentSlotIndex))
end

function Wrappers.GetInspectAzeriteItemEmpoweredChoicesInto(
	reuse: Maybe<{ number }>,
	unit: UnitToken,
	equipmentSlotIndex: number
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices(unit, equipmentSlotIndex))
end

function Wrappers.GetInspectGuildInfo(unitString: string): GetInspectGuildInfoResults
	local r1, r2, r3, r4 = C_PaperDollInfo.GetInspectGuildInfo(unitString)
	return {
		achievementPoints = r1,
		numMembers = r2,
		guildName = r3,
		realmName = r4,
	}
end

function Wrappers.GetInspectGuildInfoInto(
	reuse: GetInspectGuildInfoResults,
	unitString: string
): GetInspectGuildInfoResults
	local r1, r2, r3, r4 = C_PaperDollInfo.GetInspectGuildInfo(unitString)
	local fields = Reuse.fields(reuse)
	fields.achievementPoints = r1
	fields.numMembers = r2
	fields.guildName = r3
	fields.realmName = r4
	return reuse
end

function Wrappers.GetInventorySlotInfo(slotName: string): Maybe<GetInventorySlotInfoResults>
	local r1, r2, r3 = C_PaperDollInfo.GetInventorySlotInfo(slotName)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		invSlot = r1,
		slotTexture = r2,
		checkRelic = r3,
	})
end

function Wrappers.GetInventorySlotInfoInto(
	reuse: GetInventorySlotInfoResults,
	slotName: string
): Maybe<GetInventorySlotInfoResults>
	local r1, r2, r3 = C_PaperDollInfo.GetInventorySlotInfo(slotName)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.invSlot = r1
	fields.slotTexture = r2
	fields.checkRelic = r3
	return Reuse.just(reuse)
end

function Wrappers.GetInventorySlotInfoForInvSlot(invSlotValue: number): Maybe<GetInventorySlotInfoForInvSlotResults>
	local r1, r2, r3, r4 = C_PaperDollInfo.GetInventorySlotInfoForInvSlot(invSlotValue)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		invSlot = r1,
		slotTexture = r2,
		checkRelic = r3,
		slotName = r4,
	})
end

function Wrappers.GetInventorySlotInfoForInvSlotInto(
	reuse: GetInventorySlotInfoForInvSlotResults,
	invSlotValue: number
): Maybe<GetInventorySlotInfoForInvSlotResults>
	local r1, r2, r3, r4 = C_PaperDollInfo.GetInventorySlotInfoForInvSlot(invSlotValue)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.invSlot = r1
	fields.slotTexture = r2
	fields.checkRelic = r3
	fields.slotName = r4
	return Reuse.just(reuse)
end

function Wrappers.GetMinItemLevel(): Maybe<number>
	return Maybe.of(C_PaperDollInfo.GetMinItemLevel())
end

function Wrappers.GetMinItemLevelInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_PaperDollInfo.GetMinItemLevel())
end

function Wrappers.GetStaggerPercentage(unit: UnitToken): GetStaggerPercentageResults
	local r1, r2 = C_PaperDollInfo.GetStaggerPercentage(unit)
	return {
		stagger = r1,
		staggerAgainstTarget = Maybe.of(r2),
	}
end

function Wrappers.GetStaggerPercentageInto(
	reuse: GetStaggerPercentageResults,
	unit: UnitToken
): GetStaggerPercentageResults
	local r1, r2 = C_PaperDollInfo.GetStaggerPercentage(unit)
	local fields = Reuse.fields(reuse)
	fields.stagger = r1
	fields.staggerAgainstTarget = Reuse.maybe(fields.staggerAgainstTarget, r2)
	return reuse
end

function Wrappers.GetTemporaryEnchantmentInfo(slot: unknown): Maybe<TemporaryItemEnchantInfo>
	return Maybe.of(C_PaperDollInfo.GetTemporaryEnchantmentInfo(slot))
end

function Wrappers.GetTemporaryEnchantmentInfoInto(
	reuse: Maybe<TemporaryItemEnchantInfo>,
	slot: unknown
): Maybe<TemporaryItemEnchantInfo>
	return Reuse.maybe(reuse, C_PaperDollInfo.GetTemporaryEnchantmentInfo(slot))
end

return Wrappers
