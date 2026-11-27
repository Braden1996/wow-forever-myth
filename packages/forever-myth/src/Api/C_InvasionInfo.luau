--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetInvasionForUiMapID(uiMapID: number): Maybe<number>
	return Maybe.of(C_InvasionInfo.GetInvasionForUiMapID(uiMapID))
end

function Wrappers.GetInvasionForUiMapIDInto(reuse: Maybe<number>, uiMapID: number): Maybe<number>
	return Reuse.maybe(reuse, C_InvasionInfo.GetInvasionForUiMapID(uiMapID))
end

function Wrappers.GetInvasionInfo(invasionID: number): Maybe<InvasionMapInfo>
	return Maybe.of(C_InvasionInfo.GetInvasionInfo(invasionID))
end

function Wrappers.GetInvasionInfoInto(reuse: Maybe<InvasionMapInfo>, invasionID: number): Maybe<InvasionMapInfo>
	return Reuse.maybe(reuse, C_InvasionInfo.GetInvasionInfo(invasionID))
end

function Wrappers.GetInvasionTimeLeft(invasionID: number): Maybe<number>
	return Maybe.of(C_InvasionInfo.GetInvasionTimeLeft(invasionID))
end

function Wrappers.GetInvasionTimeLeftInto(reuse: Maybe<number>, invasionID: number): Maybe<number>
	return Reuse.maybe(reuse, C_InvasionInfo.GetInvasionTimeLeft(invasionID))
end

return Wrappers
