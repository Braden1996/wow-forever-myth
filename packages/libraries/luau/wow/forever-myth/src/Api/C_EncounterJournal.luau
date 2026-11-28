--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetInstanceForGameMap(mapID: number): Maybe<number>
	return Maybe.of(C_EncounterJournal.GetInstanceForGameMap(mapID))
end

function Wrappers.GetInstanceForGameMapInto(reuse: Maybe<number>, mapID: number): Maybe<number>
	return Reuse.maybe(reuse, C_EncounterJournal.GetInstanceForGameMap(mapID))
end

function Wrappers.GetLootInfoByIndex(index: number, encounterIndex: number?): Maybe<EncounterJournalItemInfo>
	return Maybe.of(C_EncounterJournal.GetLootInfoByIndex(index, encounterIndex))
end

function Wrappers.GetLootInfoByIndexInto(
	reuse: Maybe<EncounterJournalItemInfo>,
	index: number,
	encounterIndex: number?
): Maybe<EncounterJournalItemInfo>
	return Reuse.maybe(reuse, C_EncounterJournal.GetLootInfoByIndex(index, encounterIndex))
end

function Wrappers.GetSectionIconFlags(sectionID: number): Maybe<{ number }>
	return Maybe.of(C_EncounterJournal.GetSectionIconFlags(sectionID))
end

function Wrappers.GetSectionIconFlagsInto(reuse: Maybe<{ number }>, sectionID: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_EncounterJournal.GetSectionIconFlags(sectionID))
end

function Wrappers.GetSectionInfo(sectionID: number): Maybe<EncounterJournalSectionInfo>
	return Maybe.of(C_EncounterJournal.GetSectionInfo(sectionID))
end

function Wrappers.GetSectionInfoInto(
	reuse: Maybe<EncounterJournalSectionInfo>,
	sectionID: number
): Maybe<EncounterJournalSectionInfo>
	return Reuse.maybe(reuse, C_EncounterJournal.GetSectionInfo(sectionID))
end

return Wrappers
