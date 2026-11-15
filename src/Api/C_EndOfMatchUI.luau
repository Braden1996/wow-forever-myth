--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetEndOfMatchDetails(): Maybe<MatchDetails>
	return Maybe.of(C_EndOfMatchUI.GetEndOfMatchDetails())
end

function Wrappers.GetEndOfMatchDetailsInto(reuse: Maybe<MatchDetails>): Maybe<MatchDetails>
	return Reuse.maybe(reuse, C_EndOfMatchUI.GetEndOfMatchDetails())
end

return Wrappers
