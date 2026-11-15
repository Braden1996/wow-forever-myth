--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetQuestRewardCurrencies(questID: number?): Maybe<{ QuestRewardCurrencyInfo }>
	return Maybe.of(C_QuestInfoSystem.GetQuestRewardCurrencies(questID))
end

function Wrappers.GetQuestRewardCurrenciesInto(
	reuse: Maybe<{ QuestRewardCurrencyInfo }>,
	questID: number?
): Maybe<{ QuestRewardCurrencyInfo }>
	return Reuse.maybe(reuse, C_QuestInfoSystem.GetQuestRewardCurrencies(questID))
end

function Wrappers.GetQuestRewardSpellInfo(questID: number?, spellID: number): Maybe<QuestRewardSpellInfo>
	return Maybe.of(C_QuestInfoSystem.GetQuestRewardSpellInfo(questID, spellID))
end

function Wrappers.GetQuestRewardSpellInfoInto(
	reuse: Maybe<QuestRewardSpellInfo>,
	questID: number?,
	spellID: number
): Maybe<QuestRewardSpellInfo>
	return Reuse.maybe(reuse, C_QuestInfoSystem.GetQuestRewardSpellInfo(questID, spellID))
end

function Wrappers.GetQuestRewardSpells(questID: number?): Maybe<{ number }>
	return Maybe.of(C_QuestInfoSystem.GetQuestRewardSpells(questID))
end

function Wrappers.GetQuestRewardSpellsInto(reuse: Maybe<{ number }>, questID: number?): Maybe<{ number }>
	return Reuse.maybe(reuse, C_QuestInfoSystem.GetQuestRewardSpells(questID))
end

return Wrappers
