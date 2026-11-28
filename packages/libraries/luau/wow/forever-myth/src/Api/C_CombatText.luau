--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetActiveUnit(): Maybe<string>
	return Maybe.of(C_CombatText.GetActiveUnit())
end

function Wrappers.GetActiveUnitInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_CombatText.GetActiveUnit())
end

return Wrappers
