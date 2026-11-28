--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetDefaultAbbreviation(object: SecondsFormatter): Maybe<Enum_SecondsFormatterAbbreviation>
	return Maybe.of(object:GetDefaultAbbreviation())
end

function Wrappers.GetDefaultAbbreviationInto(
	reuse: Maybe<Enum_SecondsFormatterAbbreviation>,
	object: SecondsFormatter
): Maybe<Enum_SecondsFormatterAbbreviation>
	return Reuse.maybe(reuse, object:GetDefaultAbbreviation())
end

function Wrappers.GetDesiredUnitCount(object: SecondsFormatter): Maybe<number>
	return Maybe.of(object:GetDesiredUnitCount())
end

function Wrappers.GetDesiredUnitCountInto(reuse: Maybe<number>, object: SecondsFormatter): Maybe<number>
	return Reuse.maybe(reuse, object:GetDesiredUnitCount())
end

function Wrappers.GetDesiredUnitCountCurve(object: SecondsFormatter): Maybe<LuaCurveObject>
	return Maybe.of(object:GetDesiredUnitCountCurve())
end

function Wrappers.GetDesiredUnitCountCurveInto(
	reuse: Maybe<LuaCurveObject>,
	object: SecondsFormatter
): Maybe<LuaCurveObject>
	return Reuse.maybe(reuse, object:GetDesiredUnitCountCurve())
end

function Wrappers.GetMaxInterval(object: SecondsFormatter): Maybe<Enum_SecondsFormatterInterval>
	return Maybe.of(object:GetMaxInterval())
end

function Wrappers.GetMaxIntervalInto(
	reuse: Maybe<Enum_SecondsFormatterInterval>,
	object: SecondsFormatter
): Maybe<Enum_SecondsFormatterInterval>
	return Reuse.maybe(reuse, object:GetMaxInterval())
end

function Wrappers.GetMaxIntervalCurve(object: SecondsFormatter): Maybe<LuaCurveObject>
	return Maybe.of(object:GetMaxIntervalCurve())
end

function Wrappers.GetMaxIntervalCurveInto(reuse: Maybe<LuaCurveObject>, object: SecondsFormatter): Maybe<LuaCurveObject>
	return Reuse.maybe(reuse, object:GetMaxIntervalCurve())
end

function Wrappers.GetMinInterval(object: SecondsFormatter): Maybe<Enum_SecondsFormatterInterval>
	return Maybe.of(object:GetMinInterval())
end

function Wrappers.GetMinIntervalInto(
	reuse: Maybe<Enum_SecondsFormatterInterval>,
	object: SecondsFormatter
): Maybe<Enum_SecondsFormatterInterval>
	return Reuse.maybe(reuse, object:GetMinInterval())
end

function Wrappers.GetMinIntervalCurve(object: SecondsFormatter): Maybe<LuaCurveObject>
	return Maybe.of(object:GetMinIntervalCurve())
end

function Wrappers.GetMinIntervalCurveInto(reuse: Maybe<LuaCurveObject>, object: SecondsFormatter): Maybe<LuaCurveObject>
	return Reuse.maybe(reuse, object:GetMinIntervalCurve())
end

return Wrappers
