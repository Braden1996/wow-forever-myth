--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.IsTargetWithinSwingRange(swingType: Enum_PlayerSwingType): Maybe<boolean>
	return Maybe.of(C_SwingTimer.IsTargetWithinSwingRange(swingType))
end

function Wrappers.IsTargetWithinSwingRangeInto(reuse: Maybe<boolean>, swingType: Enum_PlayerSwingType): Maybe<boolean>
	return Reuse.maybe(reuse, C_SwingTimer.IsTargetWithinSwingRange(swingType))
end

return Wrappers
