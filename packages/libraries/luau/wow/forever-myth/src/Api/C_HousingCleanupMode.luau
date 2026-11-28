--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetHoveredDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingCleanupMode.GetHoveredDecorInfo())
end

function Wrappers.GetHoveredDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingCleanupMode.GetHoveredDecorInfo())
end

return Wrappers
