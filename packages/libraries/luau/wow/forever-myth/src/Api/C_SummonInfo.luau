--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetSummonConfirmSummoner(): Maybe<string>
	return Maybe.of(C_SummonInfo.GetSummonConfirmSummoner())
end

function Wrappers.GetSummonConfirmSummonerInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_SummonInfo.GetSummonConfirmSummoner())
end

return Wrappers
