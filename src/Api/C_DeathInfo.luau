--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCorpseMapPosition(uiMapID: number): Maybe<Vector2DMixin>
	return Maybe.of(C_DeathInfo.GetCorpseMapPosition(uiMapID))
end

function Wrappers.GetCorpseMapPositionInto(reuse: Maybe<Vector2DMixin>, uiMapID: number): Maybe<Vector2DMixin>
	return Reuse.maybe(reuse, C_DeathInfo.GetCorpseMapPosition(uiMapID))
end

function Wrappers.GetDeathReleasePosition(uiMapID: number): Maybe<Vector2DMixin>
	return Maybe.of(C_DeathInfo.GetDeathReleasePosition(uiMapID))
end

function Wrappers.GetDeathReleasePositionInto(reuse: Maybe<Vector2DMixin>, uiMapID: number): Maybe<Vector2DMixin>
	return Reuse.maybe(reuse, C_DeathInfo.GetDeathReleasePosition(uiMapID))
end

function Wrappers.GetSelfResurrectOptions(): Maybe<{ SelfResurrectOption }>
	return Maybe.of(C_DeathInfo.GetSelfResurrectOptions())
end

function Wrappers.GetSelfResurrectOptionsInto(reuse: Maybe<{ SelfResurrectOption }>): Maybe<{ SelfResurrectOption }>
	return Reuse.maybe(reuse, C_DeathInfo.GetSelfResurrectOptions())
end

return Wrappers
