--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Result<T, E> = Result.Result<T, E>

export type GetPvpTalentAlertStatusResults = {
	read hasUnspentSlot: boolean,
	read hasNewTalent: boolean,
}

export type GetSpecializationInfoResults = {
	read specId: number,
	read name: Maybe<string>,
	read description: Maybe<string>,
	read icon: Maybe<fileID>,
	read role: Maybe<string>,
	read primaryStat: Maybe<number>,
	read pointsSpent: number,
	read background: Maybe<string>,
	read previewPointsSpent: number,
	read isUnlocked: boolean,
}

local Wrappers = {}

function Wrappers.CanPlayerUsePVPTalentUI(): Result<true, string>
	local r1, r2 = C_SpecializationInfo.CanPlayerUsePVPTalentUI()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.CanPlayerUseTalentSpecUI(): Result<true, string>
	local r1, r2 = C_SpecializationInfo.CanPlayerUseTalentSpecUI()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.CanPlayerUseTalentUI(): Result<true, string>
	local r1, r2 = C_SpecializationInfo.CanPlayerUseTalentUI()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.GetClassIDFromSpecID(specID: number): Maybe<number>
	return Maybe.of(C_SpecializationInfo.GetClassIDFromSpecID(specID))
end

function Wrappers.GetClassIDFromSpecIDInto(reuse: Maybe<number>, specID: number): Maybe<number>
	return Reuse.maybe(reuse, C_SpecializationInfo.GetClassIDFromSpecID(specID))
end

function Wrappers.GetCombatConfigIDForSpecGroup(groupIndex: number): Maybe<number>
	return Maybe.of(C_SpecializationInfo.GetCombatConfigIDForSpecGroup(groupIndex))
end

function Wrappers.GetCombatConfigIDForSpecGroupInto(reuse: Maybe<number>, groupIndex: number): Maybe<number>
	return Reuse.maybe(reuse, C_SpecializationInfo.GetCombatConfigIDForSpecGroup(groupIndex))
end

function Wrappers.GetInspectSelectedPvpTalent(inspectedUnit: UnitToken, talentIndex: number): Maybe<number>
	return Maybe.of(C_SpecializationInfo.GetInspectSelectedPvpTalent(inspectedUnit, talentIndex))
end

function Wrappers.GetInspectSelectedPvpTalentInto(
	reuse: Maybe<number>,
	inspectedUnit: UnitToken,
	talentIndex: number
): Maybe<number>
	return Reuse.maybe(reuse, C_SpecializationInfo.GetInspectSelectedPvpTalent(inspectedUnit, talentIndex))
end

function Wrappers.GetPvpTalentAlertStatus(): GetPvpTalentAlertStatusResults
	local r1, r2 = C_SpecializationInfo.GetPvpTalentAlertStatus()
	return {
		hasUnspentSlot = r1,
		hasNewTalent = r2,
	}
end

function Wrappers.GetPvpTalentAlertStatusInto(reuse: GetPvpTalentAlertStatusResults): GetPvpTalentAlertStatusResults
	local r1, r2 = C_SpecializationInfo.GetPvpTalentAlertStatus()
	local fields = Reuse.fields(reuse)
	fields.hasUnspentSlot = r1
	fields.hasNewTalent = r2
	return reuse
end

function Wrappers.GetPvpTalentInfo(talentID: number): Maybe<PvpTalentInfo>
	return Maybe.of(C_SpecializationInfo.GetPvpTalentInfo(talentID))
end

function Wrappers.GetPvpTalentInfoInto(reuse: Maybe<PvpTalentInfo>, talentID: number): Maybe<PvpTalentInfo>
	return Reuse.maybe(reuse, C_SpecializationInfo.GetPvpTalentInfo(talentID))
end

function Wrappers.GetPvpTalentSlotInfo(talentIndex: number): Maybe<PvpTalentSlotInfo>
	return Maybe.of(C_SpecializationInfo.GetPvpTalentSlotInfo(talentIndex))
end

function Wrappers.GetPvpTalentSlotInfoInto(
	reuse: Maybe<PvpTalentSlotInfo>,
	talentIndex: number
): Maybe<PvpTalentSlotInfo>
	return Reuse.maybe(reuse, C_SpecializationInfo.GetPvpTalentSlotInfo(talentIndex))
end

function Wrappers.GetPvpTalentSlotUnlockLevel(talentIndex: number): Maybe<number>
	return Maybe.of(C_SpecializationInfo.GetPvpTalentSlotUnlockLevel(talentIndex))
end

function Wrappers.GetPvpTalentSlotUnlockLevelInto(reuse: Maybe<number>, talentIndex: number): Maybe<number>
	return Reuse.maybe(reuse, C_SpecializationInfo.GetPvpTalentSlotUnlockLevel(talentIndex))
end

function Wrappers.GetPvpTalentUnlockLevel(talentID: number): Maybe<number>
	return Maybe.of(C_SpecializationInfo.GetPvpTalentUnlockLevel(talentID))
end

function Wrappers.GetPvpTalentUnlockLevelInto(reuse: Maybe<number>, talentID: number): Maybe<number>
	return Reuse.maybe(reuse, C_SpecializationInfo.GetPvpTalentUnlockLevel(talentID))
end

function Wrappers.GetSpecializationInfo(
	specializationIndex: number,
	isInspect: boolean?,
	isPet: boolean?,
	inspectTarget: string?,
	sex: number?,
	groupIndex: number?,
	classID: number?
): GetSpecializationInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = C_SpecializationInfo.GetSpecializationInfo(
		specializationIndex,
		isInspect,
		isPet,
		inspectTarget,
		sex,
		groupIndex,
		classID
	)
	return {
		specId = r1,
		name = Maybe.of(r2),
		description = Maybe.of(r3),
		icon = Maybe.of(r4),
		role = Maybe.of(r5),
		primaryStat = Maybe.of(r6),
		pointsSpent = r7,
		background = Maybe.of(r8),
		previewPointsSpent = r9,
		isUnlocked = r10,
	}
end

function Wrappers.GetSpecializationInfoInto(
	reuse: GetSpecializationInfoResults,
	specializationIndex: number,
	isInspect: boolean?,
	isPet: boolean?,
	inspectTarget: string?,
	sex: number?,
	groupIndex: number?,
	classID: number?
): GetSpecializationInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = C_SpecializationInfo.GetSpecializationInfo(
		specializationIndex,
		isInspect,
		isPet,
		inspectTarget,
		sex,
		groupIndex,
		classID
	)
	local fields = Reuse.fields(reuse)
	fields.specId = r1
	fields.name = Reuse.maybe(fields.name, r2)
	fields.description = Reuse.maybe(fields.description, r3)
	fields.icon = Reuse.maybe(fields.icon, r4)
	fields.role = Reuse.maybe(fields.role, r5)
	fields.primaryStat = Reuse.maybe(fields.primaryStat, r6)
	fields.pointsSpent = r7
	fields.background = Reuse.maybe(fields.background, r8)
	fields.previewPointsSpent = r9
	fields.isUnlocked = r10
	return reuse
end

function Wrappers.GetTalentInfo(query: TalentInfoQuery): Maybe<TalentInfoResult>
	return Maybe.of(C_SpecializationInfo.GetTalentInfo(query))
end

function Wrappers.GetTalentInfoInto(reuse: Maybe<TalentInfoResult>, query: TalentInfoQuery): Maybe<TalentInfoResult>
	return Reuse.maybe(reuse, C_SpecializationInfo.GetTalentInfo(query))
end

return Wrappers
