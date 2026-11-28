--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetAllMaxPlacementBudgetsResults = {
	read interiorMaxBudgets: Maybe<{ [Enum_HousingBudgetType]: number }>,
	read exteriorMaxBudgets: Maybe<{ [Enum_HousingBudgetType]: number }>,
}

export type GetAllSpentPlacementBudgetsResults = {
	read interiorSpentBudgets: Maybe<{ [Enum_HousingBudgetType]: number }>,
	read exteriorSpentBudgets: Maybe<{ [Enum_HousingBudgetType]: number }>,
}

local Wrappers = {}

function Wrappers.GetAllMaxPlacementBudgets(): GetAllMaxPlacementBudgetsResults
	local r1, r2 = C_HousingDecor.GetAllMaxPlacementBudgets()
	return {
		interiorMaxBudgets = Maybe.of(r1),
		exteriorMaxBudgets = Maybe.of(r2),
	}
end

function Wrappers.GetAllMaxPlacementBudgetsInto(
	reuse: GetAllMaxPlacementBudgetsResults
): GetAllMaxPlacementBudgetsResults
	local r1, r2 = C_HousingDecor.GetAllMaxPlacementBudgets()
	local fields = Reuse.fields(reuse)
	fields.interiorMaxBudgets = Reuse.maybe(fields.interiorMaxBudgets, r1)
	fields.exteriorMaxBudgets = Reuse.maybe(fields.exteriorMaxBudgets, r2)
	return reuse
end

function Wrappers.GetAllPlacedDecor(): Maybe<{ HousingDecorInstanceListEntry }>
	return Maybe.of(C_HousingDecor.GetAllPlacedDecor())
end

function Wrappers.GetAllPlacedDecorInto(
	reuse: Maybe<{ HousingDecorInstanceListEntry }>
): Maybe<{ HousingDecorInstanceListEntry }>
	return Reuse.maybe(reuse, C_HousingDecor.GetAllPlacedDecor())
end

function Wrappers.GetAllSpentPlacementBudgets(): GetAllSpentPlacementBudgetsResults
	local r1, r2 = C_HousingDecor.GetAllSpentPlacementBudgets()
	return {
		interiorSpentBudgets = Maybe.of(r1),
		exteriorSpentBudgets = Maybe.of(r2),
	}
end

function Wrappers.GetAllSpentPlacementBudgetsInto(
	reuse: GetAllSpentPlacementBudgetsResults
): GetAllSpentPlacementBudgetsResults
	local r1, r2 = C_HousingDecor.GetAllSpentPlacementBudgets()
	local fields = Reuse.fields(reuse)
	fields.interiorSpentBudgets = Reuse.maybe(fields.interiorSpentBudgets, r1)
	fields.exteriorSpentBudgets = Reuse.maybe(fields.exteriorSpentBudgets, r2)
	return reuse
end

function Wrappers.GetDecorAssignedPetName(decorGUID: WOWGUID): Maybe<string>
	return Maybe.of(C_HousingDecor.GetDecorAssignedPetName(decorGUID))
end

function Wrappers.GetDecorAssignedPetNameInto(reuse: Maybe<string>, decorGUID: WOWGUID): Maybe<string>
	return Reuse.maybe(reuse, C_HousingDecor.GetDecorAssignedPetName(decorGUID))
end

function Wrappers.GetDecorHyperlink(decorID: number): Maybe<string>
	return Maybe.of(C_HousingDecor.GetDecorHyperlink(decorID))
end

function Wrappers.GetDecorHyperlinkInto(reuse: Maybe<string>, decorID: number): Maybe<string>
	return Reuse.maybe(reuse, C_HousingDecor.GetDecorHyperlink(decorID))
end

function Wrappers.GetDecorIcon(decorID: number): Maybe<fileID>
	return Maybe.of(C_HousingDecor.GetDecorIcon(decorID))
end

function Wrappers.GetDecorIconInto(reuse: Maybe<fileID>, decorID: number): Maybe<fileID>
	return Reuse.maybe(reuse, C_HousingDecor.GetDecorIcon(decorID))
end

function Wrappers.GetDecorInstanceInfoForGUID(decorGUID: WOWGUID): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingDecor.GetDecorInstanceInfoForGUID(decorGUID))
end

function Wrappers.GetDecorInstanceInfoForGUIDInto(
	reuse: Maybe<HousingDecorInstanceInfo>,
	decorGUID: WOWGUID
): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingDecor.GetDecorInstanceInfoForGUID(decorGUID))
end

function Wrappers.GetDecorName(decorID: number): Maybe<string>
	return Maybe.of(C_HousingDecor.GetDecorName(decorID))
end

function Wrappers.GetDecorNameInto(reuse: Maybe<string>, decorID: number): Maybe<string>
	return Reuse.maybe(reuse, C_HousingDecor.GetDecorName(decorID))
end

function Wrappers.GetHoveredDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingDecor.GetHoveredDecorInfo())
end

function Wrappers.GetHoveredDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingDecor.GetHoveredDecorInfo())
end

function Wrappers.GetMaxPetPlacementBudget(): Maybe<number>
	return Maybe.of(C_HousingDecor.GetMaxPetPlacementBudget())
end

function Wrappers.GetMaxPetPlacementBudgetInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_HousingDecor.GetMaxPetPlacementBudget())
end

function Wrappers.GetMaxPlacementBudget(): Maybe<number>
	return Maybe.of(C_HousingDecor.GetMaxPlacementBudget())
end

function Wrappers.GetMaxPlacementBudgetInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_HousingDecor.GetMaxPlacementBudget())
end

function Wrappers.GetSelectedDecorInfo(): Maybe<HousingDecorInstanceInfo>
	return Maybe.of(C_HousingDecor.GetSelectedDecorInfo())
end

function Wrappers.GetSelectedDecorInfoInto(reuse: Maybe<HousingDecorInstanceInfo>): Maybe<HousingDecorInstanceInfo>
	return Reuse.maybe(reuse, C_HousingDecor.GetSelectedDecorInfo())
end

function Wrappers.GetSpentPetPlacementBudget(): Maybe<number>
	return Maybe.of(C_HousingDecor.GetSpentPetPlacementBudget())
end

function Wrappers.GetSpentPetPlacementBudgetInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_HousingDecor.GetSpentPetPlacementBudget())
end

function Wrappers.GetSpentPlacementBudget(): Maybe<number>
	return Maybe.of(C_HousingDecor.GetSpentPlacementBudget())
end

function Wrappers.GetSpentPlacementBudgetInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_HousingDecor.GetSpentPlacementBudget())
end

return Wrappers
