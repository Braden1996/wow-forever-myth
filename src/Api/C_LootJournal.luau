--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetItemSetItems(setID: number): Maybe<{ LootJournalItemInfo }>
	return Maybe.of(C_LootJournal.GetItemSetItems(setID))
end

function Wrappers.GetItemSetItemsInto(
	reuse: Maybe<{ LootJournalItemInfo }>,
	setID: number
): Maybe<{ LootJournalItemInfo }>
	return Reuse.maybe(reuse, C_LootJournal.GetItemSetItems(setID))
end

function Wrappers.GetItemSets(classID: number?, specID: number?): Maybe<{ LootJournalItemSetInfo }>
	return Maybe.of(C_LootJournal.GetItemSets(classID, specID))
end

function Wrappers.GetItemSetsInto(
	reuse: Maybe<{ LootJournalItemSetInfo }>,
	classID: number?,
	specID: number?
): Maybe<{ LootJournalItemSetInfo }>
	return Reuse.maybe(reuse, C_LootJournal.GetItemSets(classID, specID))
end

return Wrappers
