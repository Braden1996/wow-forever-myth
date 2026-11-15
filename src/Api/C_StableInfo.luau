--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetStablePetInfo(index: number): Maybe<PetInfo>
	return Maybe.of(C_StableInfo.GetStablePetInfo(index))
end

function Wrappers.GetStablePetInfoInto(reuse: Maybe<PetInfo>, index: number): Maybe<PetInfo>
	return Reuse.maybe(reuse, C_StableInfo.GetStablePetInfo(index))
end

return Wrappers
