--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetBuildingInfoResults = {
	read id: number,
	read name: string,
	read textureKit: string,
	read icon: fileID,
	read description: string,
	read rank: number,
	read currencyID: number,
	read currencyQty: number,
	read goldQty: number,
	read buildTime: string,
	read needsPlan: boolean,
	read isPrebuilt: boolean,
	read possSpecs: { [any]: any },
	read upgrades: { number },
	read canUpgrade: boolean,
	read isMaxLevel: boolean,
	read hasFollowerSlot: boolean,
}

export type GetFollowerAbilitiesResults = {
	read abilities: { AbilityInfo },
	read extraAbilities: Maybe<{ AbilityInfo }>,
}

export type GetFollowerAutoCombatSpellsResults = {
	read autoCombatSpells: { AutoCombatSpellInfo },
	read autoCombatAutoAttack: Maybe<AutoCombatSpellInfo>,
}

export type GetFollowerItemsResults = {
	read weaponItemID: number,
	read weaponItemLevel: number,
	read armorItemID: number,
	read armorItemLevel: number,
}

export type GetGarrisonInfoResults = {
	read garrisonLevel: Maybe<number>,
	read mapTexture: Maybe<string>,
	read townHallX: Maybe<number>,
	read townHallY: Maybe<number>,
}

export type GetLandingPageShipmentInfoResults = {
	read name: string,
	read texture: string,
	read shipmentCapacity: number,
	read shipmentsReady: number,
	read shipmentsTotal: number,
	read creationTime: number,
	read duration: number,
	read timeleftString: string,
	read itemName: string,
	read itemIcon: number,
	read itemQuality: Enum_ItemQuality,
	read itemID: number,
}

export type GetLandingPageShipmentInfoByContainerIDResults = {
	read name: string,
	read texture: number,
	read shipmentCapacity: number,
	read shipmentsReady: number,
	read shipmentsTotal: number,
	read creationTime: number,
	read duration: number,
	read timeleftString: string,
	read itemName: string,
	read itemTexture: number,
	read unk1: number,
	read itemID: number,
	read followerID: number,
}

export type GetOwnedBuildingInfoAbbrevResults = {
	read id: number,
	read name: string,
	read textureKit: string,
	read icon: number,
	read rank: number,
	read isBuilding: boolean,
	read timeStart: number,
	read buildTime: number,
	read canActivate: boolean,
	read canUpgrade: boolean,
	read isPrebuilt: boolean,
}

export type GetTalentTreeResetInfoResults = {
	read goldCost: number,
	read currencyCosts: { GarrisonTalentCurrencyCostInfo },
}

export type GetTalentTreeTalentPointResearchInfoResults = {
	read goldCost: number,
	read currencyCosts: { GarrisonTalentCurrencyCostInfo },
	read durationSecs: number,
}

export type IsTalentConditionMetResults = {
	read isMet: boolean,
	read failureString: Maybe<string>,
}

local Wrappers = {}

function Wrappers.GetAutoMissionEnvironmentEffect(missionID: number): Maybe<AutoMissionEnvironmentEffect>
	return Maybe.of(C_Garrison.GetAutoMissionEnvironmentEffect(missionID))
end

function Wrappers.GetAutoMissionEnvironmentEffectInto(
	reuse: Maybe<AutoMissionEnvironmentEffect>,
	missionID: number
): Maybe<AutoMissionEnvironmentEffect>
	return Reuse.maybe(reuse, C_Garrison.GetAutoMissionEnvironmentEffect(missionID))
end

function Wrappers.GetBuildingInfo(buildingID: number): GetBuildingInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 =
		C_Garrison.GetBuildingInfo(buildingID)
	return {
		id = r1,
		name = r2,
		textureKit = r3,
		icon = r4,
		description = r5,
		rank = r6,
		currencyID = r7,
		currencyQty = r8,
		goldQty = r9,
		buildTime = r10,
		needsPlan = r11,
		isPrebuilt = r12,
		possSpecs = r13,
		upgrades = r14,
		canUpgrade = r15,
		isMaxLevel = r16,
		hasFollowerSlot = r17,
	}
end

function Wrappers.GetBuildingInfoInto(reuse: GetBuildingInfoResults, buildingID: number): GetBuildingInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 =
		C_Garrison.GetBuildingInfo(buildingID)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.textureKit = r3
	fields.icon = r4
	fields.description = r5
	fields.rank = r6
	fields.currencyID = r7
	fields.currencyQty = r8
	fields.goldQty = r9
	fields.buildTime = r10
	fields.needsPlan = r11
	fields.isPrebuilt = r12
	fields.possSpecs = r13
	fields.upgrades = r14
	fields.canUpgrade = r15
	fields.isMaxLevel = r16
	fields.hasFollowerSlot = r17
	return reuse
end

function Wrappers.GetCombatLogSpellInfo(autoCombatSpellID: number): Maybe<AutoCombatSpellInfo>
	return Maybe.of(C_Garrison.GetCombatLogSpellInfo(autoCombatSpellID))
end

function Wrappers.GetCombatLogSpellInfoInto(
	reuse: Maybe<AutoCombatSpellInfo>,
	autoCombatSpellID: number
): Maybe<AutoCombatSpellInfo>
	return Reuse.maybe(reuse, C_Garrison.GetCombatLogSpellInfo(autoCombatSpellID))
end

function Wrappers.GetCurrentGarrTalentTreeFriendshipFactionID(): Maybe<number>
	return Maybe.of(C_Garrison.GetCurrentGarrTalentTreeFriendshipFactionID())
end

function Wrappers.GetCurrentGarrTalentTreeFriendshipFactionIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Garrison.GetCurrentGarrTalentTreeFriendshipFactionID())
end

function Wrappers.GetCurrentGarrTalentTreeID(): Maybe<number>
	return Maybe.of(C_Garrison.GetCurrentGarrTalentTreeID())
end

function Wrappers.GetCurrentGarrTalentTreeIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Garrison.GetCurrentGarrTalentTreeID())
end

function Wrappers.GetCyphersToNextEquipmentLevel(): Maybe<number>
	return Maybe.of(C_Garrison.GetCyphersToNextEquipmentLevel())
end

function Wrappers.GetCyphersToNextEquipmentLevelInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Garrison.GetCyphersToNextEquipmentLevel())
end

function Wrappers.GetFollowerAbilities(followerID: number | string): GetFollowerAbilitiesResults
	local r1, r2 = C_Garrison.GetFollowerAbilities(followerID)
	return {
		abilities = r1,
		extraAbilities = Maybe.of(r2),
	}
end

function Wrappers.GetFollowerAbilitiesInto(
	reuse: GetFollowerAbilitiesResults,
	followerID: number | string
): GetFollowerAbilitiesResults
	local r1, r2 = C_Garrison.GetFollowerAbilities(followerID)
	local fields = Reuse.fields(reuse)
	fields.abilities = r1
	fields.extraAbilities = Reuse.maybe(fields.extraAbilities, r2)
	return reuse
end

function Wrappers.GetFollowerAutoCombatSpells(
	garrFollowerID: GarrisonFollower,
	followerLevel: number
): Maybe<GetFollowerAutoCombatSpellsResults>
	local r1, r2 = C_Garrison.GetFollowerAutoCombatSpells(garrFollowerID, followerLevel)
	if r1 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		autoCombatSpells = r1,
		autoCombatAutoAttack = Maybe.of(r2),
	})
end

function Wrappers.GetFollowerAutoCombatSpellsInto(
	reuse: GetFollowerAutoCombatSpellsResults,
	garrFollowerID: GarrisonFollower,
	followerLevel: number
): Maybe<GetFollowerAutoCombatSpellsResults>
	local r1, r2 = C_Garrison.GetFollowerAutoCombatSpells(garrFollowerID, followerLevel)
	if r1 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.autoCombatSpells = r1
	fields.autoCombatAutoAttack = Reuse.maybe(fields.autoCombatAutoAttack, r2)
	return Reuse.just(reuse)
end

function Wrappers.GetFollowerAutoCombatStats(garrFollowerID: GarrisonFollower): Maybe<FollowerAutoCombatStatsInfo>
	return Maybe.of(C_Garrison.GetFollowerAutoCombatStats(garrFollowerID))
end

function Wrappers.GetFollowerAutoCombatStatsInto(
	reuse: Maybe<FollowerAutoCombatStatsInfo>,
	garrFollowerID: GarrisonFollower
): Maybe<FollowerAutoCombatStatsInfo>
	return Reuse.maybe(reuse, C_Garrison.GetFollowerAutoCombatStats(garrFollowerID))
end

function Wrappers.GetFollowerItems(followerID: string): GetFollowerItemsResults
	local r1, r2, r3, r4 = C_Garrison.GetFollowerItems(followerID)
	return {
		weaponItemID = r1,
		weaponItemLevel = r2,
		armorItemID = r3,
		armorItemLevel = r4,
	}
end

function Wrappers.GetFollowerItemsInto(reuse: GetFollowerItemsResults, followerID: string): GetFollowerItemsResults
	local r1, r2, r3, r4 = C_Garrison.GetFollowerItems(followerID)
	local fields = Reuse.fields(reuse)
	fields.weaponItemID = r1
	fields.weaponItemLevel = r2
	fields.armorItemID = r3
	fields.armorItemLevel = r4
	return reuse
end

function Wrappers.GetGarrisonInfo(garrisonType: Enum_GarrisonType): GetGarrisonInfoResults
	local r1, r2, r3, r4 = C_Garrison.GetGarrisonInfo(garrisonType)
	return {
		garrisonLevel = Maybe.of(r1),
		mapTexture = Maybe.of(r2),
		townHallX = Maybe.of(r3),
		townHallY = Maybe.of(r4),
	}
end

function Wrappers.GetGarrisonInfoInto(
	reuse: GetGarrisonInfoResults,
	garrisonType: Enum_GarrisonType
): GetGarrisonInfoResults
	local r1, r2, r3, r4 = C_Garrison.GetGarrisonInfo(garrisonType)
	local fields = Reuse.fields(reuse)
	fields.garrisonLevel = Reuse.maybe(fields.garrisonLevel, r1)
	fields.mapTexture = Reuse.maybe(fields.mapTexture, r2)
	fields.townHallX = Reuse.maybe(fields.townHallX, r3)
	fields.townHallY = Reuse.maybe(fields.townHallY, r4)
	return reuse
end

function Wrappers.GetGarrisonTalentTreeCurrencyTypes(garrTalentTreeID: number): Maybe<number>
	return Maybe.of(C_Garrison.GetGarrisonTalentTreeCurrencyTypes(garrTalentTreeID))
end

function Wrappers.GetGarrisonTalentTreeCurrencyTypesInto(reuse: Maybe<number>, garrTalentTreeID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Garrison.GetGarrisonTalentTreeCurrencyTypes(garrTalentTreeID))
end

function Wrappers.GetLandingPageShipmentInfo(buildingID: number): GetLandingPageShipmentInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = C_Garrison.GetLandingPageShipmentInfo(buildingID)
	return {
		name = r1,
		texture = r2,
		shipmentCapacity = r3,
		shipmentsReady = r4,
		shipmentsTotal = r5,
		creationTime = r6,
		duration = r7,
		timeleftString = r8,
		itemName = r9,
		itemIcon = r10,
		itemQuality = r11,
		itemID = r12,
	}
end

function Wrappers.GetLandingPageShipmentInfoInto(
	reuse: GetLandingPageShipmentInfoResults,
	buildingID: number
): GetLandingPageShipmentInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = C_Garrison.GetLandingPageShipmentInfo(buildingID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.shipmentCapacity = r3
	fields.shipmentsReady = r4
	fields.shipmentsTotal = r5
	fields.creationTime = r6
	fields.duration = r7
	fields.timeleftString = r8
	fields.itemName = r9
	fields.itemIcon = r10
	fields.itemQuality = r11
	fields.itemID = r12
	return reuse
end

function Wrappers.GetLandingPageShipmentInfoByContainerID(
	containerID: number
): GetLandingPageShipmentInfoByContainerIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 =
		C_Garrison.GetLandingPageShipmentInfoByContainerID(containerID)
	return {
		name = r1,
		texture = r2,
		shipmentCapacity = r3,
		shipmentsReady = r4,
		shipmentsTotal = r5,
		creationTime = r6,
		duration = r7,
		timeleftString = r8,
		itemName = r9,
		itemTexture = r10,
		unk1 = r11,
		itemID = r12,
		followerID = r13,
	}
end

function Wrappers.GetLandingPageShipmentInfoByContainerIDInto(
	reuse: GetLandingPageShipmentInfoByContainerIDResults,
	containerID: number
): GetLandingPageShipmentInfoByContainerIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 =
		C_Garrison.GetLandingPageShipmentInfoByContainerID(containerID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.shipmentCapacity = r3
	fields.shipmentsReady = r4
	fields.shipmentsTotal = r5
	fields.creationTime = r6
	fields.duration = r7
	fields.timeleftString = r8
	fields.itemName = r9
	fields.itemTexture = r10
	fields.unk1 = r11
	fields.itemID = r12
	fields.followerID = r13
	return reuse
end

function Wrappers.GetOwnedBuildingInfoAbbrev(plotID: number): GetOwnedBuildingInfoAbbrevResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = C_Garrison.GetOwnedBuildingInfoAbbrev(plotID)
	return {
		id = r1,
		name = r2,
		textureKit = r3,
		icon = r4,
		rank = r5,
		isBuilding = r6,
		timeStart = r7,
		buildTime = r8,
		canActivate = r9,
		canUpgrade = r10,
		isPrebuilt = r11,
	}
end

function Wrappers.GetOwnedBuildingInfoAbbrevInto(
	reuse: GetOwnedBuildingInfoAbbrevResults,
	plotID: number
): GetOwnedBuildingInfoAbbrevResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = C_Garrison.GetOwnedBuildingInfoAbbrev(plotID)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.textureKit = r3
	fields.icon = r4
	fields.rank = r5
	fields.isBuilding = r6
	fields.timeStart = r7
	fields.buildTime = r8
	fields.canActivate = r9
	fields.canUpgrade = r10
	fields.isPrebuilt = r11
	return reuse
end

function Wrappers.GetTalentTreeIDsByClassID(garrType: number, classID: number): Maybe<{ number }>
	return Maybe.of(C_Garrison.GetTalentTreeIDsByClassID(garrType, classID))
end

function Wrappers.GetTalentTreeIDsByClassIDInto(
	reuse: Maybe<{ number }>,
	garrType: number,
	classID: number
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Garrison.GetTalentTreeIDsByClassID(garrType, classID))
end

function Wrappers.GetTalentTreeResetInfo(garrTalentTreeID: number): GetTalentTreeResetInfoResults
	local r1, r2 = C_Garrison.GetTalentTreeResetInfo(garrTalentTreeID)
	return {
		goldCost = r1,
		currencyCosts = r2,
	}
end

function Wrappers.GetTalentTreeResetInfoInto(
	reuse: GetTalentTreeResetInfoResults,
	garrTalentTreeID: number
): GetTalentTreeResetInfoResults
	local r1, r2 = C_Garrison.GetTalentTreeResetInfo(garrTalentTreeID)
	local fields = Reuse.fields(reuse)
	fields.goldCost = r1
	fields.currencyCosts = r2
	return reuse
end

function Wrappers.GetTalentTreeTalentPointResearchInfo(
	garrTalentID: number,
	researchRank: number,
	garrTalentTreeID: number,
	talentPointIndex: number,
	isRespec: boolean
): GetTalentTreeTalentPointResearchInfoResults
	local r1, r2, r3 = C_Garrison.GetTalentTreeTalentPointResearchInfo(
		garrTalentID,
		researchRank,
		garrTalentTreeID,
		talentPointIndex,
		isRespec
	)
	return {
		goldCost = r1,
		currencyCosts = r2,
		durationSecs = r3,
	}
end

function Wrappers.GetTalentTreeTalentPointResearchInfoInto(
	reuse: GetTalentTreeTalentPointResearchInfoResults,
	garrTalentID: number,
	researchRank: number,
	garrTalentTreeID: number,
	talentPointIndex: number,
	isRespec: boolean
): GetTalentTreeTalentPointResearchInfoResults
	local r1, r2, r3 = C_Garrison.GetTalentTreeTalentPointResearchInfo(
		garrTalentID,
		researchRank,
		garrTalentTreeID,
		talentPointIndex,
		isRespec
	)
	local fields = Reuse.fields(reuse)
	fields.goldCost = r1
	fields.currencyCosts = r2
	fields.durationSecs = r3
	return reuse
end

function Wrappers.GetTalentUnlockWorldQuest(talentID: number): Maybe<number>
	return Maybe.of(C_Garrison.GetTalentUnlockWorldQuest(talentID))
end

function Wrappers.GetTalentUnlockWorldQuestInto(reuse: Maybe<number>, talentID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Garrison.GetTalentUnlockWorldQuest(talentID))
end

function Wrappers.IsTalentConditionMet(talentID: number): IsTalentConditionMetResults
	local r1, r2 = C_Garrison.IsTalentConditionMet(talentID)
	return {
		isMet = r1,
		failureString = Maybe.of(r2),
	}
end

function Wrappers.IsTalentConditionMetInto(
	reuse: IsTalentConditionMetResults,
	talentID: number
): IsTalentConditionMetResults
	local r1, r2 = C_Garrison.IsTalentConditionMet(talentID)
	local fields = Reuse.fields(reuse)
	fields.isMet = r1
	fields.failureString = Reuse.maybe(fields.failureString, r2)
	return reuse
end

return Wrappers
