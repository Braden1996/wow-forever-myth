--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetSessionBeginDetails(): Maybe<QuestSessionPlayerDetails>
	return Maybe.of(C_QuestSession.GetSessionBeginDetails())
end

function Wrappers.GetSessionBeginDetailsInto(reuse: Maybe<QuestSessionPlayerDetails>): Maybe<QuestSessionPlayerDetails>
	return Reuse.maybe(reuse, C_QuestSession.GetSessionBeginDetails())
end

function Wrappers.GetSuperTrackedQuest(): Maybe<number>
	return Maybe.of(C_QuestSession.GetSuperTrackedQuest())
end

function Wrappers.GetSuperTrackedQuestInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_QuestSession.GetSuperTrackedQuest())
end

return Wrappers
