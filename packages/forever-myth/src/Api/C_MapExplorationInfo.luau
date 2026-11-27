--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetExploredAreaIDsAtPosition(uiMapID: number, normalizedPosition: Vector2DMixin): Maybe<{ number }>
	return Maybe.of(C_MapExplorationInfo.GetExploredAreaIDsAtPosition(uiMapID, normalizedPosition))
end

function Wrappers.GetExploredAreaIDsAtPositionInto(
	reuse: Maybe<{ number }>,
	uiMapID: number,
	normalizedPosition: Vector2DMixin
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_MapExplorationInfo.GetExploredAreaIDsAtPosition(uiMapID, normalizedPosition))
end

function Wrappers.GetExploredMapTextures(uiMapID: number): Maybe<{ UiMapExplorationInfo }>
	return Maybe.of(C_MapExplorationInfo.GetExploredMapTextures(uiMapID))
end

function Wrappers.GetExploredMapTexturesInto(
	reuse: Maybe<{ UiMapExplorationInfo }>,
	uiMapID: number
): Maybe<{ UiMapExplorationInfo }>
	return Reuse.maybe(reuse, C_MapExplorationInfo.GetExploredMapTextures(uiMapID))
end

return Wrappers
