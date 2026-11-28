--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetRuneforgeModifierInfoResults = {
	read name: string,
	read description: { string },
}

export type GetRuneforgePowersResults = {
	read primaryRuneforgePowerIDs: { number },
	read otherRuneforgePowerIDs: { number },
}

local Wrappers = {}

function Wrappers.GetRuneforgeItemPreviewInfo(
	baseItem: ItemLocationMixin,
	runeforgePowerID: number?,
	modifiers: { number }?
): Maybe<RuneforgeItemPreviewInfo>
	return Maybe.of(C_LegendaryCrafting.GetRuneforgeItemPreviewInfo(baseItem, runeforgePowerID, modifiers))
end

function Wrappers.GetRuneforgeItemPreviewInfoInto(
	reuse: Maybe<RuneforgeItemPreviewInfo>,
	baseItem: ItemLocationMixin,
	runeforgePowerID: number?,
	modifiers: { number }?
): Maybe<RuneforgeItemPreviewInfo>
	return Reuse.maybe(reuse, C_LegendaryCrafting.GetRuneforgeItemPreviewInfo(baseItem, runeforgePowerID, modifiers))
end

function Wrappers.GetRuneforgeModifierInfo(
	baseItem: ItemLocationMixin,
	powerID: number?,
	addedModifierIndex: number,
	modifiers: { number }
): GetRuneforgeModifierInfoResults
	local r1, r2 = C_LegendaryCrafting.GetRuneforgeModifierInfo(baseItem, powerID, addedModifierIndex, modifiers)
	return {
		name = r1,
		description = r2,
	}
end

function Wrappers.GetRuneforgeModifierInfoInto(
	reuse: GetRuneforgeModifierInfoResults,
	baseItem: ItemLocationMixin,
	powerID: number?,
	addedModifierIndex: number,
	modifiers: { number }
): GetRuneforgeModifierInfoResults
	local r1, r2 = C_LegendaryCrafting.GetRuneforgeModifierInfo(baseItem, powerID, addedModifierIndex, modifiers)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.description = r2
	return reuse
end

function Wrappers.GetRuneforgePowers(
	baseItem: ItemLocationMixin?,
	filter: Enum_RuneforgePowerFilter?
): GetRuneforgePowersResults
	local r1, r2 = C_LegendaryCrafting.GetRuneforgePowers(baseItem, filter)
	return {
		primaryRuneforgePowerIDs = r1,
		otherRuneforgePowerIDs = r2,
	}
end

function Wrappers.GetRuneforgePowersInto(
	reuse: GetRuneforgePowersResults,
	baseItem: ItemLocationMixin?,
	filter: Enum_RuneforgePowerFilter?
): GetRuneforgePowersResults
	local r1, r2 = C_LegendaryCrafting.GetRuneforgePowers(baseItem, filter)
	local fields = Reuse.fields(reuse)
	fields.primaryRuneforgePowerIDs = r1
	fields.otherRuneforgePowerIDs = r2
	return reuse
end

return Wrappers
