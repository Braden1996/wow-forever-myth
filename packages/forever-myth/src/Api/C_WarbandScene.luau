--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetWarbandSceneEntry(warbandSceneID: number): Maybe<WarbandSceneEntry>
	return Maybe.of(C_WarbandScene.GetWarbandSceneEntry(warbandSceneID))
end

function Wrappers.GetWarbandSceneEntryInto(
	reuse: Maybe<WarbandSceneEntry>,
	warbandSceneID: number
): Maybe<WarbandSceneEntry>
	return Reuse.maybe(reuse, C_WarbandScene.GetWarbandSceneEntry(warbandSceneID))
end

return Wrappers
