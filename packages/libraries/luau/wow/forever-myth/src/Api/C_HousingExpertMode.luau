--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetHoveredDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingExpertMode.GetHoveredDecorInfo())
end

function Wrappers.GetHoveredDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingExpertMode.GetHoveredDecorInfo())
end

function Wrappers.GetPrecisionSubmode(): Maybe<Enum_HousingPrecisionSubmode>
	return Maybe.of(C_HousingExpertMode.GetPrecisionSubmode())
end

function Wrappers.GetPrecisionSubmodeInto(
	reuse: Maybe<Enum_HousingPrecisionSubmode>
): Maybe<Enum_HousingPrecisionSubmode>
	return Reuse.maybe(reuse, C_HousingExpertMode.GetPrecisionSubmode())
end

function Wrappers.GetSelectedDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingExpertMode.GetSelectedDecorInfo())
end

function Wrappers.GetSelectedDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingExpertMode.GetSelectedDecorInfo())
end

return Wrappers
