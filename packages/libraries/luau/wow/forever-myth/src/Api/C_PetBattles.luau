--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetAbilityInfoResults = {
	read id: number,
	read name: string,
	read icon: string,
	read maxCooldown: number,
	read unparsedDescription: string,
	read numTurns: number,
	read petType: number,
	read noStrongWeakHints: boolean,
}

export type GetAbilityInfoByIDResults = {
	read id: number,
	read name: string,
	read icon: string,
	read maxCooldown: number,
	read unparsedDescription: string,
	read numTurns: number,
	read petType: number,
	read noStrongWeakHints: boolean,
}

export type GetAbilityStateResults = {
	read isUsable: boolean,
	read currentCooldown: number,
	read currentLockdown: number,
}

export type GetAuraInfoResults = {
	read auraID: number,
	read instanceID: number,
	read turnsRemaining: number,
	read isBuff: boolean,
}

export type GetNameResults = {
	read customName: string,
	read speciesName: string,
}

export type GetPVPMatchmakingInfoResults = {
	read queueState: string,
	read estimatedTime: number,
	read queuedTime: number,
}

export type GetSelectedActionResults = {
	read selectedActionType: number,
	read selectedActionIndex: number,
}

export type GetTurnTimeInfoResults = {
	read timeRemaining: number,
	read turnTime: number,
}

export type GetXPResults = {
	read xp: number,
	read maxXp: number,
}

local Wrappers = {}

function Wrappers.GetAbilityInfo(petOwner: number, petIndex: number, abilityIndex: number): GetAbilityInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_PetBattles.GetAbilityInfo(petOwner, petIndex, abilityIndex)
	return {
		id = r1,
		name = r2,
		icon = r3,
		maxCooldown = r4,
		unparsedDescription = r5,
		numTurns = r6,
		petType = r7,
		noStrongWeakHints = r8,
	}
end

function Wrappers.GetAbilityInfoInto(
	reuse: GetAbilityInfoResults,
	petOwner: number,
	petIndex: number,
	abilityIndex: number
): GetAbilityInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_PetBattles.GetAbilityInfo(petOwner, petIndex, abilityIndex)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.icon = r3
	fields.maxCooldown = r4
	fields.unparsedDescription = r5
	fields.numTurns = r6
	fields.petType = r7
	fields.noStrongWeakHints = r8
	return reuse
end

function Wrappers.GetAbilityInfoByID(id: number): GetAbilityInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_PetBattles.GetAbilityInfoByID(id)
	return {
		id = r1,
		name = r2,
		icon = r3,
		maxCooldown = r4,
		unparsedDescription = r5,
		numTurns = r6,
		petType = r7,
		noStrongWeakHints = r8,
	}
end

function Wrappers.GetAbilityInfoByIDInto(reuse: GetAbilityInfoByIDResults, id: number): GetAbilityInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_PetBattles.GetAbilityInfoByID(id)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.icon = r3
	fields.maxCooldown = r4
	fields.unparsedDescription = r5
	fields.numTurns = r6
	fields.petType = r7
	fields.noStrongWeakHints = r8
	return reuse
end

function Wrappers.GetAbilityState(petOwner: number, petIndex: number, actionIndex: number): GetAbilityStateResults
	local r1, r2, r3 = C_PetBattles.GetAbilityState(petOwner, petIndex, actionIndex)
	return {
		isUsable = r1,
		currentCooldown = r2,
		currentLockdown = r3,
	}
end

function Wrappers.GetAbilityStateInto(
	reuse: GetAbilityStateResults,
	petOwner: number,
	petIndex: number,
	actionIndex: number
): GetAbilityStateResults
	local r1, r2, r3 = C_PetBattles.GetAbilityState(petOwner, petIndex, actionIndex)
	local fields = Reuse.fields(reuse)
	fields.isUsable = r1
	fields.currentCooldown = r2
	fields.currentLockdown = r3
	return reuse
end

function Wrappers.GetAuraInfo(petOwner: number, petIndex: number, auraIndex: number): GetAuraInfoResults
	local r1, r2, r3, r4 = C_PetBattles.GetAuraInfo(petOwner, petIndex, auraIndex)
	return {
		auraID = r1,
		instanceID = r2,
		turnsRemaining = r3,
		isBuff = r4,
	}
end

function Wrappers.GetAuraInfoInto(
	reuse: GetAuraInfoResults,
	petOwner: number,
	petIndex: number,
	auraIndex: number
): GetAuraInfoResults
	local r1, r2, r3, r4 = C_PetBattles.GetAuraInfo(petOwner, petIndex, auraIndex)
	local fields = Reuse.fields(reuse)
	fields.auraID = r1
	fields.instanceID = r2
	fields.turnsRemaining = r3
	fields.isBuff = r4
	return reuse
end

function Wrappers.GetIcon(petOwner: Enum_BattlePetOwner, slot: number): Maybe<fileID>
	return Maybe.of(C_PetBattles.GetIcon(petOwner, slot))
end

function Wrappers.GetIconInto(reuse: Maybe<fileID>, petOwner: Enum_BattlePetOwner, slot: number): Maybe<fileID>
	return Reuse.maybe(reuse, C_PetBattles.GetIcon(petOwner, slot))
end

function Wrappers.GetName(petOwner: Enum_BattlePetOwner, slot: number): Maybe<GetNameResults>
	local r1, r2 = C_PetBattles.GetName(petOwner, slot)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		customName = r1,
		speciesName = r2,
	})
end

function Wrappers.GetNameInto(reuse: GetNameResults, petOwner: Enum_BattlePetOwner, slot: number): Maybe<GetNameResults>
	local r1, r2 = C_PetBattles.GetName(petOwner, slot)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.customName = r1
	fields.speciesName = r2
	return Reuse.just(reuse)
end

function Wrappers.GetPVPMatchmakingInfo(): GetPVPMatchmakingInfoResults
	local r1, r2, r3 = C_PetBattles.GetPVPMatchmakingInfo()
	return {
		queueState = r1,
		estimatedTime = r2,
		queuedTime = r3,
	}
end

function Wrappers.GetPVPMatchmakingInfoInto(reuse: GetPVPMatchmakingInfoResults): GetPVPMatchmakingInfoResults
	local r1, r2, r3 = C_PetBattles.GetPVPMatchmakingInfo()
	local fields = Reuse.fields(reuse)
	fields.queueState = r1
	fields.estimatedTime = r2
	fields.queuedTime = r3
	return reuse
end

function Wrappers.GetSelectedAction(): GetSelectedActionResults
	local r1, r2 = C_PetBattles.GetSelectedAction()
	return {
		selectedActionType = r1,
		selectedActionIndex = r2,
	}
end

function Wrappers.GetSelectedActionInto(reuse: GetSelectedActionResults): GetSelectedActionResults
	local r1, r2 = C_PetBattles.GetSelectedAction()
	local fields = Reuse.fields(reuse)
	fields.selectedActionType = r1
	fields.selectedActionIndex = r2
	return reuse
end

function Wrappers.GetTurnTimeInfo(): GetTurnTimeInfoResults
	local r1, r2 = C_PetBattles.GetTurnTimeInfo()
	return {
		timeRemaining = r1,
		turnTime = r2,
	}
end

function Wrappers.GetTurnTimeInfoInto(reuse: GetTurnTimeInfoResults): GetTurnTimeInfoResults
	local r1, r2 = C_PetBattles.GetTurnTimeInfo()
	local fields = Reuse.fields(reuse)
	fields.timeRemaining = r1
	fields.turnTime = r2
	return reuse
end

function Wrappers.GetXP(petOwner: number, petIndex: number): GetXPResults
	local r1, r2 = C_PetBattles.GetXP(petOwner, petIndex)
	return {
		xp = r1,
		maxXp = r2,
	}
end

function Wrappers.GetXPInto(reuse: GetXPResults, petOwner: number, petIndex: number): GetXPResults
	local r1, r2 = C_PetBattles.GetXP(petOwner, petIndex)
	local fields = Reuse.fields(reuse)
	fields.xp = r1
	fields.maxXp = r2
	return reuse
end

return Wrappers
