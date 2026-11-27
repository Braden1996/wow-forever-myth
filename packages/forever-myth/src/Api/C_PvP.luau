--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Result<T, E> = Result.Result<T, E>

export type CanPlayerUseTrainingGroundsUIResults = {
	read canUseTrainingGroundsUI: boolean,
	read failureReason: string,
}

export type GetArenaCrowdControlInfoResults = {
	read spellID: number,
	read startTime: number,
	read duration: number,
}

export type GetArenaRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetArenaSkirmishRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetBattlefieldFlagPositionResults = {
	read uiPosx: Maybe<number>,
	read uiPosy: Maybe<number>,
	read flagTexture: number,
}

export type GetBrawlRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
	read hasWon: boolean,
}

export type GetRandomBGRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetRandomEpicBGRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetRandomTrainingGroundArenaRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetRandomTrainingGroundBGRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetRatedBGRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetRatedSoloRBGRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetRatedSoloShuffleRewardsResults = {
	read honor: number,
	read experience: number,
	read itemRewards: Maybe<{ BattlefieldItemReward }>,
	read currencyRewards: Maybe<{ BattlefieldCurrencyReward }>,
	read roleShortageBonus: Maybe<RoleShortageReward>,
}

export type GetRewardItemLevelsByTierEnumResults = {
	read activityItemLevel: number,
	read weeklyItemLevel: number,
}

export type GetSeasonBestInfoResults = {
	read tierID: number,
	read nextTierID: Maybe<number>,
}

export type GetWeeklyChestInfoResults = {
	read rewardAchieved: boolean,
	read lastWeekRewardAchieved: boolean,
	read lastWeekRewardClaimed: boolean,
	read pvpTierMaxFromWins: number,
}

export type GetZonePVPInfoResults = {
	read pvpType: string,
	read isSubZonePvP: boolean,
	read factionName: Maybe<string>,
}

export type IsBattlegroundEnlistmentBonusActiveResults = {
	read battlegroundActive: boolean,
	read brawlActive: boolean,
}

local Wrappers = {}

function Wrappers.CanPlayerUseRatedPVPUI(): Result<true, string>
	local r1, r2 = C_PvP.CanPlayerUseRatedPVPUI()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.CanPlayerUseTrainingGroundsUI(): CanPlayerUseTrainingGroundsUIResults
	local r1, r2 = C_PvP.CanPlayerUseTrainingGroundsUI()
	return {
		canUseTrainingGroundsUI = r1,
		failureReason = r2,
	}
end

function Wrappers.CanPlayerUseTrainingGroundsUIInto(
	reuse: CanPlayerUseTrainingGroundsUIResults
): CanPlayerUseTrainingGroundsUIResults
	local r1, r2 = C_PvP.CanPlayerUseTrainingGroundsUI()
	local fields = Reuse.fields(reuse)
	fields.canUseTrainingGroundsUI = r1
	fields.failureReason = r2
	return reuse
end

function Wrappers.GetActiveBrawlInfo(): Maybe<PvpBrawlInfo>
	return Maybe.of(C_PvP.GetActiveBrawlInfo())
end

function Wrappers.GetActiveBrawlInfoInto(reuse: Maybe<PvpBrawlInfo>): Maybe<PvpBrawlInfo>
	return Reuse.maybe(reuse, C_PvP.GetActiveBrawlInfo())
end

function Wrappers.GetArenaCrowdControlInfo(playerToken: UnitToken): Maybe<GetArenaCrowdControlInfoResults>
	local r1, r2, r3 = C_PvP.GetArenaCrowdControlInfo(playerToken)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		spellID = r1,
		startTime = r2,
		duration = r3,
	})
end

function Wrappers.GetArenaCrowdControlInfoInto(
	reuse: GetArenaCrowdControlInfoResults,
	playerToken: UnitToken
): Maybe<GetArenaCrowdControlInfoResults>
	local r1, r2, r3 = C_PvP.GetArenaCrowdControlInfo(playerToken)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.spellID = r1
	fields.startTime = r2
	fields.duration = r3
	return Reuse.just(reuse)
end

function Wrappers.GetArenaRewards(teamSize: number): Maybe<GetArenaRewardsResults>
	local r1, r2, r3, r4, r5 = C_PvP.GetArenaRewards(teamSize)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	})
end

function Wrappers.GetArenaRewardsInto(reuse: GetArenaRewardsResults, teamSize: number): Maybe<GetArenaRewardsResults>
	local r1, r2, r3, r4, r5 = C_PvP.GetArenaRewards(teamSize)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return Reuse.just(reuse)
end

function Wrappers.GetArenaSkirmishRewards(): GetArenaSkirmishRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetArenaSkirmishRewards()
	return {
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	}
end

function Wrappers.GetArenaSkirmishRewardsInto(reuse: GetArenaSkirmishRewardsResults): GetArenaSkirmishRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetArenaSkirmishRewards()
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return reuse
end

function Wrappers.GetAssignedSpecForBattlefieldQueue(queueID: number): Maybe<number>
	return Maybe.of(C_PvP.GetAssignedSpecForBattlefieldQueue(queueID))
end

function Wrappers.GetAssignedSpecForBattlefieldQueueInto(reuse: Maybe<number>, queueID: number): Maybe<number>
	return Reuse.maybe(reuse, C_PvP.GetAssignedSpecForBattlefieldQueue(queueID))
end

function Wrappers.GetAvailableBrawlInfo(): Maybe<PvpBrawlInfo>
	return Maybe.of(C_PvP.GetAvailableBrawlInfo())
end

function Wrappers.GetAvailableBrawlInfoInto(reuse: Maybe<PvpBrawlInfo>): Maybe<PvpBrawlInfo>
	return Reuse.maybe(reuse, C_PvP.GetAvailableBrawlInfo())
end

function Wrappers.GetBattlefieldFlagPosition(flagIndex: number, uiMapId: number): GetBattlefieldFlagPositionResults
	local r1, r2, r3 = C_PvP.GetBattlefieldFlagPosition(flagIndex, uiMapId)
	return {
		uiPosx = Maybe.of(r1),
		uiPosy = Maybe.of(r2),
		flagTexture = r3,
	}
end

function Wrappers.GetBattlefieldFlagPositionInto(
	reuse: GetBattlefieldFlagPositionResults,
	flagIndex: number,
	uiMapId: number
): GetBattlefieldFlagPositionResults
	local r1, r2, r3 = C_PvP.GetBattlefieldFlagPosition(flagIndex, uiMapId)
	local fields = Reuse.fields(reuse)
	fields.uiPosx = Reuse.maybe(fields.uiPosx, r1)
	fields.uiPosy = Reuse.maybe(fields.uiPosy, r2)
	fields.flagTexture = r3
	return reuse
end

function Wrappers.GetBattlefieldVehicleInfo(vehicleIndex: number, uiMapID: number): Maybe<BattlefieldVehicleInfo>
	return Maybe.of(C_PvP.GetBattlefieldVehicleInfo(vehicleIndex, uiMapID))
end

function Wrappers.GetBattlefieldVehicleInfoInto(
	reuse: Maybe<BattlefieldVehicleInfo>,
	vehicleIndex: number,
	uiMapID: number
): Maybe<BattlefieldVehicleInfo>
	return Reuse.maybe(reuse, C_PvP.GetBattlefieldVehicleInfo(vehicleIndex, uiMapID))
end

function Wrappers.GetBattlefieldVehicles(uiMapID: number): Maybe<{ BattlefieldVehicleInfo }>
	return Maybe.of(C_PvP.GetBattlefieldVehicles(uiMapID))
end

function Wrappers.GetBattlefieldVehiclesInto(
	reuse: Maybe<{ BattlefieldVehicleInfo }>,
	uiMapID: number
): Maybe<{ BattlefieldVehicleInfo }>
	return Reuse.maybe(reuse, C_PvP.GetBattlefieldVehicles(uiMapID))
end

function Wrappers.GetBattlegroundInfo(battlegroundIndex: number): Maybe<BattlegroundInfo>
	return Maybe.of(C_PvP.GetBattlegroundInfo(battlegroundIndex))
end

function Wrappers.GetBattlegroundInfoInto(
	reuse: Maybe<BattlegroundInfo>,
	battlegroundIndex: number
): Maybe<BattlegroundInfo>
	return Reuse.maybe(reuse, C_PvP.GetBattlegroundInfo(battlegroundIndex))
end

function Wrappers.GetBrawlRewards(brawlType: Enum_BrawlType): Maybe<GetBrawlRewardsResults>
	local r1, r2, r3, r4, r5, r6 = C_PvP.GetBrawlRewards(brawlType)
	if r1 == nil or r2 == nil or r6 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
		hasWon = r6,
	})
end

function Wrappers.GetBrawlRewardsInto(
	reuse: GetBrawlRewardsResults,
	brawlType: Enum_BrawlType
): Maybe<GetBrawlRewardsResults>
	local r1, r2, r3, r4, r5, r6 = C_PvP.GetBrawlRewards(brawlType)
	if r1 == nil or r2 == nil or r6 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	fields.hasWon = r6
	return Reuse.just(reuse)
end

function Wrappers.GetGlobalPvpScalingInfoForSpecID(specializationID: number): Maybe<{ PvpScalingData }>
	return Maybe.of(C_PvP.GetGlobalPvpScalingInfoForSpecID(specializationID))
end

function Wrappers.GetGlobalPvpScalingInfoForSpecIDInto(
	reuse: Maybe<{ PvpScalingData }>,
	specializationID: number
): Maybe<{ PvpScalingData }>
	return Reuse.maybe(reuse, C_PvP.GetGlobalPvpScalingInfoForSpecID(specializationID))
end

function Wrappers.GetHonorRewardInfo(honorLevel: number): Maybe<HonorRewardInfo>
	return Maybe.of(C_PvP.GetHonorRewardInfo(honorLevel))
end

function Wrappers.GetHonorRewardInfoInto(reuse: Maybe<HonorRewardInfo>, honorLevel: number): Maybe<HonorRewardInfo>
	return Reuse.maybe(reuse, C_PvP.GetHonorRewardInfo(honorLevel))
end

function Wrappers.GetMatchPVPStatColumn(pvpStatID: number): Maybe<MatchPVPStatColumn>
	return Maybe.of(C_PvP.GetMatchPVPStatColumn(pvpStatID))
end

function Wrappers.GetMatchPVPStatColumnInto(
	reuse: Maybe<MatchPVPStatColumn>,
	pvpStatID: number
): Maybe<MatchPVPStatColumn>
	return Reuse.maybe(reuse, C_PvP.GetMatchPVPStatColumn(pvpStatID))
end

function Wrappers.GetNextHonorLevelForReward(honorLevel: number): Maybe<number>
	return Maybe.of(C_PvP.GetNextHonorLevelForReward(honorLevel))
end

function Wrappers.GetNextHonorLevelForRewardInto(reuse: Maybe<number>, honorLevel: number): Maybe<number>
	return Reuse.maybe(reuse, C_PvP.GetNextHonorLevelForReward(honorLevel))
end

function Wrappers.GetPVPActiveMatchPersonalRatedInfo(): Maybe<PVPPersonalRatedInfo>
	return Maybe.of(C_PvP.GetPVPActiveMatchPersonalRatedInfo())
end

function Wrappers.GetPVPActiveMatchPersonalRatedInfoInto(
	reuse: Maybe<PVPPersonalRatedInfo>
): Maybe<PVPPersonalRatedInfo>
	return Reuse.maybe(reuse, C_PvP.GetPVPActiveMatchPersonalRatedInfo())
end

function Wrappers.GetPVPActiveRatedMatchDeserterPenalty(): Maybe<RatedMatchDeserterPenalty>
	return Maybe.of(C_PvP.GetPVPActiveRatedMatchDeserterPenalty())
end

function Wrappers.GetPVPActiveRatedMatchDeserterPenaltyInto(
	reuse: Maybe<RatedMatchDeserterPenalty>
): Maybe<RatedMatchDeserterPenalty>
	return Reuse.maybe(reuse, C_PvP.GetPVPActiveRatedMatchDeserterPenalty())
end

function Wrappers.GetPVPSeasonRewardAchievementID(): Maybe<number>
	return Maybe.of(C_PvP.GetPVPSeasonRewardAchievementID())
end

function Wrappers.GetPVPSeasonRewardAchievementIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_PvP.GetPVPSeasonRewardAchievementID())
end

function Wrappers.GetPersonalRatedBGBlitzSpecStats(): Maybe<RatedBGBlitzSpecStats>
	return Maybe.of(C_PvP.GetPersonalRatedBGBlitzSpecStats())
end

function Wrappers.GetPersonalRatedBGBlitzSpecStatsInto(
	reuse: Maybe<RatedBGBlitzSpecStats>
): Maybe<RatedBGBlitzSpecStats>
	return Reuse.maybe(reuse, C_PvP.GetPersonalRatedBGBlitzSpecStats())
end

function Wrappers.GetPersonalRatedSoloShuffleSpecStats(): Maybe<RatedSoloShuffleSpecStats>
	return Maybe.of(C_PvP.GetPersonalRatedSoloShuffleSpecStats())
end

function Wrappers.GetPersonalRatedSoloShuffleSpecStatsInto(
	reuse: Maybe<RatedSoloShuffleSpecStats>
): Maybe<RatedSoloShuffleSpecStats>
	return Reuse.maybe(reuse, C_PvP.GetPersonalRatedSoloShuffleSpecStats())
end

function Wrappers.GetPvpTierID(tierEnum: number, bracketEnum: number): Maybe<number>
	return Maybe.of(C_PvP.GetPvpTierID(tierEnum, bracketEnum))
end

function Wrappers.GetPvpTierIDInto(reuse: Maybe<number>, tierEnum: number, bracketEnum: number): Maybe<number>
	return Reuse.maybe(reuse, C_PvP.GetPvpTierID(tierEnum, bracketEnum))
end

function Wrappers.GetPvpTierInfo(tierID: number): Maybe<PvpTierInfo>
	return Maybe.of(C_PvP.GetPvpTierInfo(tierID))
end

function Wrappers.GetPvpTierInfoInto(reuse: Maybe<PvpTierInfo>, tierID: number): Maybe<PvpTierInfo>
	return Reuse.maybe(reuse, C_PvP.GetPvpTierInfo(tierID))
end

function Wrappers.GetRandomBGRewards(): GetRandomBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRandomBGRewards()
	return {
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	}
end

function Wrappers.GetRandomBGRewardsInto(reuse: GetRandomBGRewardsResults): GetRandomBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRandomBGRewards()
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return reuse
end

function Wrappers.GetRandomEpicBGRewards(): GetRandomEpicBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRandomEpicBGRewards()
	return {
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	}
end

function Wrappers.GetRandomEpicBGRewardsInto(reuse: GetRandomEpicBGRewardsResults): GetRandomEpicBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRandomEpicBGRewards()
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return reuse
end

function Wrappers.GetRandomTrainingGroundArenaRewards(): GetRandomTrainingGroundArenaRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRandomTrainingGroundArenaRewards()
	return {
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	}
end

function Wrappers.GetRandomTrainingGroundArenaRewardsInto(
	reuse: GetRandomTrainingGroundArenaRewardsResults
): GetRandomTrainingGroundArenaRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRandomTrainingGroundArenaRewards()
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return reuse
end

function Wrappers.GetRandomTrainingGroundBGRewards(): GetRandomTrainingGroundBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRandomTrainingGroundBGRewards()
	return {
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	}
end

function Wrappers.GetRandomTrainingGroundBGRewardsInto(
	reuse: GetRandomTrainingGroundBGRewardsResults
): GetRandomTrainingGroundBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRandomTrainingGroundBGRewards()
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return reuse
end

function Wrappers.GetRatedBGRewards(): GetRatedBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRatedBGRewards()
	return {
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	}
end

function Wrappers.GetRatedBGRewardsInto(reuse: GetRatedBGRewardsResults): GetRatedBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRatedBGRewards()
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return reuse
end

function Wrappers.GetRatedSoloRBGRewards(): GetRatedSoloRBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRatedSoloRBGRewards()
	return {
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	}
end

function Wrappers.GetRatedSoloRBGRewardsInto(reuse: GetRatedSoloRBGRewardsResults): GetRatedSoloRBGRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRatedSoloRBGRewards()
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return reuse
end

function Wrappers.GetRatedSoloShuffleRewards(): GetRatedSoloShuffleRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRatedSoloShuffleRewards()
	return {
		honor = r1,
		experience = r2,
		itemRewards = Maybe.of(r3),
		currencyRewards = Maybe.of(r4),
		roleShortageBonus = Maybe.of(r5),
	}
end

function Wrappers.GetRatedSoloShuffleRewardsInto(
	reuse: GetRatedSoloShuffleRewardsResults
): GetRatedSoloShuffleRewardsResults
	local r1, r2, r3, r4, r5 = C_PvP.GetRatedSoloShuffleRewards()
	local fields = Reuse.fields(reuse)
	fields.honor = r1
	fields.experience = r2
	fields.itemRewards = Reuse.maybe(fields.itemRewards, r3)
	fields.currencyRewards = Reuse.maybe(fields.currencyRewards, r4)
	fields.roleShortageBonus = Reuse.maybe(fields.roleShortageBonus, r5)
	return reuse
end

function Wrappers.GetRewardItemLevelsByTierEnum(pvpTierEnum: number): GetRewardItemLevelsByTierEnumResults
	local r1, r2 = C_PvP.GetRewardItemLevelsByTierEnum(pvpTierEnum)
	return {
		activityItemLevel = r1,
		weeklyItemLevel = r2,
	}
end

function Wrappers.GetRewardItemLevelsByTierEnumInto(
	reuse: GetRewardItemLevelsByTierEnumResults,
	pvpTierEnum: number
): GetRewardItemLevelsByTierEnumResults
	local r1, r2 = C_PvP.GetRewardItemLevelsByTierEnum(pvpTierEnum)
	local fields = Reuse.fields(reuse)
	fields.activityItemLevel = r1
	fields.weeklyItemLevel = r2
	return reuse
end

function Wrappers.GetScoreInfo(offsetIndex: number): Maybe<PVPScoreInfo>
	return Maybe.of(C_PvP.GetScoreInfo(offsetIndex))
end

function Wrappers.GetScoreInfoInto(reuse: Maybe<PVPScoreInfo>, offsetIndex: number): Maybe<PVPScoreInfo>
	return Reuse.maybe(reuse, C_PvP.GetScoreInfo(offsetIndex))
end

function Wrappers.GetScoreInfoByPlayerGuid(guid: WOWGUID): Maybe<PVPScoreInfo>
	return Maybe.of(C_PvP.GetScoreInfoByPlayerGuid(guid))
end

function Wrappers.GetScoreInfoByPlayerGuidInto(reuse: Maybe<PVPScoreInfo>, guid: WOWGUID): Maybe<PVPScoreInfo>
	return Reuse.maybe(reuse, C_PvP.GetScoreInfoByPlayerGuid(guid))
end

function Wrappers.GetSeasonBestInfo(): GetSeasonBestInfoResults
	local r1, r2 = C_PvP.GetSeasonBestInfo()
	return {
		tierID = r1,
		nextTierID = Maybe.of(r2),
	}
end

function Wrappers.GetSeasonBestInfoInto(reuse: GetSeasonBestInfoResults): GetSeasonBestInfoResults
	local r1, r2 = C_PvP.GetSeasonBestInfo()
	local fields = Reuse.fields(reuse)
	fields.tierID = r1
	fields.nextTierID = Reuse.maybe(fields.nextTierID, r2)
	return reuse
end

function Wrappers.GetSkirmishInfo(pvpBracket: number): Maybe<BattlemasterListInfo>
	return Maybe.of(C_PvP.GetSkirmishInfo(pvpBracket))
end

function Wrappers.GetSkirmishInfoInto(
	reuse: Maybe<BattlemasterListInfo>,
	pvpBracket: number
): Maybe<BattlemasterListInfo>
	return Reuse.maybe(reuse, C_PvP.GetSkirmishInfo(pvpBracket))
end

function Wrappers.GetSpecialEventBrawlInfo(): Maybe<PvpBrawlInfo>
	return Maybe.of(C_PvP.GetSpecialEventBrawlInfo())
end

function Wrappers.GetSpecialEventBrawlInfoInto(reuse: Maybe<PvpBrawlInfo>): Maybe<PvpBrawlInfo>
	return Reuse.maybe(reuse, C_PvP.GetSpecialEventBrawlInfo())
end

function Wrappers.GetTeamInfo(factionIndex: number): Maybe<PVPTeamInfo>
	return Maybe.of(C_PvP.GetTeamInfo(factionIndex))
end

function Wrappers.GetTeamInfoInto(reuse: Maybe<PVPTeamInfo>, factionIndex: number): Maybe<PVPTeamInfo>
	return Reuse.maybe(reuse, C_PvP.GetTeamInfo(factionIndex))
end

function Wrappers.GetWeeklyChestInfo(): GetWeeklyChestInfoResults
	local r1, r2, r3, r4 = C_PvP.GetWeeklyChestInfo()
	return {
		rewardAchieved = r1,
		lastWeekRewardAchieved = r2,
		lastWeekRewardClaimed = r3,
		pvpTierMaxFromWins = r4,
	}
end

function Wrappers.GetWeeklyChestInfoInto(reuse: GetWeeklyChestInfoResults): GetWeeklyChestInfoResults
	local r1, r2, r3, r4 = C_PvP.GetWeeklyChestInfo()
	local fields = Reuse.fields(reuse)
	fields.rewardAchieved = r1
	fields.lastWeekRewardAchieved = r2
	fields.lastWeekRewardClaimed = r3
	fields.pvpTierMaxFromWins = r4
	return reuse
end

function Wrappers.GetZonePVPInfo(): Maybe<GetZonePVPInfoResults>
	local r1, r2, r3 = C_PvP.GetZonePVPInfo()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		pvpType = r1,
		isSubZonePvP = r2,
		factionName = Maybe.of(r3),
	})
end

function Wrappers.GetZonePVPInfoInto(reuse: GetZonePVPInfoResults): Maybe<GetZonePVPInfoResults>
	local r1, r2, r3 = C_PvP.GetZonePVPInfo()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.pvpType = r1
	fields.isSubZonePvP = r2
	fields.factionName = Reuse.maybe(fields.factionName, r3)
	return Reuse.just(reuse)
end

function Wrappers.IsBattlegroundEnlistmentBonusActive(): IsBattlegroundEnlistmentBonusActiveResults
	local r1, r2 = C_PvP.IsBattlegroundEnlistmentBonusActive()
	return {
		battlegroundActive = r1,
		brawlActive = r2,
	}
end

function Wrappers.IsBattlegroundEnlistmentBonusActiveInto(
	reuse: IsBattlegroundEnlistmentBonusActiveResults
): IsBattlegroundEnlistmentBonusActiveResults
	local r1, r2 = C_PvP.IsBattlegroundEnlistmentBonusActive()
	local fields = Reuse.fields(reuse)
	fields.battlegroundActive = r1
	fields.brawlActive = r2
	return reuse
end

return Wrappers
