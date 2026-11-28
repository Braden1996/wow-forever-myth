--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCurrentPlayerChoiceInfo(): Maybe<PlayerChoiceInfo>
	return Maybe.of(C_PlayerChoice.GetCurrentPlayerChoiceInfo())
end

function Wrappers.GetCurrentPlayerChoiceInfoInto(reuse: Maybe<PlayerChoiceInfo>): Maybe<PlayerChoiceInfo>
	return Reuse.maybe(reuse, C_PlayerChoice.GetCurrentPlayerChoiceInfo())
end

function Wrappers.GetRemainingTime(): Maybe<number>
	return Maybe.of(C_PlayerChoice.GetRemainingTime())
end

function Wrappers.GetRemainingTimeInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_PlayerChoice.GetRemainingTime())
end

return Wrappers
