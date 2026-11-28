--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetModifiedInstanceInfoFromMapID(mapID: number): Maybe<ModifiedInstanceInfo>
	return Maybe.of(C_ModifiedInstance.GetModifiedInstanceInfoFromMapID(mapID))
end

function Wrappers.GetModifiedInstanceInfoFromMapIDInto(
	reuse: Maybe<ModifiedInstanceInfo>,
	mapID: number
): Maybe<ModifiedInstanceInfo>
	return Reuse.maybe(reuse, C_ModifiedInstance.GetModifiedInstanceInfoFromMapID(mapID))
end

return Wrappers
