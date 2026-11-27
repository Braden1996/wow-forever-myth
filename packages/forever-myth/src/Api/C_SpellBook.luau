--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type FindSpellBookSlotForSpellResults = {
	read spellBookItemSlotIndex: number,
	read spellBookItemSpellBank: Enum_SpellBookSpellBank,
}

export type GetSpellBookItemAutoCastResults = {
	read autoCastAllowed: boolean,
	read autoCastEnabled: boolean,
}

export type GetSpellBookItemNameResults = {
	read name: string,
	read subName: string,
}

export type GetSpellBookItemTypeResults = {
	read itemType: Enum_SpellBookItemType,
	read actionID: number,
	read spellID: Maybe<number>,
}

export type HasPetSpellsResults = {
	read numPetSpells: number,
	read petNameToken: string,
}

export type IsSpellBookItemUsableResults = {
	read isUsable: boolean,
	read insufficientPower: boolean,
}

local Wrappers = {}

function Wrappers.FindBaseSpellByID(spellID: number): Maybe<number>
	return Maybe.of(C_SpellBook.FindBaseSpellByID(spellID))
end

function Wrappers.FindBaseSpellByIDInto(reuse: Maybe<number>, spellID: number): Maybe<number>
	return Reuse.maybe(reuse, C_SpellBook.FindBaseSpellByID(spellID))
end

function Wrappers.FindSpellBookSlotForSpell(
	spellIdentifier: SpellIdentifier,
	includeHidden: boolean?,
	includeFlyouts: boolean?,
	includeFutureSpells: boolean?,
	includeOffSpec: boolean?
): Maybe<FindSpellBookSlotForSpellResults>
	local r1, r2 = C_SpellBook.FindSpellBookSlotForSpell(
		spellIdentifier,
		includeHidden,
		includeFlyouts,
		includeFutureSpells,
		includeOffSpec
	)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		spellBookItemSlotIndex = r1,
		spellBookItemSpellBank = r2,
	})
end

function Wrappers.FindSpellBookSlotForSpellInto(
	reuse: FindSpellBookSlotForSpellResults,
	spellIdentifier: SpellIdentifier,
	includeHidden: boolean?,
	includeFlyouts: boolean?,
	includeFutureSpells: boolean?,
	includeOffSpec: boolean?
): Maybe<FindSpellBookSlotForSpellResults>
	local r1, r2 = C_SpellBook.FindSpellBookSlotForSpell(
		spellIdentifier,
		includeHidden,
		includeFlyouts,
		includeFutureSpells,
		includeOffSpec
	)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.spellBookItemSlotIndex = r1
	fields.spellBookItemSpellBank = r2
	return Reuse.just(reuse)
end

function Wrappers.FindSpellOverrideByID(spellID: number): Maybe<number>
	return Maybe.of(C_SpellBook.FindSpellOverrideByID(spellID))
end

function Wrappers.FindSpellOverrideByIDInto(reuse: Maybe<number>, spellID: number): Maybe<number>
	return Reuse.maybe(reuse, C_SpellBook.FindSpellOverrideByID(spellID))
end

function Wrappers.GetClassSkillLineInfo(): Maybe<SpellBookSkillLineInfo>
	return Maybe.of(C_SpellBook.GetClassSkillLineInfo())
end

function Wrappers.GetClassSkillLineInfoInto(reuse: Maybe<SpellBookSkillLineInfo>): Maybe<SpellBookSkillLineInfo>
	return Reuse.maybe(reuse, C_SpellBook.GetClassSkillLineInfo())
end

function Wrappers.GetCurrentLevelSpells(level: number): Maybe<{ number }>
	return Maybe.of(C_SpellBook.GetCurrentLevelSpells(level))
end

function Wrappers.GetCurrentLevelSpellsInto(reuse: Maybe<{ number }>, level: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_SpellBook.GetCurrentLevelSpells(level))
end

function Wrappers.GetSkillLineIndexByID(skillLineID: number): Maybe<number>
	return Maybe.of(C_SpellBook.GetSkillLineIndexByID(skillLineID))
end

function Wrappers.GetSkillLineIndexByIDInto(reuse: Maybe<number>, skillLineID: number): Maybe<number>
	return Reuse.maybe(reuse, C_SpellBook.GetSkillLineIndexByID(skillLineID))
end

function Wrappers.GetSpellBookItemAutoCast(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<GetSpellBookItemAutoCastResults>
	local r1, r2 = C_SpellBook.GetSpellBookItemAutoCast(spellBookItemSlotIndex, spellBookItemSpellBank)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		autoCastAllowed = r1,
		autoCastEnabled = r2,
	})
end

function Wrappers.GetSpellBookItemAutoCastInto(
	reuse: GetSpellBookItemAutoCastResults,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<GetSpellBookItemAutoCastResults>
	local r1, r2 = C_SpellBook.GetSpellBookItemAutoCast(spellBookItemSlotIndex, spellBookItemSpellBank)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.autoCastAllowed = r1
	fields.autoCastEnabled = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSpellBookItemChargeDuration(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<LuaDurationObject>
	return Maybe.of(C_SpellBook.GetSpellBookItemChargeDuration(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemChargeDurationInto(
	reuse: Maybe<LuaDurationObject>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<LuaDurationObject>
	return Reuse.maybe(
		reuse,
		C_SpellBook.GetSpellBookItemChargeDuration(spellBookItemSlotIndex, spellBookItemSpellBank)
	)
end

function Wrappers.GetSpellBookItemCharges(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<SpellChargeInfo>
	return Maybe.of(C_SpellBook.GetSpellBookItemCharges(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemChargesInto(
	reuse: Maybe<SpellChargeInfo>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<SpellChargeInfo>
	return Reuse.maybe(reuse, C_SpellBook.GetSpellBookItemCharges(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemCooldown(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<SpellCooldownInfo>
	return Maybe.of(C_SpellBook.GetSpellBookItemCooldown(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemCooldownInto(
	reuse: Maybe<SpellCooldownInfo>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<SpellCooldownInfo>
	return Reuse.maybe(reuse, C_SpellBook.GetSpellBookItemCooldown(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemCooldownDuration(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank,
	ignoreGCD: boolean?
): Maybe<LuaDurationObject>
	return Maybe.of(
		C_SpellBook.GetSpellBookItemCooldownDuration(spellBookItemSlotIndex, spellBookItemSpellBank, ignoreGCD)
	)
end

function Wrappers.GetSpellBookItemCooldownDurationInto(
	reuse: Maybe<LuaDurationObject>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank,
	ignoreGCD: boolean?
): Maybe<LuaDurationObject>
	return Reuse.maybe(
		reuse,
		C_SpellBook.GetSpellBookItemCooldownDuration(spellBookItemSlotIndex, spellBookItemSpellBank, ignoreGCD)
	)
end

function Wrappers.GetSpellBookItemDescription(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<string>
	return Maybe.of(C_SpellBook.GetSpellBookItemDescription(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemDescriptionInto(
	reuse: Maybe<string>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<string>
	return Reuse.maybe(reuse, C_SpellBook.GetSpellBookItemDescription(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemInfo(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<SpellBookItemInfo>
	return Maybe.of(C_SpellBook.GetSpellBookItemInfo(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemInfoInto(
	reuse: Maybe<SpellBookItemInfo>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<SpellBookItemInfo>
	return Reuse.maybe(reuse, C_SpellBook.GetSpellBookItemInfo(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemLink(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank,
	glyphID: number?
): Maybe<string>
	return Maybe.of(C_SpellBook.GetSpellBookItemLink(spellBookItemSlotIndex, spellBookItemSpellBank, glyphID))
end

function Wrappers.GetSpellBookItemLinkInto(
	reuse: Maybe<string>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank,
	glyphID: number?
): Maybe<string>
	return Reuse.maybe(reuse, C_SpellBook.GetSpellBookItemLink(spellBookItemSlotIndex, spellBookItemSpellBank, glyphID))
end

function Wrappers.GetSpellBookItemLossOfControlCooldownDuration(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<LuaDurationObject>
	return Maybe.of(
		C_SpellBook.GetSpellBookItemLossOfControlCooldownDuration(spellBookItemSlotIndex, spellBookItemSpellBank)
	)
end

function Wrappers.GetSpellBookItemLossOfControlCooldownDurationInto(
	reuse: Maybe<LuaDurationObject>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<LuaDurationObject>
	return Reuse.maybe(
		reuse,
		C_SpellBook.GetSpellBookItemLossOfControlCooldownDuration(spellBookItemSlotIndex, spellBookItemSpellBank)
	)
end

function Wrappers.GetSpellBookItemLossOfControlCooldownInfo(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<SpellLossOfControlInfo>
	return Maybe.of(
		C_SpellBook.GetSpellBookItemLossOfControlCooldownInfo(spellBookItemSlotIndex, spellBookItemSpellBank)
	)
end

function Wrappers.GetSpellBookItemLossOfControlCooldownInfoInto(
	reuse: Maybe<SpellLossOfControlInfo>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<SpellLossOfControlInfo>
	return Reuse.maybe(
		reuse,
		C_SpellBook.GetSpellBookItemLossOfControlCooldownInfo(spellBookItemSlotIndex, spellBookItemSpellBank)
	)
end

function Wrappers.GetSpellBookItemName(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<GetSpellBookItemNameResults>
	local r1, r2 = C_SpellBook.GetSpellBookItemName(spellBookItemSlotIndex, spellBookItemSpellBank)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		subName = r2,
	})
end

function Wrappers.GetSpellBookItemNameInto(
	reuse: GetSpellBookItemNameResults,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<GetSpellBookItemNameResults>
	local r1, r2 = C_SpellBook.GetSpellBookItemName(spellBookItemSlotIndex, spellBookItemSpellBank)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.subName = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSpellBookItemPowerCost(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<{ SpellPowerCostInfo }>
	return Maybe.of(C_SpellBook.GetSpellBookItemPowerCost(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemPowerCostInto(
	reuse: Maybe<{ SpellPowerCostInfo }>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<{ SpellPowerCostInfo }>
	return Reuse.maybe(reuse, C_SpellBook.GetSpellBookItemPowerCost(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemSkillLineIndex(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<number>
	return Maybe.of(C_SpellBook.GetSpellBookItemSkillLineIndex(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemSkillLineIndexInto(
	reuse: Maybe<number>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<number>
	return Reuse.maybe(
		reuse,
		C_SpellBook.GetSpellBookItemSkillLineIndex(spellBookItemSlotIndex, spellBookItemSpellBank)
	)
end

function Wrappers.GetSpellBookItemTexture(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<fileID>
	return Maybe.of(C_SpellBook.GetSpellBookItemTexture(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemTextureInto(
	reuse: Maybe<fileID>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<fileID>
	return Reuse.maybe(reuse, C_SpellBook.GetSpellBookItemTexture(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemTradeSkillLink(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<string>
	return Maybe.of(C_SpellBook.GetSpellBookItemTradeSkillLink(spellBookItemSlotIndex, spellBookItemSpellBank))
end

function Wrappers.GetSpellBookItemTradeSkillLinkInto(
	reuse: Maybe<string>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<string>
	return Reuse.maybe(
		reuse,
		C_SpellBook.GetSpellBookItemTradeSkillLink(spellBookItemSlotIndex, spellBookItemSpellBank)
	)
end

function Wrappers.GetSpellBookItemType(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<GetSpellBookItemTypeResults>
	local r1, r2, r3 = C_SpellBook.GetSpellBookItemType(spellBookItemSlotIndex, spellBookItemSpellBank)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemType = r1,
		actionID = r2,
		spellID = Maybe.of(r3),
	})
end

function Wrappers.GetSpellBookItemTypeInto(
	reuse: GetSpellBookItemTypeResults,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): Maybe<GetSpellBookItemTypeResults>
	local r1, r2, r3 = C_SpellBook.GetSpellBookItemType(spellBookItemSlotIndex, spellBookItemSpellBank)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemType = r1
	fields.actionID = r2
	fields.spellID = Reuse.maybe(fields.spellID, r3)
	return Reuse.just(reuse)
end

function Wrappers.GetSpellBookSkillLineInfo(skillLineIndex: number): Maybe<SpellBookSkillLineInfo>
	return Maybe.of(C_SpellBook.GetSpellBookSkillLineInfo(skillLineIndex))
end

function Wrappers.GetSpellBookSkillLineInfoInto(
	reuse: Maybe<SpellBookSkillLineInfo>,
	skillLineIndex: number
): Maybe<SpellBookSkillLineInfo>
	return Reuse.maybe(reuse, C_SpellBook.GetSpellBookSkillLineInfo(skillLineIndex))
end

function Wrappers.HasPetSpells(): Maybe<HasPetSpellsResults>
	local r1, r2 = C_SpellBook.HasPetSpells()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		numPetSpells = r1,
		petNameToken = r2,
	})
end

function Wrappers.HasPetSpellsInto(reuse: HasPetSpellsResults): Maybe<HasPetSpellsResults>
	local r1, r2 = C_SpellBook.HasPetSpells()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.numPetSpells = r1
	fields.petNameToken = r2
	return Reuse.just(reuse)
end

function Wrappers.IsSpellBookItemInRange(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank,
	targetUnit: UnitToken?
): Maybe<boolean>
	return Maybe.of(C_SpellBook.IsSpellBookItemInRange(spellBookItemSlotIndex, spellBookItemSpellBank, targetUnit))
end

function Wrappers.IsSpellBookItemInRangeInto(
	reuse: Maybe<boolean>,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank,
	targetUnit: UnitToken?
): Maybe<boolean>
	return Reuse.maybe(
		reuse,
		C_SpellBook.IsSpellBookItemInRange(spellBookItemSlotIndex, spellBookItemSpellBank, targetUnit)
	)
end

function Wrappers.IsSpellBookItemUsable(
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): IsSpellBookItemUsableResults
	local r1, r2 = C_SpellBook.IsSpellBookItemUsable(spellBookItemSlotIndex, spellBookItemSpellBank)
	return {
		isUsable = r1,
		insufficientPower = r2,
	}
end

function Wrappers.IsSpellBookItemUsableInto(
	reuse: IsSpellBookItemUsableResults,
	spellBookItemSlotIndex: number,
	spellBookItemSpellBank: Enum_SpellBookSpellBank
): IsSpellBookItemUsableResults
	local r1, r2 = C_SpellBook.IsSpellBookItemUsable(spellBookItemSlotIndex, spellBookItemSpellBank)
	local fields = Reuse.fields(reuse)
	fields.isUsable = r1
	fields.insufficientPower = r2
	return reuse
end

return Wrappers
