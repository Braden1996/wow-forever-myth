--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetQuestPortraitInfo(questID: number): Maybe<AdventureMapQuestPortraitInfo>
	return Maybe.of(C_AdventureMap.GetQuestPortraitInfo(questID))
end

function Wrappers.GetQuestPortraitInfoInto(
	reuse: Maybe<AdventureMapQuestPortraitInfo>,
	questID: number
): Maybe<AdventureMapQuestPortraitInfo>
	return Reuse.maybe(reuse, C_AdventureMap.GetQuestPortraitInfo(questID))
end

return Wrappers
