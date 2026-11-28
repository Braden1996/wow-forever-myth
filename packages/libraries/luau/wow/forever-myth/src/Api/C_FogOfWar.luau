--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetFogOfWarForMap(uiMapID: number): Maybe<number>
	return Maybe.of(C_FogOfWar.GetFogOfWarForMap(uiMapID))
end

function Wrappers.GetFogOfWarForMapInto(reuse: Maybe<number>, uiMapID: number): Maybe<number>
	return Reuse.maybe(reuse, C_FogOfWar.GetFogOfWarForMap(uiMapID))
end

function Wrappers.GetFogOfWarInfo(fogOfWarID: number): Maybe<FogOfWarInfo>
	return Maybe.of(C_FogOfWar.GetFogOfWarInfo(fogOfWarID))
end

function Wrappers.GetFogOfWarInfoInto(reuse: Maybe<FogOfWarInfo>, fogOfWarID: number): Maybe<FogOfWarInfo>
	return Reuse.maybe(reuse, C_FogOfWar.GetFogOfWarInfo(fogOfWarID))
end

return Wrappers
