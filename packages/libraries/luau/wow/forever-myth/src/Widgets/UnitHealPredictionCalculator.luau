--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetDamageAbsorbsResults = {
	read amount: number,
	read clamped: boolean,
}

export type GetHealAbsorbsResults = {
	read amount: number,
	read clamped: boolean,
}

export type GetIncomingHealsResults = {
	read amount: number,
	read amountFromHealer: number,
	read amountFromOthers: number,
	read clamped: boolean,
}

local Wrappers = {}

function Wrappers.GetDamageAbsorbs(object: UnitHealPredictionCalculator): GetDamageAbsorbsResults
	local r1, r2 = object:GetDamageAbsorbs()
	return {
		amount = r1,
		clamped = r2,
	}
end

function Wrappers.GetDamageAbsorbsInto(
	reuse: GetDamageAbsorbsResults,
	object: UnitHealPredictionCalculator
): GetDamageAbsorbsResults
	local r1, r2 = object:GetDamageAbsorbs()
	local fields = Reuse.fields(reuse)
	fields.amount = r1
	fields.clamped = r2
	return reuse
end

function Wrappers.GetHealAbsorbs(object: UnitHealPredictionCalculator): GetHealAbsorbsResults
	local r1, r2 = object:GetHealAbsorbs()
	return {
		amount = r1,
		clamped = r2,
	}
end

function Wrappers.GetHealAbsorbsInto(
	reuse: GetHealAbsorbsResults,
	object: UnitHealPredictionCalculator
): GetHealAbsorbsResults
	local r1, r2 = object:GetHealAbsorbs()
	local fields = Reuse.fields(reuse)
	fields.amount = r1
	fields.clamped = r2
	return reuse
end

function Wrappers.GetIncomingHeals(object: UnitHealPredictionCalculator): GetIncomingHealsResults
	local r1, r2, r3, r4 = object:GetIncomingHeals()
	return {
		amount = r1,
		amountFromHealer = r2,
		amountFromOthers = r3,
		clamped = r4,
	}
end

function Wrappers.GetIncomingHealsInto(
	reuse: GetIncomingHealsResults,
	object: UnitHealPredictionCalculator
): GetIncomingHealsResults
	local r1, r2, r3, r4 = object:GetIncomingHeals()
	local fields = Reuse.fields(reuse)
	fields.amount = r1
	fields.amountFromHealer = r2
	fields.amountFromOthers = r3
	fields.clamped = r4
	return reuse
end

return Wrappers
