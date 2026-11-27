--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetCurrentSeasonValuesResults = {
	read displaySeasonID: number,
	read milestoneSeasonID: number,
	read rewardSeasonID: number,
}

export type GetLastWeeklyBestInformationResults = {
	read challengeMapId: number,
	read level: number,
}

export type GetRewardLevelForDifficultyLevelResults = {
	read weeklyRewardLevel: number,
	read endOfRunRewardLevel: number,
}

export type GetSeasonBestAffixScoreInfoForMapResults = {
	read affixScores: { MythicPlusAffixScoreInfo },
	read bestOverAllScore: number,
}

export type GetSeasonBestForMapResults = {
	read intimeInfo: Maybe<MapSeasonBestInfo>,
	read overtimeInfo: Maybe<MapSeasonBestInfo>,
}

export type GetSeasonBestMythicRatingFromThisExpansionResults = {
	read bestSeasonScore: number,
	read bestSeason: number,
}

export type GetWeeklyBestForMapResults = {
	read durationSec: number,
	read level: number,
	read completionDate: CalendarTime,
	read affixIDs: { number },
	read members: { MythicPlusMember },
	read dungeonScore: number,
}

export type GetWeeklyChestRewardLevelResults = {
	read currentWeekBestLevel: number,
	read weeklyRewardLevel: number,
	read nextDifficultyWeeklyRewardLevel: number,
	read nextBestLevel: number,
}

local Wrappers = {}

function Wrappers.GetCurrentAffixes(): Maybe<{ MythicPlusKeystoneAffix }>
	return Maybe.of(C_MythicPlus.GetCurrentAffixes())
end

function Wrappers.GetCurrentAffixesInto(reuse: Maybe<{ MythicPlusKeystoneAffix }>): Maybe<{ MythicPlusKeystoneAffix }>
	return Reuse.maybe(reuse, C_MythicPlus.GetCurrentAffixes())
end

function Wrappers.GetCurrentSeasonValues(): GetCurrentSeasonValuesResults
	local r1, r2, r3 = C_MythicPlus.GetCurrentSeasonValues()
	return {
		displaySeasonID = r1,
		milestoneSeasonID = r2,
		rewardSeasonID = r3,
	}
end

function Wrappers.GetCurrentSeasonValuesInto(reuse: GetCurrentSeasonValuesResults): GetCurrentSeasonValuesResults
	local r1, r2, r3 = C_MythicPlus.GetCurrentSeasonValues()
	local fields = Reuse.fields(reuse)
	fields.displaySeasonID = r1
	fields.milestoneSeasonID = r2
	fields.rewardSeasonID = r3
	return reuse
end

function Wrappers.GetCurrentUIDisplaySeason(): Maybe<number>
	return Maybe.of(C_MythicPlus.GetCurrentUIDisplaySeason())
end

function Wrappers.GetCurrentUIDisplaySeasonInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_MythicPlus.GetCurrentUIDisplaySeason())
end

function Wrappers.GetEndOfRunGearSequenceLevel(keystoneLevel: number): Maybe<number>
	return Maybe.of(C_MythicPlus.GetEndOfRunGearSequenceLevel(keystoneLevel))
end

function Wrappers.GetEndOfRunGearSequenceLevelInto(reuse: Maybe<number>, keystoneLevel: number): Maybe<number>
	return Reuse.maybe(reuse, C_MythicPlus.GetEndOfRunGearSequenceLevel(keystoneLevel))
end

function Wrappers.GetLastWeeklyBestInformation(): Maybe<GetLastWeeklyBestInformationResults>
	local r1, r2 = C_MythicPlus.GetLastWeeklyBestInformation()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		challengeMapId = r1,
		level = r2,
	})
end

function Wrappers.GetLastWeeklyBestInformationInto(
	reuse: GetLastWeeklyBestInformationResults
): Maybe<GetLastWeeklyBestInformationResults>
	local r1, r2 = C_MythicPlus.GetLastWeeklyBestInformation()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.challengeMapId = r1
	fields.level = r2
	return Reuse.just(reuse)
end

function Wrappers.GetOwnedKeystoneChallengeMapID(): Maybe<number>
	return Maybe.of(C_MythicPlus.GetOwnedKeystoneChallengeMapID())
end

function Wrappers.GetOwnedKeystoneChallengeMapIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_MythicPlus.GetOwnedKeystoneChallengeMapID())
end

function Wrappers.GetOwnedKeystoneLevel(): Maybe<number>
	return Maybe.of(C_MythicPlus.GetOwnedKeystoneLevel())
end

function Wrappers.GetOwnedKeystoneLevelInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_MythicPlus.GetOwnedKeystoneLevel())
end

function Wrappers.GetOwnedKeystoneMapID(): Maybe<number>
	return Maybe.of(C_MythicPlus.GetOwnedKeystoneMapID())
end

function Wrappers.GetOwnedKeystoneMapIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_MythicPlus.GetOwnedKeystoneMapID())
end

function Wrappers.GetRewardLevelForDifficultyLevel(difficultyLevel: number): GetRewardLevelForDifficultyLevelResults
	local r1, r2 = C_MythicPlus.GetRewardLevelForDifficultyLevel(difficultyLevel)
	return {
		weeklyRewardLevel = r1,
		endOfRunRewardLevel = r2,
	}
end

function Wrappers.GetRewardLevelForDifficultyLevelInto(
	reuse: GetRewardLevelForDifficultyLevelResults,
	difficultyLevel: number
): GetRewardLevelForDifficultyLevelResults
	local r1, r2 = C_MythicPlus.GetRewardLevelForDifficultyLevel(difficultyLevel)
	local fields = Reuse.fields(reuse)
	fields.weeklyRewardLevel = r1
	fields.endOfRunRewardLevel = r2
	return reuse
end

function Wrappers.GetRewardLevelFromKeystoneLevel(keystoneLevel: number): Maybe<number>
	return Maybe.of(C_MythicPlus.GetRewardLevelFromKeystoneLevel(keystoneLevel))
end

function Wrappers.GetRewardLevelFromKeystoneLevelInto(reuse: Maybe<number>, keystoneLevel: number): Maybe<number>
	return Reuse.maybe(reuse, C_MythicPlus.GetRewardLevelFromKeystoneLevel(keystoneLevel))
end

function Wrappers.GetSeasonBestAffixScoreInfoForMap(
	mapChallengeModeID: number
): Maybe<GetSeasonBestAffixScoreInfoForMapResults>
	local r1, r2 = C_MythicPlus.GetSeasonBestAffixScoreInfoForMap(mapChallengeModeID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		affixScores = r1,
		bestOverAllScore = r2,
	})
end

function Wrappers.GetSeasonBestAffixScoreInfoForMapInto(
	reuse: GetSeasonBestAffixScoreInfoForMapResults,
	mapChallengeModeID: number
): Maybe<GetSeasonBestAffixScoreInfoForMapResults>
	local r1, r2 = C_MythicPlus.GetSeasonBestAffixScoreInfoForMap(mapChallengeModeID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.affixScores = r1
	fields.bestOverAllScore = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSeasonBestForMap(mapChallengeModeID: number): GetSeasonBestForMapResults
	local r1, r2 = C_MythicPlus.GetSeasonBestForMap(mapChallengeModeID)
	return {
		intimeInfo = Maybe.of(r1),
		overtimeInfo = Maybe.of(r2),
	}
end

function Wrappers.GetSeasonBestForMapInto(
	reuse: GetSeasonBestForMapResults,
	mapChallengeModeID: number
): GetSeasonBestForMapResults
	local r1, r2 = C_MythicPlus.GetSeasonBestForMap(mapChallengeModeID)
	local fields = Reuse.fields(reuse)
	fields.intimeInfo = Reuse.maybe(fields.intimeInfo, r1)
	fields.overtimeInfo = Reuse.maybe(fields.overtimeInfo, r2)
	return reuse
end

function Wrappers.GetSeasonBestMythicRatingFromThisExpansion(): Maybe<GetSeasonBestMythicRatingFromThisExpansionResults>
	local r1, r2 = C_MythicPlus.GetSeasonBestMythicRatingFromThisExpansion()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		bestSeasonScore = r1,
		bestSeason = r2,
	})
end

function Wrappers.GetSeasonBestMythicRatingFromThisExpansionInto(
	reuse: GetSeasonBestMythicRatingFromThisExpansionResults
): Maybe<
	GetSeasonBestMythicRatingFromThisExpansionResults
>
	local r1, r2 = C_MythicPlus.GetSeasonBestMythicRatingFromThisExpansion()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.bestSeasonScore = r1
	fields.bestSeason = r2
	return Reuse.just(reuse)
end

function Wrappers.GetWeeklyBestForMap(mapChallengeModeID: number): Maybe<GetWeeklyBestForMapResults>
	local r1, r2, r3, r4, r5, r6 = C_MythicPlus.GetWeeklyBestForMap(mapChallengeModeID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		durationSec = r1,
		level = r2,
		completionDate = r3,
		affixIDs = r4,
		members = r5,
		dungeonScore = r6,
	})
end

function Wrappers.GetWeeklyBestForMapInto(
	reuse: GetWeeklyBestForMapResults,
	mapChallengeModeID: number
): Maybe<GetWeeklyBestForMapResults>
	local r1, r2, r3, r4, r5, r6 = C_MythicPlus.GetWeeklyBestForMap(mapChallengeModeID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.durationSec = r1
	fields.level = r2
	fields.completionDate = r3
	fields.affixIDs = r4
	fields.members = r5
	fields.dungeonScore = r6
	return Reuse.just(reuse)
end

function Wrappers.GetWeeklyChestRewardLevel(): GetWeeklyChestRewardLevelResults
	local r1, r2, r3, r4 = C_MythicPlus.GetWeeklyChestRewardLevel()
	return {
		currentWeekBestLevel = r1,
		weeklyRewardLevel = r2,
		nextDifficultyWeeklyRewardLevel = r3,
		nextBestLevel = r4,
	}
end

function Wrappers.GetWeeklyChestRewardLevelInto(
	reuse: GetWeeklyChestRewardLevelResults
): GetWeeklyChestRewardLevelResults
	local r1, r2, r3, r4 = C_MythicPlus.GetWeeklyChestRewardLevel()
	local fields = Reuse.fields(reuse)
	fields.currentWeekBestLevel = r1
	fields.weeklyRewardLevel = r2
	fields.nextDifficultyWeeklyRewardLevel = r3
	fields.nextBestLevel = r4
	return reuse
end

return Wrappers
