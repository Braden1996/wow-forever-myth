--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.InteractUnit(unit: string, exactMatch: boolean?, looseTargeting: boolean?): Maybe<boolean>
	return Maybe.of(C_PlayerInteractionManager.InteractUnit(unit, exactMatch, looseTargeting))
end

function Wrappers.InteractUnitInto(
	reuse: Maybe<boolean>,
	unit: string,
	exactMatch: boolean?,
	looseTargeting: boolean?
): Maybe<boolean>
	return Reuse.maybe(reuse, C_PlayerInteractionManager.InteractUnit(unit, exactMatch, looseTargeting))
end

return Wrappers
