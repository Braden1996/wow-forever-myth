--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetActiveLossOfControlData(index: number): Maybe<LossOfControlData>
	return Maybe.of(C_LossOfControl.GetActiveLossOfControlData(index))
end

function Wrappers.GetActiveLossOfControlDataInto(
	reuse: Maybe<LossOfControlData>,
	index: number
): Maybe<LossOfControlData>
	return Reuse.maybe(reuse, C_LossOfControl.GetActiveLossOfControlData(index))
end

function Wrappers.GetActiveLossOfControlDataByUnit(unitToken: UnitToken, index: number): Maybe<LossOfControlData>
	return Maybe.of(C_LossOfControl.GetActiveLossOfControlDataByUnit(unitToken, index))
end

function Wrappers.GetActiveLossOfControlDataByUnitInto(
	reuse: Maybe<LossOfControlData>,
	unitToken: UnitToken,
	index: number
): Maybe<LossOfControlData>
	return Reuse.maybe(reuse, C_LossOfControl.GetActiveLossOfControlDataByUnit(unitToken, index))
end

function Wrappers.GetActiveLossOfControlDuration(unitToken: UnitToken, index: number): Maybe<LuaDurationObject>
	return Maybe.of(C_LossOfControl.GetActiveLossOfControlDuration(unitToken, index))
end

function Wrappers.GetActiveLossOfControlDurationInto(
	reuse: Maybe<LuaDurationObject>,
	unitToken: UnitToken,
	index: number
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_LossOfControl.GetActiveLossOfControlDuration(unitToken, index))
end

return Wrappers
