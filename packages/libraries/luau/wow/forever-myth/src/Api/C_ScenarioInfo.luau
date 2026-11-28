--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetUnitCriteriaProgressValuesResults = {
	read actualValue: number,
	read percentValue: number,
	read percentValueString: string,
}

local Wrappers = {}

function Wrappers.GetCriteriaInfo(criteriaIndex: number): Maybe<ScenarioCriteriaInfo>
	return Maybe.of(C_ScenarioInfo.GetCriteriaInfo(criteriaIndex))
end

function Wrappers.GetCriteriaInfoInto(
	reuse: Maybe<ScenarioCriteriaInfo>,
	criteriaIndex: number
): Maybe<ScenarioCriteriaInfo>
	return Reuse.maybe(reuse, C_ScenarioInfo.GetCriteriaInfo(criteriaIndex))
end

function Wrappers.GetCriteriaInfoByStep(stepID: number, criteriaIndex: number): Maybe<ScenarioCriteriaInfo>
	return Maybe.of(C_ScenarioInfo.GetCriteriaInfoByStep(stepID, criteriaIndex))
end

function Wrappers.GetCriteriaInfoByStepInto(
	reuse: Maybe<ScenarioCriteriaInfo>,
	stepID: number,
	criteriaIndex: number
): Maybe<ScenarioCriteriaInfo>
	return Reuse.maybe(reuse, C_ScenarioInfo.GetCriteriaInfoByStep(stepID, criteriaIndex))
end

function Wrappers.GetDisplayInfo(): Maybe<ScenarioDisplayInfo>
	return Maybe.of(C_ScenarioInfo.GetDisplayInfo())
end

function Wrappers.GetDisplayInfoInto(reuse: Maybe<ScenarioDisplayInfo>): Maybe<ScenarioDisplayInfo>
	return Reuse.maybe(reuse, C_ScenarioInfo.GetDisplayInfo())
end

function Wrappers.GetJailersTowerTypeString(runType: Enum_JailersTowerType): Maybe<string>
	return Maybe.of(C_ScenarioInfo.GetJailersTowerTypeString(runType))
end

function Wrappers.GetJailersTowerTypeStringInto(reuse: Maybe<string>, runType: Enum_JailersTowerType): Maybe<string>
	return Reuse.maybe(reuse, C_ScenarioInfo.GetJailersTowerTypeString(runType))
end

function Wrappers.GetScenarioIconInfo(uiMapID: number): Maybe<{ ScenarioIconInfo }>
	return Maybe.of(C_ScenarioInfo.GetScenarioIconInfo(uiMapID))
end

function Wrappers.GetScenarioIconInfoInto(
	reuse: Maybe<{ ScenarioIconInfo }>,
	uiMapID: number
): Maybe<{ ScenarioIconInfo }>
	return Reuse.maybe(reuse, C_ScenarioInfo.GetScenarioIconInfo(uiMapID))
end

function Wrappers.GetScenarioInfo(): Maybe<ScenarioInformation>
	return Maybe.of(C_ScenarioInfo.GetScenarioInfo())
end

function Wrappers.GetScenarioInfoInto(reuse: Maybe<ScenarioInformation>): Maybe<ScenarioInformation>
	return Reuse.maybe(reuse, C_ScenarioInfo.GetScenarioInfo())
end

function Wrappers.GetScenarioStepInfo(scenarioStepID: number?): Maybe<ScenarioStepInfo>
	return Maybe.of(C_ScenarioInfo.GetScenarioStepInfo(scenarioStepID))
end

function Wrappers.GetScenarioStepInfoInto(
	reuse: Maybe<ScenarioStepInfo>,
	scenarioStepID: number?
): Maybe<ScenarioStepInfo>
	return Reuse.maybe(reuse, C_ScenarioInfo.GetScenarioStepInfo(scenarioStepID))
end

function Wrappers.GetTieredEntranceActiveSpells(): Maybe<{ number }>
	return Maybe.of(C_ScenarioInfo.GetTieredEntranceActiveSpells())
end

function Wrappers.GetTieredEntranceActiveSpellsInto(reuse: Maybe<{ number }>): Maybe<{ number }>
	return Reuse.maybe(reuse, C_ScenarioInfo.GetTieredEntranceActiveSpells())
end

function Wrappers.GetUnitCriteriaProgressValues(unit: UnitToken): Maybe<GetUnitCriteriaProgressValuesResults>
	local r1, r2, r3 = C_ScenarioInfo.GetUnitCriteriaProgressValues(unit)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		actualValue = r1,
		percentValue = r2,
		percentValueString = r3,
	})
end

function Wrappers.GetUnitCriteriaProgressValuesInto(
	reuse: GetUnitCriteriaProgressValuesResults,
	unit: UnitToken
): Maybe<GetUnitCriteriaProgressValuesResults>
	local r1, r2, r3 = C_ScenarioInfo.GetUnitCriteriaProgressValues(unit)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.actualValue = r1
	fields.percentValue = r2
	fields.percentValueString = r3
	return Reuse.just(reuse)
end

return Wrappers
