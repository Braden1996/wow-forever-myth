--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetPowerInfo(powerID: number): Maybe<AzeriteEmpoweredItemPowerInfo>
	return Maybe.of(C_AzeriteEmpoweredItem.GetPowerInfo(powerID))
end

function Wrappers.GetPowerInfoInto(
	reuse: Maybe<AzeriteEmpoweredItemPowerInfo>,
	powerID: number
): Maybe<AzeriteEmpoweredItemPowerInfo>
	return Reuse.maybe(reuse, C_AzeriteEmpoweredItem.GetPowerInfo(powerID))
end

function Wrappers.GetPowerText(
	azeriteEmpoweredItemLocation: ItemLocationMixin,
	powerID: number,
	level: Enum_AzeritePowerLevel
): Maybe<AzeriteEmpoweredItemPowerText>
	return Maybe.of(C_AzeriteEmpoweredItem.GetPowerText(azeriteEmpoweredItemLocation, powerID, level))
end

function Wrappers.GetPowerTextInto(
	reuse: Maybe<AzeriteEmpoweredItemPowerText>,
	azeriteEmpoweredItemLocation: ItemLocationMixin,
	powerID: number,
	level: Enum_AzeritePowerLevel
): Maybe<AzeriteEmpoweredItemPowerText>
	return Reuse.maybe(reuse, C_AzeriteEmpoweredItem.GetPowerText(azeriteEmpoweredItemLocation, powerID, level))
end

function Wrappers.GetSpecsForPower(powerID: number): Maybe<{ AzeriteSpecInfo }>
	return Maybe.of(C_AzeriteEmpoweredItem.GetSpecsForPower(powerID))
end

function Wrappers.GetSpecsForPowerInto(reuse: Maybe<{ AzeriteSpecInfo }>, powerID: number): Maybe<{ AzeriteSpecInfo }>
	return Reuse.maybe(reuse, C_AzeriteEmpoweredItem.GetSpecsForPower(powerID))
end

return Wrappers
