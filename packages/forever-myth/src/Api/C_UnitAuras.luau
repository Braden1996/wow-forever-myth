--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.AddAuraSound(trigger: Enum_UnitAuraSoundTrigger, sound: UnitAuraSoundInfo): Maybe<number>
	return Maybe.of(C_UnitAuras.AddAuraSound(trigger, sound))
end

function Wrappers.AddAuraSoundInto(
	reuse: Maybe<number>,
	trigger: Enum_UnitAuraSoundTrigger,
	sound: UnitAuraSoundInfo
): Maybe<number>
	return Reuse.maybe(reuse, C_UnitAuras.AddAuraSound(trigger, sound))
end

function Wrappers.AddPrivateAuraAnchor(args: AddPrivateAuraAnchorArgs): Maybe<number>
	return Maybe.of(C_UnitAuras.AddPrivateAuraAnchor(args))
end

function Wrappers.AddPrivateAuraAnchorInto(reuse: Maybe<number>, args: AddPrivateAuraAnchorArgs): Maybe<number>
	return Reuse.maybe(reuse, C_UnitAuras.AddPrivateAuraAnchor(args))
end

function Wrappers.DoesAuraHaveExpirationTime(auraInstanceUnit: UnitToken, auraInstanceID: number): Maybe<boolean>
	return Maybe.of(C_UnitAuras.DoesAuraHaveExpirationTime(auraInstanceUnit, auraInstanceID))
end

function Wrappers.DoesAuraHaveExpirationTimeInto(
	reuse: Maybe<boolean>,
	auraInstanceUnit: UnitToken,
	auraInstanceID: number
): Maybe<boolean>
	return Reuse.maybe(reuse, C_UnitAuras.DoesAuraHaveExpirationTime(auraInstanceUnit, auraInstanceID))
end

function Wrappers.GetAuraApplicationDisplayCount(
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	minDisplayCount: number?,
	maxDisplayCount: number?
): Maybe<string>
	return Maybe.of(
		C_UnitAuras.GetAuraApplicationDisplayCount(auraInstanceUnit, auraInstanceID, minDisplayCount, maxDisplayCount)
	)
end

function Wrappers.GetAuraApplicationDisplayCountInto(
	reuse: Maybe<string>,
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	minDisplayCount: number?,
	maxDisplayCount: number?
): Maybe<string>
	return Reuse.maybe(
		reuse,
		C_UnitAuras.GetAuraApplicationDisplayCount(auraInstanceUnit, auraInstanceID, minDisplayCount, maxDisplayCount)
	)
end

function Wrappers.GetAuraBaseDuration(
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	spellID: SpellIdentifier?
): Maybe<number>
	return Maybe.of(C_UnitAuras.GetAuraBaseDuration(auraInstanceUnit, auraInstanceID, spellID))
end

function Wrappers.GetAuraBaseDurationInto(
	reuse: Maybe<number>,
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	spellID: SpellIdentifier?
): Maybe<number>
	return Reuse.maybe(reuse, C_UnitAuras.GetAuraBaseDuration(auraInstanceUnit, auraInstanceID, spellID))
end

function Wrappers.GetAuraCasterGUID(auraInstanceUnit: UnitToken, auraInstanceID: number): Maybe<WOWGUID>
	return Maybe.of(C_UnitAuras.GetAuraCasterGUID(auraInstanceUnit, auraInstanceID))
end

function Wrappers.GetAuraCasterGUIDInto(
	reuse: Maybe<WOWGUID>,
	auraInstanceUnit: UnitToken,
	auraInstanceID: number
): Maybe<WOWGUID>
	return Reuse.maybe(reuse, C_UnitAuras.GetAuraCasterGUID(auraInstanceUnit, auraInstanceID))
end

function Wrappers.GetAuraDataByAuraInstanceID(
	unit: UnitTokenRestrictedForAddOns,
	auraInstanceID: number
): Maybe<AuraData>
	return Maybe.of(C_UnitAuras.GetAuraDataByAuraInstanceID(unit, auraInstanceID))
end

function Wrappers.GetAuraDataByAuraInstanceIDInto(
	reuse: Maybe<AuraData>,
	unit: UnitTokenRestrictedForAddOns,
	auraInstanceID: number
): Maybe<AuraData>
	return Reuse.maybe(reuse, C_UnitAuras.GetAuraDataByAuraInstanceID(unit, auraInstanceID))
end

function Wrappers.GetAuraDataByIndex(
	unit: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<AuraData>
	return Maybe.of(C_UnitAuras.GetAuraDataByIndex(unit, index, filter))
end

function Wrappers.GetAuraDataByIndexInto(
	reuse: Maybe<AuraData>,
	unit: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<AuraData>
	return Reuse.maybe(reuse, C_UnitAuras.GetAuraDataByIndex(unit, index, filter))
end

function Wrappers.GetAuraDataBySlot(unit: UnitTokenRestrictedForAddOns, slot: number): Maybe<AuraData>
	return Maybe.of(C_UnitAuras.GetAuraDataBySlot(unit, slot))
end

function Wrappers.GetAuraDataBySlotInto(
	reuse: Maybe<AuraData>,
	unit: UnitTokenRestrictedForAddOns,
	slot: number
): Maybe<AuraData>
	return Reuse.maybe(reuse, C_UnitAuras.GetAuraDataBySlot(unit, slot))
end

function Wrappers.GetAuraDataBySpellName(
	unit: UnitTokenRestrictedForAddOns,
	spellName: string,
	filter: AuraFilters?
): Maybe<AuraData>
	return Maybe.of(C_UnitAuras.GetAuraDataBySpellName(unit, spellName, filter))
end

function Wrappers.GetAuraDataBySpellNameInto(
	reuse: Maybe<AuraData>,
	unit: UnitTokenRestrictedForAddOns,
	spellName: string,
	filter: AuraFilters?
): Maybe<AuraData>
	return Reuse.maybe(reuse, C_UnitAuras.GetAuraDataBySpellName(unit, spellName, filter))
end

function Wrappers.GetAuraDispelTypeColor(
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	curve: LuaColorCurveObject
): Maybe<ColorMixin>
	return Maybe.of(C_UnitAuras.GetAuraDispelTypeColor(auraInstanceUnit, auraInstanceID, curve))
end

function Wrappers.GetAuraDispelTypeColorInto(
	reuse: Maybe<ColorMixin>,
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	curve: LuaColorCurveObject
): Maybe<ColorMixin>
	return Reuse.maybe(reuse, C_UnitAuras.GetAuraDispelTypeColor(auraInstanceUnit, auraInstanceID, curve))
end

function Wrappers.GetAuraDuration(auraInstanceUnit: UnitToken, auraInstanceID: number): Maybe<LuaDurationObject>
	return Maybe.of(C_UnitAuras.GetAuraDuration(auraInstanceUnit, auraInstanceID))
end

function Wrappers.GetAuraDurationInto(
	reuse: Maybe<LuaDurationObject>,
	auraInstanceUnit: UnitToken,
	auraInstanceID: number
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_UnitAuras.GetAuraDuration(auraInstanceUnit, auraInstanceID))
end

function Wrappers.GetBuffDataByIndex(
	unit: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<AuraData>
	return Maybe.of(C_UnitAuras.GetBuffDataByIndex(unit, index, filter))
end

function Wrappers.GetBuffDataByIndexInto(
	reuse: Maybe<AuraData>,
	unit: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<AuraData>
	return Reuse.maybe(reuse, C_UnitAuras.GetBuffDataByIndex(unit, index, filter))
end

function Wrappers.GetCooldownAuraBySpellID(spellID: SpellIdentifier): Maybe<number>
	return Maybe.of(C_UnitAuras.GetCooldownAuraBySpellID(spellID))
end

function Wrappers.GetCooldownAuraBySpellIDInto(reuse: Maybe<number>, spellID: SpellIdentifier): Maybe<number>
	return Reuse.maybe(reuse, C_UnitAuras.GetCooldownAuraBySpellID(spellID))
end

function Wrappers.GetDebuffDataByIndex(
	unit: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<AuraData>
	return Maybe.of(C_UnitAuras.GetDebuffDataByIndex(unit, index, filter))
end

function Wrappers.GetDebuffDataByIndexInto(
	reuse: Maybe<AuraData>,
	unit: UnitTokenRestrictedForAddOns,
	index: number,
	filter: AuraFilters?
): Maybe<AuraData>
	return Reuse.maybe(reuse, C_UnitAuras.GetDebuffDataByIndex(unit, index, filter))
end

function Wrappers.GetPlayerAuraBySpellID(spellID: SpellIdentifier): Maybe<AuraData>
	return Maybe.of(C_UnitAuras.GetPlayerAuraBySpellID(spellID))
end

function Wrappers.GetPlayerAuraBySpellIDInto(reuse: Maybe<AuraData>, spellID: SpellIdentifier): Maybe<AuraData>
	return Reuse.maybe(reuse, C_UnitAuras.GetPlayerAuraBySpellID(spellID))
end

function Wrappers.GetRefreshCarryOverDuration(
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	spellID: SpellIdentifier?
): Maybe<number>
	return Maybe.of(C_UnitAuras.GetRefreshCarryOverDuration(auraInstanceUnit, auraInstanceID, spellID))
end

function Wrappers.GetRefreshCarryOverDurationInto(
	reuse: Maybe<number>,
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	spellID: SpellIdentifier?
): Maybe<number>
	return Reuse.maybe(reuse, C_UnitAuras.GetRefreshCarryOverDuration(auraInstanceUnit, auraInstanceID, spellID))
end

function Wrappers.GetRefreshExtendedDuration(
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	spellID: SpellIdentifier?
): Maybe<number>
	return Maybe.of(C_UnitAuras.GetRefreshExtendedDuration(auraInstanceUnit, auraInstanceID, spellID))
end

function Wrappers.GetRefreshExtendedDurationInto(
	reuse: Maybe<number>,
	auraInstanceUnit: UnitToken,
	auraInstanceID: number,
	spellID: SpellIdentifier?
): Maybe<number>
	return Reuse.maybe(reuse, C_UnitAuras.GetRefreshExtendedDuration(auraInstanceUnit, auraInstanceID, spellID))
end

function Wrappers.GetUnitAuraBySpellID(unit: UnitTokenRestrictedForAddOns, spellID: SpellIdentifier): Maybe<AuraData>
	return Maybe.of(C_UnitAuras.GetUnitAuraBySpellID(unit, spellID))
end

function Wrappers.GetUnitAuraBySpellIDInto(
	reuse: Maybe<AuraData>,
	unit: UnitTokenRestrictedForAddOns,
	spellID: SpellIdentifier
): Maybe<AuraData>
	return Reuse.maybe(reuse, C_UnitAuras.GetUnitAuraBySpellID(unit, spellID))
end

return Wrappers
