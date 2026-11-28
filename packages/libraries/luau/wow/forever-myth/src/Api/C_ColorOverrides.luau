--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetColorOverrideInfo(overrideType: Enum_ColorOverride): Maybe<ColorOverrideInfo>
	return Maybe.of(C_ColorOverrides.GetColorOverrideInfo(overrideType))
end

function Wrappers.GetColorOverrideInfoInto(
	reuse: Maybe<ColorOverrideInfo>,
	overrideType: Enum_ColorOverride
): Maybe<ColorOverrideInfo>
	return Reuse.maybe(reuse, C_ColorOverrides.GetColorOverrideInfo(overrideType))
end

return Wrappers
