--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetHoveredDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingBasicMode.GetHoveredDecorInfo())
end

function Wrappers.GetHoveredDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingBasicMode.GetHoveredDecorInfo())
end

function Wrappers.GetSelectedDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingBasicMode.GetSelectedDecorInfo())
end

function Wrappers.GetSelectedDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingBasicMode.GetSelectedDecorInfo())
end

return Wrappers
