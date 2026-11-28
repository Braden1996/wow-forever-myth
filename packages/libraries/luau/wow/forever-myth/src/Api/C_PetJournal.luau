--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type FindPetIDByNameResults = {
	read speciesId: number,
	read petGUID: string,
}

export type GetNumCollectedInfoResults = {
	read numCollected: number,
	read limit: number,
}

export type GetNumPetsResults = {
	read numPets: number,
	read numOwned: number,
}

export type GetNumPetsInJournalResults = {
	read maxAllowed: number,
	read numPets: number,
}

export type GetPetAbilityInfoResults = {
	read name: string,
	read icon: fileID,
	read petType: number,
}

export type GetPetAbilityListResults = {
	read idTable: { number },
	read levelTable: { number },
}

export type GetPetCooldownByGUIDResults = {
	read start: number,
	read duration: number,
	read isEnabled: number,
}

export type GetPetInfoByIndexResults = {
	read petID: string,
	read speciesID: number,
	read owned: boolean,
	read customName: string,
	read level: number,
	read favorite: boolean,
	read isRevoked: boolean,
	read speciesName: string,
	read icon: fileID,
	read petType: number,
	read companionID: number,
	read tooltip: string,
	read description: string,
	read isWild: boolean,
	read canBattle: boolean,
	read isTradeable: boolean,
	read isUnique: boolean,
	read obtainable: boolean,
}

export type GetPetInfoByItemIDResults = {
	read name: string,
	read icon: fileID,
	read petType: number,
	read creatureID: number,
	read sourceText: string,
	read description: string,
	read isWild: boolean,
	read canBattle: boolean,
	read isTradeable: boolean,
	read isUnique: boolean,
	read obtainable: boolean,
	read displayID: number,
	read speciesID: number,
}

export type GetPetInfoByPetIDResults = {
	read speciesID: number,
	read customName: string,
	read level: number,
	read xp: number,
	read maxXp: number,
	read displayID: number,
	read favorite: boolean,
	read name: string,
	read icon: fileID,
	read petType: number,
	read creatureID: string,
	read sourceText: string,
	read description: string,
	read isWild: boolean,
	read canBattle: boolean,
	read isTradeable: boolean,
	read isUnique: boolean,
	read obtainable: boolean,
}

export type GetPetInfoBySpeciesIDResults = {
	read speciesName: string,
	read speciesIcon: fileID,
	read petType: number,
	read companionID: number,
	read tooltipSource: string,
	read tooltipDescription: string,
	read isWild: boolean,
	read canBattle: boolean,
	read isTradeable: boolean,
	read isUnique: boolean,
	read obtainable: boolean,
	read creatureDisplayID: number,
	read desiredScale: number,
}

export type GetPetLoadOutInfoResults = {
	read petID: Maybe<WOWGUID>,
	read ability1ID: number,
	read ability2ID: number,
	read ability3ID: number,
	read locked: boolean,
}

export type GetPetStatsResults = {
	read health: number,
	read maxHealth: number,
	read power: number,
	read speed: number,
	read rarity: number,
}

export type GetPetSummonInfoResults = {
	read isSummonable: boolean,
	read error: Enum_PetJournalError,
	read errorText: string,
}

local Wrappers = {}

function Wrappers.FindPetIDByName(petName: string): FindPetIDByNameResults
	local r1, r2 = C_PetJournal.FindPetIDByName(petName)
	return {
		speciesId = r1,
		petGUID = r2,
	}
end

function Wrappers.FindPetIDByNameInto(reuse: FindPetIDByNameResults, petName: string): FindPetIDByNameResults
	local r1, r2 = C_PetJournal.FindPetIDByName(petName)
	local fields = Reuse.fields(reuse)
	fields.speciesId = r1
	fields.petGUID = r2
	return reuse
end

function Wrappers.GetDisplayIDByIndex(speciesID: number, index: number): Maybe<number>
	return Maybe.of(C_PetJournal.GetDisplayIDByIndex(speciesID, index))
end

function Wrappers.GetDisplayIDByIndexInto(reuse: Maybe<number>, speciesID: number, index: number): Maybe<number>
	return Reuse.maybe(reuse, C_PetJournal.GetDisplayIDByIndex(speciesID, index))
end

function Wrappers.GetDisplayProbabilityByIndex(speciesID: number, index: number): Maybe<number>
	return Maybe.of(C_PetJournal.GetDisplayProbabilityByIndex(speciesID, index))
end

function Wrappers.GetDisplayProbabilityByIndexInto(
	reuse: Maybe<number>,
	speciesID: number,
	index: number
): Maybe<number>
	return Reuse.maybe(reuse, C_PetJournal.GetDisplayProbabilityByIndex(speciesID, index))
end

function Wrappers.GetNumCollectedInfo(speciesId: number): GetNumCollectedInfoResults
	local r1, r2 = C_PetJournal.GetNumCollectedInfo(speciesId)
	return {
		numCollected = r1,
		limit = r2,
	}
end

function Wrappers.GetNumCollectedInfoInto(
	reuse: GetNumCollectedInfoResults,
	speciesId: number
): GetNumCollectedInfoResults
	local r1, r2 = C_PetJournal.GetNumCollectedInfo(speciesId)
	local fields = Reuse.fields(reuse)
	fields.numCollected = r1
	fields.limit = r2
	return reuse
end

function Wrappers.GetNumDisplays(speciesID: number): Maybe<number>
	return Maybe.of(C_PetJournal.GetNumDisplays(speciesID))
end

function Wrappers.GetNumDisplaysInto(reuse: Maybe<number>, speciesID: number): Maybe<number>
	return Reuse.maybe(reuse, C_PetJournal.GetNumDisplays(speciesID))
end

function Wrappers.GetNumPets(): GetNumPetsResults
	local r1, r2 = C_PetJournal.GetNumPets()
	return {
		numPets = r1,
		numOwned = r2,
	}
end

function Wrappers.GetNumPetsInto(reuse: GetNumPetsResults): GetNumPetsResults
	local r1, r2 = C_PetJournal.GetNumPets()
	local fields = Reuse.fields(reuse)
	fields.numPets = r1
	fields.numOwned = r2
	return reuse
end

function Wrappers.GetNumPetsInJournal(creatureID: number): GetNumPetsInJournalResults
	local r1, r2 = C_PetJournal.GetNumPetsInJournal(creatureID)
	return {
		maxAllowed = r1,
		numPets = r2,
	}
end

function Wrappers.GetNumPetsInJournalInto(
	reuse: GetNumPetsInJournalResults,
	creatureID: number
): GetNumPetsInJournalResults
	local r1, r2 = C_PetJournal.GetNumPetsInJournal(creatureID)
	local fields = Reuse.fields(reuse)
	fields.maxAllowed = r1
	fields.numPets = r2
	return reuse
end

function Wrappers.GetPetAbilityInfo(abilityID: number): Maybe<GetPetAbilityInfoResults>
	local r1, r2, r3 = C_PetJournal.GetPetAbilityInfo(abilityID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		icon = r2,
		petType = r3,
	})
end

function Wrappers.GetPetAbilityInfoInto(
	reuse: GetPetAbilityInfoResults,
	abilityID: number
): Maybe<GetPetAbilityInfoResults>
	local r1, r2, r3 = C_PetJournal.GetPetAbilityInfo(abilityID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.petType = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPetAbilityList(
	speciesID: number,
	idTable: { [any]: any }?,
	levelTable: { [any]: any }?
): GetPetAbilityListResults
	local r1, r2 = C_PetJournal.GetPetAbilityList(speciesID, idTable, levelTable)
	return {
		idTable = r1,
		levelTable = r2,
	}
end

function Wrappers.GetPetAbilityListInto(
	reuse: GetPetAbilityListResults,
	speciesID: number,
	idTable: { [any]: any }?,
	levelTable: { [any]: any }?
): GetPetAbilityListResults
	local r1, r2 = C_PetJournal.GetPetAbilityList(speciesID, idTable, levelTable)
	local fields = Reuse.fields(reuse)
	fields.idTable = r1
	fields.levelTable = r2
	return reuse
end

function Wrappers.GetPetAbilityListTable(speciesID: number): Maybe<{ PetAbilityLevelInfo }>
	return Maybe.of(C_PetJournal.GetPetAbilityListTable(speciesID))
end

function Wrappers.GetPetAbilityListTableInto(
	reuse: Maybe<{ PetAbilityLevelInfo }>,
	speciesID: number
): Maybe<{ PetAbilityLevelInfo }>
	return Reuse.maybe(reuse, C_PetJournal.GetPetAbilityListTable(speciesID))
end

function Wrappers.GetPetCooldownByGUID(GUID: string): GetPetCooldownByGUIDResults
	local r1, r2, r3 = C_PetJournal.GetPetCooldownByGUID(GUID)
	return {
		start = r1,
		duration = r2,
		isEnabled = r3,
	}
end

function Wrappers.GetPetCooldownByGUIDInto(
	reuse: GetPetCooldownByGUIDResults,
	GUID: string
): GetPetCooldownByGUIDResults
	local r1, r2, r3 = C_PetJournal.GetPetCooldownByGUID(GUID)
	local fields = Reuse.fields(reuse)
	fields.start = r1
	fields.duration = r2
	fields.isEnabled = r3
	return reuse
end

function Wrappers.GetPetInfoByIndex(index: number): GetPetInfoByIndexResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 =
		C_PetJournal.GetPetInfoByIndex(index)
	return {
		petID = r1,
		speciesID = r2,
		owned = r3,
		customName = r4,
		level = r5,
		favorite = r6,
		isRevoked = r7,
		speciesName = r8,
		icon = r9,
		petType = r10,
		companionID = r11,
		tooltip = r12,
		description = r13,
		isWild = r14,
		canBattle = r15,
		isTradeable = r16,
		isUnique = r17,
		obtainable = r18,
	}
end

function Wrappers.GetPetInfoByIndexInto(reuse: GetPetInfoByIndexResults, index: number): GetPetInfoByIndexResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 =
		C_PetJournal.GetPetInfoByIndex(index)
	local fields = Reuse.fields(reuse)
	fields.petID = r1
	fields.speciesID = r2
	fields.owned = r3
	fields.customName = r4
	fields.level = r5
	fields.favorite = r6
	fields.isRevoked = r7
	fields.speciesName = r8
	fields.icon = r9
	fields.petType = r10
	fields.companionID = r11
	fields.tooltip = r12
	fields.description = r13
	fields.isWild = r14
	fields.canBattle = r15
	fields.isTradeable = r16
	fields.isUnique = r17
	fields.obtainable = r18
	return reuse
end

function Wrappers.GetPetInfoByItemID(itemID: number): GetPetInfoByItemIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_PetJournal.GetPetInfoByItemID(itemID)
	return {
		name = r1,
		icon = r2,
		petType = r3,
		creatureID = r4,
		sourceText = r5,
		description = r6,
		isWild = r7,
		canBattle = r8,
		isTradeable = r9,
		isUnique = r10,
		obtainable = r11,
		displayID = r12,
		speciesID = r13,
	}
end

function Wrappers.GetPetInfoByItemIDInto(reuse: GetPetInfoByItemIDResults, itemID: number): GetPetInfoByItemIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_PetJournal.GetPetInfoByItemID(itemID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.petType = r3
	fields.creatureID = r4
	fields.sourceText = r5
	fields.description = r6
	fields.isWild = r7
	fields.canBattle = r8
	fields.isTradeable = r9
	fields.isUnique = r10
	fields.obtainable = r11
	fields.displayID = r12
	fields.speciesID = r13
	return reuse
end

function Wrappers.GetPetInfoByPetID(petID: string): GetPetInfoByPetIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 =
		C_PetJournal.GetPetInfoByPetID(petID)
	return {
		speciesID = r1,
		customName = r2,
		level = r3,
		xp = r4,
		maxXp = r5,
		displayID = r6,
		favorite = r7,
		name = r8,
		icon = r9,
		petType = r10,
		creatureID = r11,
		sourceText = r12,
		description = r13,
		isWild = r14,
		canBattle = r15,
		isTradeable = r16,
		isUnique = r17,
		obtainable = r18,
	}
end

function Wrappers.GetPetInfoByPetIDInto(reuse: GetPetInfoByPetIDResults, petID: string): GetPetInfoByPetIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 =
		C_PetJournal.GetPetInfoByPetID(petID)
	local fields = Reuse.fields(reuse)
	fields.speciesID = r1
	fields.customName = r2
	fields.level = r3
	fields.xp = r4
	fields.maxXp = r5
	fields.displayID = r6
	fields.favorite = r7
	fields.name = r8
	fields.icon = r9
	fields.petType = r10
	fields.creatureID = r11
	fields.sourceText = r12
	fields.description = r13
	fields.isWild = r14
	fields.canBattle = r15
	fields.isTradeable = r16
	fields.isUnique = r17
	fields.obtainable = r18
	return reuse
end

function Wrappers.GetPetInfoBySpeciesID(speciesID: number): GetPetInfoBySpeciesIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
	return {
		speciesName = r1,
		speciesIcon = r2,
		petType = r3,
		companionID = r4,
		tooltipSource = r5,
		tooltipDescription = r6,
		isWild = r7,
		canBattle = r8,
		isTradeable = r9,
		isUnique = r10,
		obtainable = r11,
		creatureDisplayID = r12,
		desiredScale = r13,
	}
end

function Wrappers.GetPetInfoBySpeciesIDInto(
	reuse: GetPetInfoBySpeciesIDResults,
	speciesID: number
): GetPetInfoBySpeciesIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
	local fields = Reuse.fields(reuse)
	fields.speciesName = r1
	fields.speciesIcon = r2
	fields.petType = r3
	fields.companionID = r4
	fields.tooltipSource = r5
	fields.tooltipDescription = r6
	fields.isWild = r7
	fields.canBattle = r8
	fields.isTradeable = r9
	fields.isUnique = r10
	fields.obtainable = r11
	fields.creatureDisplayID = r12
	fields.desiredScale = r13
	return reuse
end

function Wrappers.GetPetInfoTableByPetID(petID: WOWGUID): Maybe<PetJournalPetInfo>
	return Maybe.of(C_PetJournal.GetPetInfoTableByPetID(petID))
end

function Wrappers.GetPetInfoTableByPetIDInto(reuse: Maybe<PetJournalPetInfo>, petID: WOWGUID): Maybe<PetJournalPetInfo>
	return Reuse.maybe(reuse, C_PetJournal.GetPetInfoTableByPetID(petID))
end

function Wrappers.GetPetInfoTableBySpeciesID(speciesID: number): Maybe<PetJournalPetInfo>
	return Maybe.of(C_PetJournal.GetPetInfoTableBySpeciesID(speciesID))
end

function Wrappers.GetPetInfoTableBySpeciesIDInto(
	reuse: Maybe<PetJournalPetInfo>,
	speciesID: number
): Maybe<PetJournalPetInfo>
	return Reuse.maybe(reuse, C_PetJournal.GetPetInfoTableBySpeciesID(speciesID))
end

function Wrappers.GetPetLoadOutInfo(slot: number): Maybe<GetPetLoadOutInfoResults>
	local r1, r2, r3, r4, r5 = C_PetJournal.GetPetLoadOutInfo(slot)
	if r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		petID = Maybe.of(r1),
		ability1ID = r2,
		ability2ID = r3,
		ability3ID = r4,
		locked = r5,
	})
end

function Wrappers.GetPetLoadOutInfoInto(reuse: GetPetLoadOutInfoResults, slot: number): Maybe<GetPetLoadOutInfoResults>
	local r1, r2, r3, r4, r5 = C_PetJournal.GetPetLoadOutInfo(slot)
	if r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.petID = Reuse.maybe(fields.petID, r1)
	fields.ability1ID = r2
	fields.ability2ID = r3
	fields.ability3ID = r4
	fields.locked = r5
	return Reuse.just(reuse)
end

function Wrappers.GetPetStats(petID: string): GetPetStatsResults
	local r1, r2, r3, r4, r5 = C_PetJournal.GetPetStats(petID)
	return {
		health = r1,
		maxHealth = r2,
		power = r3,
		speed = r4,
		rarity = r5,
	}
end

function Wrappers.GetPetStatsInto(reuse: GetPetStatsResults, petID: string): GetPetStatsResults
	local r1, r2, r3, r4, r5 = C_PetJournal.GetPetStats(petID)
	local fields = Reuse.fields(reuse)
	fields.health = r1
	fields.maxHealth = r2
	fields.power = r3
	fields.speed = r4
	fields.rarity = r5
	return reuse
end

function Wrappers.GetPetSummonInfo(battlePetGUID: WOWGUID): GetPetSummonInfoResults
	local r1, r2, r3 = C_PetJournal.GetPetSummonInfo(battlePetGUID)
	return {
		isSummonable = r1,
		error = r2,
		errorText = r3,
	}
end

function Wrappers.GetPetSummonInfoInto(reuse: GetPetSummonInfoResults, battlePetGUID: WOWGUID): GetPetSummonInfoResults
	local r1, r2, r3 = C_PetJournal.GetPetSummonInfo(battlePetGUID)
	local fields = Reuse.fields(reuse)
	fields.isSummonable = r1
	fields.error = r2
	fields.errorText = r3
	return reuse
end

function Wrappers.PetUsesRandomDisplay(speciesID: number): Maybe<boolean>
	return Maybe.of(C_PetJournal.PetUsesRandomDisplay(speciesID))
end

function Wrappers.PetUsesRandomDisplayInto(reuse: Maybe<boolean>, speciesID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_PetJournal.PetUsesRandomDisplay(speciesID))
end

return Wrappers
