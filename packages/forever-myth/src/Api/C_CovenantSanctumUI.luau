--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetAnimaInfoResults = {
	read currencyID: number,
	read maxDisplayableValue: number,
}

local Wrappers = {}

function Wrappers.GetAnimaInfo(): GetAnimaInfoResults
	local r1, r2 = C_CovenantSanctumUI.GetAnimaInfo()
	return {
		currencyID = r1,
		maxDisplayableValue = r2,
	}
end

function Wrappers.GetAnimaInfoInto(reuse: GetAnimaInfoResults): GetAnimaInfoResults
	local r1, r2 = C_CovenantSanctumUI.GetAnimaInfo()
	local fields = Reuse.fields(reuse)
	fields.currencyID = r1
	fields.maxDisplayableValue = r2
	return reuse
end

function Wrappers.GetCurrentTalentTreeID(): Maybe<number>
	return Maybe.of(C_CovenantSanctumUI.GetCurrentTalentTreeID())
end

function Wrappers.GetCurrentTalentTreeIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_CovenantSanctumUI.GetCurrentTalentTreeID())
end

function Wrappers.GetSanctumType(): Maybe<Enum_GarrTalentFeatureSubtype>
	return Maybe.of(C_CovenantSanctumUI.GetSanctumType())
end

function Wrappers.GetSanctumTypeInto(reuse: Maybe<Enum_GarrTalentFeatureSubtype>): Maybe<Enum_GarrTalentFeatureSubtype>
	return Reuse.maybe(reuse, C_CovenantSanctumUI.GetSanctumType())
end

return Wrappers
