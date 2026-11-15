--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetAuraStatChangesResults = {
	read healthChange: number,
	read powerTypeChanges: { PowerTypeChange },
}

export type GetLastCategoryCooldownSourceResults = {
	read spellID: Maybe<number>,
	read itemID: Maybe<number>,
}

export type GetMawPowerRarityInfoBySpellIDResults = {
	read rarityID: number,
	read rarityBorderAtlas: textureAtlas,
}

export type GetSpellAutoCastResults = {
	read autoCastAllowed: boolean,
	read autoCastEnabled: boolean,
}

export type GetSpellTextureResults = {
	read iconID: fileID,
	read originalIconID: fileID,
	read conditionalIconID: Maybe<fileID>,
}

export type GetVisibilityInfoResults = {
	read hasCustom: boolean,
	read alwaysShowMine: boolean,
	read showForMySpec: boolean,
}

export type IsSpellUsableResults = {
	read isUsable: boolean,
	read insufficientPower: boolean,
}

local Wrappers = {}

function Wrappers.CancelAutoRepeatSpell(): Maybe<boolean>
	return Maybe.of(C_Spell.CancelAutoRepeatSpell())
end

function Wrappers.CancelAutoRepeatSpellInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_Spell.CancelAutoRepeatSpell())
end

function Wrappers.GetAuraStatChanges(spellID: number): GetAuraStatChangesResults
	local r1, r2 = C_Spell.GetAuraStatChanges(spellID)
	return {
		healthChange = r1,
		powerTypeChanges = r2,
	}
end

function Wrappers.GetAuraStatChangesInto(reuse: GetAuraStatChangesResults, spellID: number): GetAuraStatChangesResults
	local r1, r2 = C_Spell.GetAuraStatChanges(spellID)
	local fields = Reuse.fields(reuse)
	fields.healthChange = r1
	fields.powerTypeChanges = r2
	return reuse
end

function Wrappers.GetDeadlyDebuffInfo(spellIdentifier: SpellIdentifier): Maybe<DeadlyDebuffInfo>
	return Maybe.of(C_Spell.GetDeadlyDebuffInfo(spellIdentifier))
end

function Wrappers.GetDeadlyDebuffInfoInto(
	reuse: Maybe<DeadlyDebuffInfo>,
	spellIdentifier: SpellIdentifier
): Maybe<DeadlyDebuffInfo>
	return Reuse.maybe(reuse, C_Spell.GetDeadlyDebuffInfo(spellIdentifier))
end

function Wrappers.GetItemCooldown(itemID: number): Maybe<SpellCooldownInfo>
	return Maybe.of(C_Spell.GetItemCooldown(itemID))
end

function Wrappers.GetItemCooldownInto(reuse: Maybe<SpellCooldownInfo>, itemID: number): Maybe<SpellCooldownInfo>
	return Reuse.maybe(reuse, C_Spell.GetItemCooldown(itemID))
end

function Wrappers.GetLastCategoryCooldownSource(spellCategory: number): Maybe<GetLastCategoryCooldownSourceResults>
	local r1, r2 = C_Spell.GetLastCategoryCooldownSource(spellCategory)
	if r1 == nil and r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		spellID = Maybe.of(r1),
		itemID = Maybe.of(r2),
	})
end

function Wrappers.GetLastCategoryCooldownSourceInto(
	reuse: GetLastCategoryCooldownSourceResults,
	spellCategory: number
): Maybe<GetLastCategoryCooldownSourceResults>
	local r1, r2 = C_Spell.GetLastCategoryCooldownSource(spellCategory)
	if r1 == nil and r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.spellID = Reuse.maybe(fields.spellID, r1)
	fields.itemID = Reuse.maybe(fields.itemID, r2)
	return Reuse.just(reuse)
end

function Wrappers.GetMawPowerLinkBySpellID(spellID: SpellIdentifier): Maybe<string>
	return Maybe.of(C_Spell.GetMawPowerLinkBySpellID(spellID))
end

function Wrappers.GetMawPowerLinkBySpellIDInto(reuse: Maybe<string>, spellID: SpellIdentifier): Maybe<string>
	return Reuse.maybe(reuse, C_Spell.GetMawPowerLinkBySpellID(spellID))
end

function Wrappers.GetMawPowerRarityInfoBySpellID(spellID: SpellIdentifier): Maybe<GetMawPowerRarityInfoBySpellIDResults>
	local r1, r2 = C_Spell.GetMawPowerRarityInfoBySpellID(spellID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		rarityID = r1,
		rarityBorderAtlas = r2,
	})
end

function Wrappers.GetMawPowerRarityInfoBySpellIDInto(
	reuse: GetMawPowerRarityInfoBySpellIDResults,
	spellID: SpellIdentifier
): Maybe<GetMawPowerRarityInfoBySpellIDResults>
	local r1, r2 = C_Spell.GetMawPowerRarityInfoBySpellID(spellID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.rarityID = r1
	fields.rarityBorderAtlas = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSpellAutoCast(spellIdentifier: SpellIdentifier): Maybe<GetSpellAutoCastResults>
	local r1, r2 = C_Spell.GetSpellAutoCast(spellIdentifier)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		autoCastAllowed = r1,
		autoCastEnabled = r2,
	})
end

function Wrappers.GetSpellAutoCastInto(
	reuse: GetSpellAutoCastResults,
	spellIdentifier: SpellIdentifier
): Maybe<GetSpellAutoCastResults>
	local r1, r2 = C_Spell.GetSpellAutoCast(spellIdentifier)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.autoCastAllowed = r1
	fields.autoCastEnabled = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSpellChargeDuration(spellIdentifier: SpellIdentifier): Maybe<LuaDurationObject>
	return Maybe.of(C_Spell.GetSpellChargeDuration(spellIdentifier))
end

function Wrappers.GetSpellChargeDurationInto(
	reuse: Maybe<LuaDurationObject>,
	spellIdentifier: SpellIdentifier
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_Spell.GetSpellChargeDuration(spellIdentifier))
end

function Wrappers.GetSpellCharges(spellIdentifier: SpellIdentifier): Maybe<SpellChargeInfo>
	return Maybe.of(C_Spell.GetSpellCharges(spellIdentifier))
end

function Wrappers.GetSpellChargesInto(
	reuse: Maybe<SpellChargeInfo>,
	spellIdentifier: SpellIdentifier
): Maybe<SpellChargeInfo>
	return Reuse.maybe(reuse, C_Spell.GetSpellCharges(spellIdentifier))
end

function Wrappers.GetSpellCooldown(spellIdentifier: SpellIdentifier): Maybe<SpellCooldownInfo>
	return Maybe.of(C_Spell.GetSpellCooldown(spellIdentifier))
end

function Wrappers.GetSpellCooldownInto(
	reuse: Maybe<SpellCooldownInfo>,
	spellIdentifier: SpellIdentifier
): Maybe<SpellCooldownInfo>
	return Reuse.maybe(reuse, C_Spell.GetSpellCooldown(spellIdentifier))
end

function Wrappers.GetSpellCooldownDuration(
	spellIdentifier: SpellIdentifier,
	ignoreGCD: boolean?
): Maybe<LuaDurationObject>
	return Maybe.of(C_Spell.GetSpellCooldownDuration(spellIdentifier, ignoreGCD))
end

function Wrappers.GetSpellCooldownDurationInto(
	reuse: Maybe<LuaDurationObject>,
	spellIdentifier: SpellIdentifier,
	ignoreGCD: boolean?
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_Spell.GetSpellCooldownDuration(spellIdentifier, ignoreGCD))
end

function Wrappers.GetSpellDescription(spellIdentifier: SpellIdentifier): Maybe<string>
	return Maybe.of(C_Spell.GetSpellDescription(spellIdentifier))
end

function Wrappers.GetSpellDescriptionInto(reuse: Maybe<string>, spellIdentifier: SpellIdentifier): Maybe<string>
	return Reuse.maybe(reuse, C_Spell.GetSpellDescription(spellIdentifier))
end

function Wrappers.GetSpellDescriptionForItemLocation(
	spellIdentifier: SpellIdentifier,
	itemLocation: ItemLocationMixin
): Maybe<string>
	return Maybe.of(C_Spell.GetSpellDescriptionForItemLocation(spellIdentifier, itemLocation))
end

function Wrappers.GetSpellDescriptionForItemLocationInto(
	reuse: Maybe<string>,
	spellIdentifier: SpellIdentifier,
	itemLocation: ItemLocationMixin
): Maybe<string>
	return Reuse.maybe(reuse, C_Spell.GetSpellDescriptionForItemLocation(spellIdentifier, itemLocation))
end

function Wrappers.GetSpellIDForSpellIdentifier(spellIdentifier: SpellIdentifier): Maybe<number>
	return Maybe.of(C_Spell.GetSpellIDForSpellIdentifier(spellIdentifier))
end

function Wrappers.GetSpellIDForSpellIdentifierInto(
	reuse: Maybe<number>,
	spellIdentifier: SpellIdentifier
): Maybe<number>
	return Reuse.maybe(reuse, C_Spell.GetSpellIDForSpellIdentifier(spellIdentifier))
end

function Wrappers.GetSpellInfo(spellIdentifier: SpellIdentifier): Maybe<SpellInfo>
	return Maybe.of(C_Spell.GetSpellInfo(spellIdentifier))
end

function Wrappers.GetSpellInfoInto(reuse: Maybe<SpellInfo>, spellIdentifier: SpellIdentifier): Maybe<SpellInfo>
	return Reuse.maybe(reuse, C_Spell.GetSpellInfo(spellIdentifier))
end

function Wrappers.GetSpellLink(spellIdentifier: SpellIdentifier, glyphID: number?): Maybe<string>
	return Maybe.of(C_Spell.GetSpellLink(spellIdentifier, glyphID))
end

function Wrappers.GetSpellLinkInto(
	reuse: Maybe<string>,
	spellIdentifier: SpellIdentifier,
	glyphID: number?
): Maybe<string>
	return Reuse.maybe(reuse, C_Spell.GetSpellLink(spellIdentifier, glyphID))
end

function Wrappers.GetSpellLossOfControlCooldownDuration(spellIdentifier: SpellIdentifier): Maybe<LuaDurationObject>
	return Maybe.of(C_Spell.GetSpellLossOfControlCooldownDuration(spellIdentifier))
end

function Wrappers.GetSpellLossOfControlCooldownDurationInto(
	reuse: Maybe<LuaDurationObject>,
	spellIdentifier: SpellIdentifier
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_Spell.GetSpellLossOfControlCooldownDuration(spellIdentifier))
end

function Wrappers.GetSpellLossOfControlCooldownInfo(spellIdentifier: SpellIdentifier): Maybe<SpellLossOfControlInfo>
	return Maybe.of(C_Spell.GetSpellLossOfControlCooldownInfo(spellIdentifier))
end

function Wrappers.GetSpellLossOfControlCooldownInfoInto(
	reuse: Maybe<SpellLossOfControlInfo>,
	spellIdentifier: SpellIdentifier
): Maybe<SpellLossOfControlInfo>
	return Reuse.maybe(reuse, C_Spell.GetSpellLossOfControlCooldownInfo(spellIdentifier))
end

function Wrappers.GetSpellName(spellIdentifier: SpellIdentifier): Maybe<string>
	return Maybe.of(C_Spell.GetSpellName(spellIdentifier))
end

function Wrappers.GetSpellNameInto(reuse: Maybe<string>, spellIdentifier: SpellIdentifier): Maybe<string>
	return Reuse.maybe(reuse, C_Spell.GetSpellName(spellIdentifier))
end

function Wrappers.GetSpellPowerCost(spellIdentifier: SpellIdentifier): Maybe<{ SpellPowerCostInfo }>
	return Maybe.of(C_Spell.GetSpellPowerCost(spellIdentifier))
end

function Wrappers.GetSpellPowerCostInto(
	reuse: Maybe<{ SpellPowerCostInfo }>,
	spellIdentifier: SpellIdentifier
): Maybe<{ SpellPowerCostInfo }>
	return Reuse.maybe(reuse, C_Spell.GetSpellPowerCost(spellIdentifier))
end

function Wrappers.GetSpellSkillLineAbilityRank(spellIdentifier: SpellIdentifier): Maybe<number>
	return Maybe.of(C_Spell.GetSpellSkillLineAbilityRank(spellIdentifier))
end

function Wrappers.GetSpellSkillLineAbilityRankInto(
	reuse: Maybe<number>,
	spellIdentifier: SpellIdentifier
): Maybe<number>
	return Reuse.maybe(reuse, C_Spell.GetSpellSkillLineAbilityRank(spellIdentifier))
end

function Wrappers.GetSpellSubtext(spellIdentifier: SpellIdentifier): Maybe<string>
	return Maybe.of(C_Spell.GetSpellSubtext(spellIdentifier))
end

function Wrappers.GetSpellSubtextInto(reuse: Maybe<string>, spellIdentifier: SpellIdentifier): Maybe<string>
	return Reuse.maybe(reuse, C_Spell.GetSpellSubtext(spellIdentifier))
end

function Wrappers.GetSpellTexture(spellIdentifier: SpellIdentifier): Maybe<GetSpellTextureResults>
	local r1, r2, r3 = C_Spell.GetSpellTexture(spellIdentifier)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		iconID = r1,
		originalIconID = r2,
		conditionalIconID = Maybe.of(r3),
	})
end

function Wrappers.GetSpellTextureInto(
	reuse: GetSpellTextureResults,
	spellIdentifier: SpellIdentifier
): Maybe<GetSpellTextureResults>
	local r1, r2, r3 = C_Spell.GetSpellTexture(spellIdentifier)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.iconID = r1
	fields.originalIconID = r2
	fields.conditionalIconID = Reuse.maybe(fields.conditionalIconID, r3)
	return Reuse.just(reuse)
end

function Wrappers.GetSpellTradeSkillLink(spellIdentifier: SpellIdentifier): Maybe<string>
	return Maybe.of(C_Spell.GetSpellTradeSkillLink(spellIdentifier))
end

function Wrappers.GetSpellTradeSkillLinkInto(reuse: Maybe<string>, spellIdentifier: SpellIdentifier): Maybe<string>
	return Reuse.maybe(reuse, C_Spell.GetSpellTradeSkillLink(spellIdentifier))
end

function Wrappers.GetVisibilityInfo(
	spellID: number,
	visibilityType: Enum_SpellAuraVisibilityType
): Maybe<GetVisibilityInfoResults>
	local r1, r2, r3 = C_Spell.GetVisibilityInfo(spellID, visibilityType)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		hasCustom = r1,
		alwaysShowMine = r2,
		showForMySpec = r3,
	})
end

function Wrappers.GetVisibilityInfoInto(
	reuse: GetVisibilityInfoResults,
	spellID: number,
	visibilityType: Enum_SpellAuraVisibilityType
): Maybe<GetVisibilityInfoResults>
	local r1, r2, r3 = C_Spell.GetVisibilityInfo(spellID, visibilityType)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.hasCustom = r1
	fields.alwaysShowMine = r2
	fields.showForMySpec = r3
	return Reuse.just(reuse)
end

function Wrappers.IsSpellInRange(spellIdentifier: SpellIdentifier, targetUnit: UnitToken?): Maybe<boolean>
	return Maybe.of(C_Spell.IsSpellInRange(spellIdentifier, targetUnit))
end

function Wrappers.IsSpellInRangeInto(
	reuse: Maybe<boolean>,
	spellIdentifier: SpellIdentifier,
	targetUnit: UnitToken?
): Maybe<boolean>
	return Reuse.maybe(reuse, C_Spell.IsSpellInRange(spellIdentifier, targetUnit))
end

function Wrappers.IsSpellUsable(spellIdentifier: SpellIdentifier): IsSpellUsableResults
	local r1, r2 = C_Spell.IsSpellUsable(spellIdentifier)
	return {
		isUsable = r1,
		insufficientPower = r2,
	}
end

function Wrappers.IsSpellUsableInto(reuse: IsSpellUsableResults, spellIdentifier: SpellIdentifier): IsSpellUsableResults
	local r1, r2 = C_Spell.IsSpellUsable(spellIdentifier)
	local fields = Reuse.fields(reuse)
	fields.isUsable = r1
	fields.insufficientPower = r2
	return reuse
end

return Wrappers
