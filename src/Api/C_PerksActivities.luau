--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetPerksActivityInfo(perksActivityID: number): Maybe<PerksActivityInfo>
	return Maybe.of(C_PerksActivities.GetPerksActivityInfo(perksActivityID))
end

function Wrappers.GetPerksActivityInfoInto(
	reuse: Maybe<PerksActivityInfo>,
	perksActivityID: number
): Maybe<PerksActivityInfo>
	return Reuse.maybe(reuse, C_PerksActivities.GetPerksActivityInfo(perksActivityID))
end

return Wrappers
