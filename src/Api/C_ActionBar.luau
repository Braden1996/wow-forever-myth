--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetActionAutocastResults = {
	read autocastAllowed: boolean,
	read autocastEnabled: boolean,
}

export type IsUsableActionResults = {
	read isUsable: boolean,
	read isLackingResources: boolean,
}

local Wrappers = {}

function Wrappers.FindAssistedCombatActionButtons(setToSearch: Enum_ActionBarSet?): Maybe<{ number }>
	return Maybe.of(C_ActionBar.FindAssistedCombatActionButtons(setToSearch))
end

function Wrappers.FindAssistedCombatActionButtonsInto(
	reuse: Maybe<{ number }>,
	setToSearch: Enum_ActionBarSet?
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_ActionBar.FindAssistedCombatActionButtons(setToSearch))
end

function Wrappers.FindFlyoutActionButtons(flyoutID: number, setToSearch: Enum_ActionBarSet?): Maybe<{ number }>
	return Maybe.of(C_ActionBar.FindFlyoutActionButtons(flyoutID, setToSearch))
end

function Wrappers.FindFlyoutActionButtonsInto(
	reuse: Maybe<{ number }>,
	flyoutID: number,
	setToSearch: Enum_ActionBarSet?
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_ActionBar.FindFlyoutActionButtons(flyoutID, setToSearch))
end

function Wrappers.FindPetActionButtons(petActionID: number, setToSearch: Enum_ActionBarSet?): Maybe<{ number }>
	return Maybe.of(C_ActionBar.FindPetActionButtons(petActionID, setToSearch))
end

function Wrappers.FindPetActionButtonsInto(
	reuse: Maybe<{ number }>,
	petActionID: number,
	setToSearch: Enum_ActionBarSet?
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_ActionBar.FindPetActionButtons(petActionID, setToSearch))
end

function Wrappers.FindSpellActionButtons(spellID: SpellIdentifier, setToSearch: Enum_ActionBarSet?): Maybe<{ number }>
	return Maybe.of(C_ActionBar.FindSpellActionButtons(spellID, setToSearch))
end

function Wrappers.FindSpellActionButtonsInto(
	reuse: Maybe<{ number }>,
	spellID: SpellIdentifier,
	setToSearch: Enum_ActionBarSet?
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_ActionBar.FindSpellActionButtons(spellID, setToSearch))
end

function Wrappers.GetActionAutocast(actionID: number): Maybe<GetActionAutocastResults>
	local r1, r2 = C_ActionBar.GetActionAutocast(actionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		autocastAllowed = r1,
		autocastEnabled = r2,
	})
end

function Wrappers.GetActionAutocastInto(
	reuse: GetActionAutocastResults,
	actionID: number
): Maybe<GetActionAutocastResults>
	local r1, r2 = C_ActionBar.GetActionAutocast(actionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.autocastAllowed = r1
	fields.autocastEnabled = r2
	return Reuse.just(reuse)
end

function Wrappers.GetActionChargeDuration(actionID: number): Maybe<LuaDurationObject>
	return Maybe.of(C_ActionBar.GetActionChargeDuration(actionID))
end

function Wrappers.GetActionChargeDurationInto(
	reuse: Maybe<LuaDurationObject>,
	actionID: number
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_ActionBar.GetActionChargeDuration(actionID))
end

function Wrappers.GetActionCharges(actionID: number): Maybe<SpellChargeInfo>
	return Maybe.of(C_ActionBar.GetActionCharges(actionID))
end

function Wrappers.GetActionChargesInto(reuse: Maybe<SpellChargeInfo>, actionID: number): Maybe<SpellChargeInfo>
	return Reuse.maybe(reuse, C_ActionBar.GetActionCharges(actionID))
end

function Wrappers.GetActionCooldown(actionID: number): Maybe<SpellCooldownInfo>
	return Maybe.of(C_ActionBar.GetActionCooldown(actionID))
end

function Wrappers.GetActionCooldownInto(reuse: Maybe<SpellCooldownInfo>, actionID: number): Maybe<SpellCooldownInfo>
	return Reuse.maybe(reuse, C_ActionBar.GetActionCooldown(actionID))
end

function Wrappers.GetActionCooldownDuration(actionID: number, ignoreGCD: boolean?): Maybe<LuaDurationObject>
	return Maybe.of(C_ActionBar.GetActionCooldownDuration(actionID, ignoreGCD))
end

function Wrappers.GetActionCooldownDurationInto(
	reuse: Maybe<LuaDurationObject>,
	actionID: number,
	ignoreGCD: boolean?
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_ActionBar.GetActionCooldownDuration(actionID, ignoreGCD))
end

function Wrappers.GetActionDisplayCount(
	actionID: number,
	maxDisplayCount: number?,
	replacementString: string?
): Maybe<string>
	return Maybe.of(C_ActionBar.GetActionDisplayCount(actionID, maxDisplayCount, replacementString))
end

function Wrappers.GetActionDisplayCountInto(
	reuse: Maybe<string>,
	actionID: number,
	maxDisplayCount: number?,
	replacementString: string?
): Maybe<string>
	return Reuse.maybe(reuse, C_ActionBar.GetActionDisplayCount(actionID, maxDisplayCount, replacementString))
end

function Wrappers.GetActionLossOfControlCooldownDuration(actionID: number): Maybe<LuaDurationObject>
	return Maybe.of(C_ActionBar.GetActionLossOfControlCooldownDuration(actionID))
end

function Wrappers.GetActionLossOfControlCooldownDurationInto(
	reuse: Maybe<LuaDurationObject>,
	actionID: number
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_ActionBar.GetActionLossOfControlCooldownDuration(actionID))
end

function Wrappers.GetActionLossOfControlCooldownInfo(actionID: number): Maybe<SpellLossOfControlInfo>
	return Maybe.of(C_ActionBar.GetActionLossOfControlCooldownInfo(actionID))
end

function Wrappers.GetActionLossOfControlCooldownInfoInto(
	reuse: Maybe<SpellLossOfControlInfo>,
	actionID: number
): Maybe<SpellLossOfControlInfo>
	return Reuse.maybe(reuse, C_ActionBar.GetActionLossOfControlCooldownInfo(actionID))
end

function Wrappers.GetActionText(actionID: number): Maybe<string>
	return Maybe.of(C_ActionBar.GetActionText(actionID))
end

function Wrappers.GetActionTextInto(reuse: Maybe<string>, actionID: number): Maybe<string>
	return Reuse.maybe(reuse, C_ActionBar.GetActionText(actionID))
end

function Wrappers.GetActionTexture(actionID: number): Maybe<fileID>
	return Maybe.of(C_ActionBar.GetActionTexture(actionID))
end

function Wrappers.GetActionTextureInto(reuse: Maybe<fileID>, actionID: number): Maybe<fileID>
	return Reuse.maybe(reuse, C_ActionBar.GetActionTexture(actionID))
end

function Wrappers.GetActionUseCount(actionID: number): Maybe<number>
	return Maybe.of(C_ActionBar.GetActionUseCount(actionID))
end

function Wrappers.GetActionUseCountInto(reuse: Maybe<number>, actionID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ActionBar.GetActionUseCount(actionID))
end

function Wrappers.GetBonusBarIndexForSlot(slotID: number): Maybe<number>
	return Maybe.of(C_ActionBar.GetBonusBarIndexForSlot(slotID))
end

function Wrappers.GetBonusBarIndexForSlotInto(reuse: Maybe<number>, slotID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ActionBar.GetBonusBarIndexForSlot(slotID))
end

function Wrappers.GetItemActionOnEquipSpellID(actionID: number): Maybe<number>
	return Maybe.of(C_ActionBar.GetItemActionOnEquipSpellID(actionID))
end

function Wrappers.GetItemActionOnEquipSpellIDInto(reuse: Maybe<number>, actionID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ActionBar.GetItemActionOnEquipSpellID(actionID))
end

function Wrappers.GetOverrideBarSkin(): Maybe<fileID>
	return Maybe.of(C_ActionBar.GetOverrideBarSkin())
end

function Wrappers.GetOverrideBarSkinInto(reuse: Maybe<fileID>): Maybe<fileID>
	return Reuse.maybe(reuse, C_ActionBar.GetOverrideBarSkin())
end

function Wrappers.GetPetActionPetBarIndices(petActionID: number, setToSearch: Enum_ActionBarSet?): Maybe<{ number }>
	return Maybe.of(C_ActionBar.GetPetActionPetBarIndices(petActionID, setToSearch))
end

function Wrappers.GetPetActionPetBarIndicesInto(
	reuse: Maybe<{ number }>,
	petActionID: number,
	setToSearch: Enum_ActionBarSet?
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_ActionBar.GetPetActionPetBarIndices(petActionID, setToSearch))
end

function Wrappers.GetProfessionQuality(actionID: number): Maybe<number>
	return Maybe.of(C_ActionBar.GetProfessionQuality(actionID))
end

function Wrappers.GetProfessionQualityInto(reuse: Maybe<number>, actionID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ActionBar.GetProfessionQuality(actionID))
end

function Wrappers.GetProfessionQualityInfo(actionID: number): Maybe<CraftingQualityInfo>
	return Maybe.of(C_ActionBar.GetProfessionQualityInfo(actionID))
end

function Wrappers.GetProfessionQualityInfoInto(
	reuse: Maybe<CraftingQualityInfo>,
	actionID: number
): Maybe<CraftingQualityInfo>
	return Reuse.maybe(reuse, C_ActionBar.GetProfessionQualityInfo(actionID))
end

function Wrappers.HasAction(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.HasAction(actionID))
end

function Wrappers.HasActionInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.HasAction(actionID))
end

function Wrappers.HasRangeRequirements(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.HasRangeRequirements(actionID))
end

function Wrappers.HasRangeRequirementsInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.HasRangeRequirements(actionID))
end

function Wrappers.IsActionInRange(actionID: number, target: UnitToken?): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsActionInRange(actionID, target))
end

function Wrappers.IsActionInRangeInto(reuse: Maybe<boolean>, actionID: number, target: UnitToken?): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsActionInRange(actionID, target))
end

function Wrappers.IsAttackAction(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsAttackAction(actionID))
end

function Wrappers.IsAttackActionInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsAttackAction(actionID))
end

function Wrappers.IsAutoRepeatAction(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsAutoRepeatAction(actionID))
end

function Wrappers.IsAutoRepeatActionInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsAutoRepeatAction(actionID))
end

function Wrappers.IsConsumableAction(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsConsumableAction(actionID))
end

function Wrappers.IsConsumableActionInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsConsumableAction(actionID))
end

function Wrappers.IsCurrentAction(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsCurrentAction(actionID))
end

function Wrappers.IsCurrentActionInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsCurrentAction(actionID))
end

function Wrappers.IsEquippedAction(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsEquippedAction(actionID))
end

function Wrappers.IsEquippedActionInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsEquippedAction(actionID))
end

function Wrappers.IsItemAction(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsItemAction(actionID))
end

function Wrappers.IsItemActionInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsItemAction(actionID))
end

function Wrappers.IsMacroActionWithShowTooltip(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsMacroActionWithShowTooltip(actionID))
end

function Wrappers.IsMacroActionWithShowTooltipInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsMacroActionWithShowTooltip(actionID))
end

function Wrappers.IsStackableAction(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.IsStackableAction(actionID))
end

function Wrappers.IsStackableActionInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.IsStackableAction(actionID))
end

function Wrappers.IsUsableAction(actionID: number): Maybe<IsUsableActionResults>
	local r1, r2 = C_ActionBar.IsUsableAction(actionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		isUsable = r1,
		isLackingResources = r2,
	})
end

function Wrappers.IsUsableActionInto(reuse: IsUsableActionResults, actionID: number): Maybe<IsUsableActionResults>
	local r1, r2 = C_ActionBar.IsUsableAction(actionID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.isUsable = r1
	fields.isLackingResources = r2
	return Reuse.just(reuse)
end

function Wrappers.UsesActionText(actionID: number): Maybe<boolean>
	return Maybe.of(C_ActionBar.UsesActionText(actionID))
end

function Wrappers.UsesActionTextInto(reuse: Maybe<boolean>, actionID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_ActionBar.UsesActionText(actionID))
end

return Wrappers
