--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetExampleRewardItemHyperlinksResults = {
	read hyperlink: string,
	read upgradeHyperlink: string,
}

export type GetNextActivitiesIncreaseResults = {
	read hasSeasonData: boolean,
	read nextActivityTierID: Maybe<number>,
	read nextLevel: Maybe<number>,
	read itemLevel: Maybe<number>,
}

export type GetNextMythicPlusIncreaseResults = {
	read hasSeasonData: boolean,
	read nextMythicPlusLevel: Maybe<number>,
	read itemLevel: Maybe<number>,
}

export type GetNumCompletedDungeonRunsResults = {
	read numHeroic: number,
	read numMythic: number,
	read numMythicPlus: number,
}

local Wrappers = {}

function Wrappers.GetActivityEncounterInfo(
	type: Enum_WeeklyRewardChestThresholdType,
	index: number
): Maybe<{ WeeklyRewardActivityEncounterInfo }>
	return Maybe.of(C_WeeklyRewards.GetActivityEncounterInfo(type, index))
end

function Wrappers.GetActivityEncounterInfoInto(
	reuse: Maybe<{ WeeklyRewardActivityEncounterInfo }>,
	type: Enum_WeeklyRewardChestThresholdType,
	index: number
): Maybe<{ WeeklyRewardActivityEncounterInfo }>
	return Reuse.maybe(reuse, C_WeeklyRewards.GetActivityEncounterInfo(type, index))
end

function Wrappers.GetDifficultyIDForActivityTier(activityTierID: number): Maybe<number>
	return Maybe.of(C_WeeklyRewards.GetDifficultyIDForActivityTier(activityTierID))
end

function Wrappers.GetDifficultyIDForActivityTierInto(reuse: Maybe<number>, activityTierID: number): Maybe<number>
	return Reuse.maybe(reuse, C_WeeklyRewards.GetDifficultyIDForActivityTier(activityTierID))
end

function Wrappers.GetExampleRewardItemHyperlinks(id: number): Maybe<GetExampleRewardItemHyperlinksResults>
	local r1, r2 = C_WeeklyRewards.GetExampleRewardItemHyperlinks(id)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		hyperlink = r1,
		upgradeHyperlink = r2,
	})
end

function Wrappers.GetExampleRewardItemHyperlinksInto(
	reuse: GetExampleRewardItemHyperlinksResults,
	id: number
): Maybe<GetExampleRewardItemHyperlinksResults>
	local r1, r2 = C_WeeklyRewards.GetExampleRewardItemHyperlinks(id)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.hyperlink = r1
	fields.upgradeHyperlink = r2
	return Reuse.just(reuse)
end

function Wrappers.GetItemHyperlink(itemDBID: WeeklyRewardItemDBID): Maybe<string>
	return Maybe.of(C_WeeklyRewards.GetItemHyperlink(itemDBID))
end

function Wrappers.GetItemHyperlinkInto(reuse: Maybe<string>, itemDBID: WeeklyRewardItemDBID): Maybe<string>
	return Reuse.maybe(reuse, C_WeeklyRewards.GetItemHyperlink(itemDBID))
end

function Wrappers.GetNextActivitiesIncrease(activityTierID: number, level: number): GetNextActivitiesIncreaseResults
	local r1, r2, r3, r4 = C_WeeklyRewards.GetNextActivitiesIncrease(activityTierID, level)
	return {
		hasSeasonData = r1,
		nextActivityTierID = Maybe.of(r2),
		nextLevel = Maybe.of(r3),
		itemLevel = Maybe.of(r4),
	}
end

function Wrappers.GetNextActivitiesIncreaseInto(
	reuse: GetNextActivitiesIncreaseResults,
	activityTierID: number,
	level: number
): GetNextActivitiesIncreaseResults
	local r1, r2, r3, r4 = C_WeeklyRewards.GetNextActivitiesIncrease(activityTierID, level)
	local fields = Reuse.fields(reuse)
	fields.hasSeasonData = r1
	fields.nextActivityTierID = Reuse.maybe(fields.nextActivityTierID, r2)
	fields.nextLevel = Reuse.maybe(fields.nextLevel, r3)
	fields.itemLevel = Reuse.maybe(fields.itemLevel, r4)
	return reuse
end

function Wrappers.GetNextMythicPlusIncrease(mythicPlusLevel: number): GetNextMythicPlusIncreaseResults
	local r1, r2, r3 = C_WeeklyRewards.GetNextMythicPlusIncrease(mythicPlusLevel)
	return {
		hasSeasonData = r1,
		nextMythicPlusLevel = Maybe.of(r2),
		itemLevel = Maybe.of(r3),
	}
end

function Wrappers.GetNextMythicPlusIncreaseInto(
	reuse: GetNextMythicPlusIncreaseResults,
	mythicPlusLevel: number
): GetNextMythicPlusIncreaseResults
	local r1, r2, r3 = C_WeeklyRewards.GetNextMythicPlusIncrease(mythicPlusLevel)
	local fields = Reuse.fields(reuse)
	fields.hasSeasonData = r1
	fields.nextMythicPlusLevel = Reuse.maybe(fields.nextMythicPlusLevel, r2)
	fields.itemLevel = Reuse.maybe(fields.itemLevel, r3)
	return reuse
end

function Wrappers.GetNumCompletedDungeonRuns(): GetNumCompletedDungeonRunsResults
	local r1, r2, r3 = C_WeeklyRewards.GetNumCompletedDungeonRuns()
	return {
		numHeroic = r1,
		numMythic = r2,
		numMythicPlus = r3,
	}
end

function Wrappers.GetNumCompletedDungeonRunsInto(
	reuse: GetNumCompletedDungeonRunsResults
): GetNumCompletedDungeonRunsResults
	local r1, r2, r3 = C_WeeklyRewards.GetNumCompletedDungeonRuns()
	local fields = Reuse.fields(reuse)
	fields.numHeroic = r1
	fields.numMythic = r2
	fields.numMythicPlus = r3
	return reuse
end

return Wrappers
