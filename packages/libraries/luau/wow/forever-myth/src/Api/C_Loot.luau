--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetLootRollDuration(rollID: number): Maybe<number>
	return Maybe.of(C_Loot.GetLootRollDuration(rollID))
end

function Wrappers.GetLootRollDurationInto(reuse: Maybe<number>, rollID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Loot.GetLootRollDuration(rollID))
end

return Wrappers
