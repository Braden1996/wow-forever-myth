--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetRewardItemID(achievementID: number): Maybe<number>
	return Maybe.of(C_AchievementInfo.GetRewardItemID(achievementID))
end

function Wrappers.GetRewardItemIDInto(reuse: Maybe<number>, achievementID: number): Maybe<number>
	return Reuse.maybe(reuse, C_AchievementInfo.GetRewardItemID(achievementID))
end

return Wrappers
