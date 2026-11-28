--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCurrentDisplaySeasonExpansion(): Maybe<number>
	return Maybe.of(C_SeasonInfo.GetCurrentDisplaySeasonExpansion())
end

function Wrappers.GetCurrentDisplaySeasonExpansionInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_SeasonInfo.GetCurrentDisplaySeasonExpansion())
end

return Wrappers
