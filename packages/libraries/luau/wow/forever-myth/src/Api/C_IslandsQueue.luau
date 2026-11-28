--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetIslandsWeeklyQuestID(): Maybe<number>
	return Maybe.of(C_IslandsQueue.GetIslandsWeeklyQuestID())
end

function Wrappers.GetIslandsWeeklyQuestIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_IslandsQueue.GetIslandsWeeklyQuestID())
end

return Wrappers
