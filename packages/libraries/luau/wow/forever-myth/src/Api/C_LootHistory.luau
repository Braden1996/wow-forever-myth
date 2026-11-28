--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetInfoForEncounter(encounterID: number): Maybe<EncounterLootInfo>
	return Maybe.of(C_LootHistory.GetInfoForEncounter(encounterID))
end

function Wrappers.GetInfoForEncounterInto(
	reuse: Maybe<EncounterLootInfo>,
	encounterID: number
): Maybe<EncounterLootInfo>
	return Reuse.maybe(reuse, C_LootHistory.GetInfoForEncounter(encounterID))
end

function Wrappers.GetSortedDropsForEncounter(encounterID: number): Maybe<{ EncounterLootDropInfo }>
	return Maybe.of(C_LootHistory.GetSortedDropsForEncounter(encounterID))
end

function Wrappers.GetSortedDropsForEncounterInto(
	reuse: Maybe<{ EncounterLootDropInfo }>,
	encounterID: number
): Maybe<{ EncounterLootDropInfo }>
	return Reuse.maybe(reuse, C_LootHistory.GetSortedDropsForEncounter(encounterID))
end

function Wrappers.GetSortedInfoForDrop(encounterID: number, lootListKey: number): Maybe<EncounterLootDropInfo>
	return Maybe.of(C_LootHistory.GetSortedInfoForDrop(encounterID, lootListKey))
end

function Wrappers.GetSortedInfoForDropInto(
	reuse: Maybe<EncounterLootDropInfo>,
	encounterID: number,
	lootListKey: number
): Maybe<EncounterLootDropInfo>
	return Reuse.maybe(reuse, C_LootHistory.GetSortedInfoForDrop(encounterID, lootListKey))
end

return Wrappers
