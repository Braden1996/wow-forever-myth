--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetLevelUpDisplayToastsFromLevel(level: number): Maybe<{ EventToastInfo }>
	return Maybe.of(C_EventToastManager.GetLevelUpDisplayToastsFromLevel(level))
end

function Wrappers.GetLevelUpDisplayToastsFromLevelInto(
	reuse: Maybe<{ EventToastInfo }>,
	level: number
): Maybe<{ EventToastInfo }>
	return Reuse.maybe(reuse, C_EventToastManager.GetLevelUpDisplayToastsFromLevel(level))
end

function Wrappers.GetNextToastToDisplay(): Maybe<EventToastInfo>
	return Maybe.of(C_EventToastManager.GetNextToastToDisplay())
end

function Wrappers.GetNextToastToDisplayInto(reuse: Maybe<EventToastInfo>): Maybe<EventToastInfo>
	return Reuse.maybe(reuse, C_EventToastManager.GetNextToastToDisplay())
end

return Wrappers
