--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetQuestLineInfo(questID: number, uiMapID: number?, displayableOnly: boolean?): Maybe<QuestLineInfo>
	return Maybe.of(C_QuestLine.GetQuestLineInfo(questID, uiMapID, displayableOnly))
end

function Wrappers.GetQuestLineInfoInto(
	reuse: Maybe<QuestLineInfo>,
	questID: number,
	uiMapID: number?,
	displayableOnly: boolean?
): Maybe<QuestLineInfo>
	return Reuse.maybe(reuse, C_QuestLine.GetQuestLineInfo(questID, uiMapID, displayableOnly))
end

return Wrappers
