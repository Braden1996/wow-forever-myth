--!strict
local Loads = require("../Runtime/Loads")
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")
local Task = require("@truemyth/Task")

type Maybe<T> = Maybe.Maybe<T>
type Task<T, E> = Task.Task<T, E>

export type GetBountySetInfoForMapIDResults = {
	read displayLocation: Enum_MapOverlayDisplayLocation,
	read lockQuestID: number,
	read bountySetID: number,
	read isActivitySet: boolean,
}

export type GetDistanceSqToQuestResults = {
	read distanceSq: number,
	read onContinent: boolean,
}

export type GetNextWaypointResults = {
	read mapID: number,
	read x: number,
	read y: number,
}

export type GetNextWaypointForMapResults = {
	read x: number,
	read y: number,
}

export type GetNumQuestLogEntriesResults = {
	read numShownEntries: number,
	read numQuests: number,
}

export type GetQuestAdditionalHighlightsResults = {
	read uiMapID: number,
	read worldQuests: boolean,
	read worldQuestsElite: boolean,
	read dungeons: boolean,
	read treasures: boolean,
}

export type GetQuestLogPortraitGiverResults = {
	read portraitGiver: number,
	read portraitGiverText: string,
	read portraitGiverName: string,
	read portraitGiverMount: number,
	read portraitGiverModelSceneID: Maybe<number>,
}

export type GetTimeAllowedResults = {
	read totalTime: number,
	read elapsedTime: number,
}

export type GetZoneStoryInfoResults = {
	read achievementID: number,
	read storyMapID: number,
}

export type IsOnMapResults = {
	read onMap: boolean,
	read hasLocalPOI: boolean,
}

local Wrappers = {}

function Wrappers.GetAbandonQuestItems(): Maybe<{ number }>
	return Maybe.of(C_QuestLog.GetAbandonQuestItems())
end

function Wrappers.GetAbandonQuestItemsInto(reuse: Maybe<{ number }>): Maybe<{ number }>
	return Reuse.maybe(reuse, C_QuestLog.GetAbandonQuestItems())
end

function Wrappers.GetActivePreyQuest(): Maybe<number>
	return Maybe.of(C_QuestLog.GetActivePreyQuest())
end

function Wrappers.GetActivePreyQuestInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_QuestLog.GetActivePreyQuest())
end

function Wrappers.GetActiveThreatMaps(): Maybe<{ number }>
	return Maybe.of(C_QuestLog.GetActiveThreatMaps())
end

function Wrappers.GetActiveThreatMapsInto(reuse: Maybe<{ number }>): Maybe<{ number }>
	return Reuse.maybe(reuse, C_QuestLog.GetActiveThreatMaps())
end

function Wrappers.GetBountiesForMapID(uiMapID: number): Maybe<{ BountyInfo }>
	return Maybe.of(C_QuestLog.GetBountiesForMapID(uiMapID))
end

function Wrappers.GetBountiesForMapIDInto(reuse: Maybe<{ BountyInfo }>, uiMapID: number): Maybe<{ BountyInfo }>
	return Reuse.maybe(reuse, C_QuestLog.GetBountiesForMapID(uiMapID))
end

function Wrappers.GetBountySetInfoForMapID(uiMapID: number): Maybe<GetBountySetInfoForMapIDResults>
	local r1, r2, r3, r4 = C_QuestLog.GetBountySetInfoForMapID(uiMapID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		displayLocation = r1,
		lockQuestID = r2,
		bountySetID = r3,
		isActivitySet = r4,
	})
end

function Wrappers.GetBountySetInfoForMapIDInto(
	reuse: GetBountySetInfoForMapIDResults,
	uiMapID: number
): Maybe<GetBountySetInfoForMapIDResults>
	local r1, r2, r3, r4 = C_QuestLog.GetBountySetInfoForMapID(uiMapID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.displayLocation = r1
	fields.lockQuestID = r2
	fields.bountySetID = r3
	fields.isActivitySet = r4
	return Reuse.just(reuse)
end

function Wrappers.GetDistanceSqToQuest(questID: number): Maybe<GetDistanceSqToQuestResults>
	local r1, r2 = C_QuestLog.GetDistanceSqToQuest(questID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		distanceSq = r1,
		onContinent = r2,
	})
end

function Wrappers.GetDistanceSqToQuestInto(
	reuse: GetDistanceSqToQuestResults,
	questID: number
): Maybe<GetDistanceSqToQuestResults>
	local r1, r2 = C_QuestLog.GetDistanceSqToQuest(questID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.distanceSq = r1
	fields.onContinent = r2
	return Reuse.just(reuse)
end

function Wrappers.GetHeaderIndexForQuest(questID: number): Maybe<number>
	return Maybe.of(C_QuestLog.GetHeaderIndexForQuest(questID))
end

function Wrappers.GetHeaderIndexForQuestInto(reuse: Maybe<number>, questID: number): Maybe<number>
	return Reuse.maybe(reuse, C_QuestLog.GetHeaderIndexForQuest(questID))
end

function Wrappers.GetInfo(questLogIndex: number): Maybe<QuestInfo>
	return Maybe.of(C_QuestLog.GetInfo(questLogIndex))
end

function Wrappers.GetInfoInto(reuse: Maybe<QuestInfo>, questLogIndex: number): Maybe<QuestInfo>
	return Reuse.maybe(reuse, C_QuestLog.GetInfo(questLogIndex))
end

function Wrappers.GetLogIndexForQuestID(questID: number): Maybe<number>
	return Maybe.of(C_QuestLog.GetLogIndexForQuestID(questID))
end

function Wrappers.GetLogIndexForQuestIDInto(reuse: Maybe<number>, questID: number): Maybe<number>
	return Reuse.maybe(reuse, C_QuestLog.GetLogIndexForQuestID(questID))
end

function Wrappers.GetNextWaypoint(questID: number): Maybe<GetNextWaypointResults>
	local r1, r2, r3 = C_QuestLog.GetNextWaypoint(questID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		mapID = r1,
		x = r2,
		y = r3,
	})
end

function Wrappers.GetNextWaypointInto(reuse: GetNextWaypointResults, questID: number): Maybe<GetNextWaypointResults>
	local r1, r2, r3 = C_QuestLog.GetNextWaypoint(questID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.mapID = r1
	fields.x = r2
	fields.y = r3
	return Reuse.just(reuse)
end

function Wrappers.GetNextWaypointForMap(questID: number, uiMapID: number): Maybe<GetNextWaypointForMapResults>
	local r1, r2 = C_QuestLog.GetNextWaypointForMap(questID, uiMapID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		x = r1,
		y = r2,
	})
end

function Wrappers.GetNextWaypointForMapInto(
	reuse: GetNextWaypointForMapResults,
	questID: number,
	uiMapID: number
): Maybe<GetNextWaypointForMapResults>
	local r1, r2 = C_QuestLog.GetNextWaypointForMap(questID, uiMapID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.x = r1
	fields.y = r2
	return Reuse.just(reuse)
end

function Wrappers.GetNextWaypointText(questID: number): Maybe<string>
	return Maybe.of(C_QuestLog.GetNextWaypointText(questID))
end

function Wrappers.GetNextWaypointTextInto(reuse: Maybe<string>, questID: number): Maybe<string>
	return Reuse.maybe(reuse, C_QuestLog.GetNextWaypointText(questID))
end

function Wrappers.GetNumQuestLogEntries(): GetNumQuestLogEntriesResults
	local r1, r2 = C_QuestLog.GetNumQuestLogEntries()
	return {
		numShownEntries = r1,
		numQuests = r2,
	}
end

function Wrappers.GetNumQuestLogEntriesInto(reuse: GetNumQuestLogEntriesResults): GetNumQuestLogEntriesResults
	local r1, r2 = C_QuestLog.GetNumQuestLogEntries()
	local fields = Reuse.fields(reuse)
	fields.numShownEntries = r1
	fields.numQuests = r2
	return reuse
end

function Wrappers.GetQuestAdditionalHighlights(questID: number): GetQuestAdditionalHighlightsResults
	local r1, r2, r3, r4, r5 = C_QuestLog.GetQuestAdditionalHighlights(questID)
	return {
		uiMapID = r1,
		worldQuests = r2,
		worldQuestsElite = r3,
		dungeons = r4,
		treasures = r5,
	}
end

function Wrappers.GetQuestAdditionalHighlightsInto(
	reuse: GetQuestAdditionalHighlightsResults,
	questID: number
): GetQuestAdditionalHighlightsResults
	local r1, r2, r3, r4, r5 = C_QuestLog.GetQuestAdditionalHighlights(questID)
	local fields = Reuse.fields(reuse)
	fields.uiMapID = r1
	fields.worldQuests = r2
	fields.worldQuestsElite = r3
	fields.dungeons = r4
	fields.treasures = r5
	return reuse
end

function Wrappers.GetQuestDetailsTheme(questID: number): Maybe<QuestTheme>
	return Maybe.of(C_QuestLog.GetQuestDetailsTheme(questID))
end

function Wrappers.GetQuestDetailsThemeInto(reuse: Maybe<QuestTheme>, questID: number): Maybe<QuestTheme>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestDetailsTheme(questID))
end

function Wrappers.GetQuestIDForLogIndex(questLogIndex: number): Maybe<number>
	return Maybe.of(C_QuestLog.GetQuestIDForLogIndex(questLogIndex))
end

function Wrappers.GetQuestIDForLogIndexInto(reuse: Maybe<number>, questLogIndex: number): Maybe<number>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestIDForLogIndex(questLogIndex))
end

function Wrappers.GetQuestIDForQuestWatchIndex(questWatchIndex: number): Maybe<number>
	return Maybe.of(C_QuestLog.GetQuestIDForQuestWatchIndex(questWatchIndex))
end

function Wrappers.GetQuestIDForQuestWatchIndexInto(reuse: Maybe<number>, questWatchIndex: number): Maybe<number>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestIDForQuestWatchIndex(questWatchIndex))
end

function Wrappers.GetQuestIDForWorldQuestWatchIndex(questWatchIndex: number): Maybe<number>
	return Maybe.of(C_QuestLog.GetQuestIDForWorldQuestWatchIndex(questWatchIndex))
end

function Wrappers.GetQuestIDForWorldQuestWatchIndexInto(reuse: Maybe<number>, questWatchIndex: number): Maybe<number>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestIDForWorldQuestWatchIndex(questWatchIndex))
end

function Wrappers.GetQuestLogMajorFactionReputationRewards(questID: number): Maybe<{ QuestRewardReputationInfo }>
	return Maybe.of(C_QuestLog.GetQuestLogMajorFactionReputationRewards(questID))
end

function Wrappers.GetQuestLogMajorFactionReputationRewardsInto(
	reuse: Maybe<{ QuestRewardReputationInfo }>,
	questID: number
): Maybe<{ QuestRewardReputationInfo }>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestLogMajorFactionReputationRewards(questID))
end

function Wrappers.GetQuestLogPortraitGiver(questLogIndex: number?): Maybe<GetQuestLogPortraitGiverResults>
	local r1, r2, r3, r4, r5 = C_QuestLog.GetQuestLogPortraitGiver(questLogIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		portraitGiver = r1,
		portraitGiverText = r2,
		portraitGiverName = r3,
		portraitGiverMount = r4,
		portraitGiverModelSceneID = Maybe.of(r5),
	})
end

function Wrappers.GetQuestLogPortraitGiverInto(
	reuse: GetQuestLogPortraitGiverResults,
	questLogIndex: number?
): Maybe<GetQuestLogPortraitGiverResults>
	local r1, r2, r3, r4, r5 = C_QuestLog.GetQuestLogPortraitGiver(questLogIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.portraitGiver = r1
	fields.portraitGiverText = r2
	fields.portraitGiverName = r3
	fields.portraitGiverMount = r4
	fields.portraitGiverModelSceneID = Reuse.maybe(fields.portraitGiverModelSceneID, r5)
	return Reuse.just(reuse)
end

function Wrappers.GetQuestObjectives(questID: number): Maybe<{ QuestObjectiveInfo }>
	return Maybe.of(C_QuestLog.GetQuestObjectives(questID))
end

function Wrappers.GetQuestObjectivesInto(
	reuse: Maybe<{ QuestObjectiveInfo }>,
	questID: number
): Maybe<{ QuestObjectiveInfo }>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestObjectives(questID))
end

function Wrappers.GetQuestRewardCurrencyInfo(
	questID: number,
	currencyIndex: number,
	isChoice: boolean
): Maybe<QuestRewardCurrencyInfo>
	return Maybe.of(C_QuestLog.GetQuestRewardCurrencyInfo(questID, currencyIndex, isChoice))
end

function Wrappers.GetQuestRewardCurrencyInfoInto(
	reuse: Maybe<QuestRewardCurrencyInfo>,
	questID: number,
	currencyIndex: number,
	isChoice: boolean
): Maybe<QuestRewardCurrencyInfo>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestRewardCurrencyInfo(questID, currencyIndex, isChoice))
end

function Wrappers.GetQuestTagInfo(questID: number): Maybe<QuestTagInfo>
	return Maybe.of(C_QuestLog.GetQuestTagInfo(questID))
end

function Wrappers.GetQuestTagInfoInto(reuse: Maybe<QuestTagInfo>, questID: number): Maybe<QuestTagInfo>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestTagInfo(questID))
end

function Wrappers.GetQuestType(questID: number): Maybe<number>
	return Maybe.of(C_QuestLog.GetQuestType(questID))
end

function Wrappers.GetQuestTypeInto(reuse: Maybe<number>, questID: number): Maybe<number>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestType(questID))
end

function Wrappers.GetQuestWatchType(questID: number): Maybe<Enum_QuestWatchType>
	return Maybe.of(C_QuestLog.GetQuestWatchType(questID))
end

function Wrappers.GetQuestWatchTypeInto(reuse: Maybe<Enum_QuestWatchType>, questID: number): Maybe<Enum_QuestWatchType>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestWatchType(questID))
end

function Wrappers.GetQuestsOnMap(uiMapID: number): Maybe<{ QuestPOIMapInfo }>
	return Maybe.of(C_QuestLog.GetQuestsOnMap(uiMapID))
end

function Wrappers.GetQuestsOnMapInto(reuse: Maybe<{ QuestPOIMapInfo }>, uiMapID: number): Maybe<{ QuestPOIMapInfo }>
	return Reuse.maybe(reuse, C_QuestLog.GetQuestsOnMap(uiMapID))
end

function Wrappers.GetTimeAllowed(questID: number): Maybe<GetTimeAllowedResults>
	local r1, r2 = C_QuestLog.GetTimeAllowed(questID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		totalTime = r1,
		elapsedTime = r2,
	})
end

function Wrappers.GetTimeAllowedInto(reuse: GetTimeAllowedResults, questID: number): Maybe<GetTimeAllowedResults>
	local r1, r2 = C_QuestLog.GetTimeAllowed(questID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.totalTime = r1
	fields.elapsedTime = r2
	return Reuse.just(reuse)
end

function Wrappers.GetTitleForLogIndex(questLogIndex: number): Maybe<string>
	return Maybe.of(C_QuestLog.GetTitleForLogIndex(questLogIndex))
end

function Wrappers.GetTitleForLogIndexInto(reuse: Maybe<string>, questLogIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_QuestLog.GetTitleForLogIndex(questLogIndex))
end

function Wrappers.GetTitleForQuestID(questID: number): Maybe<string>
	return Maybe.of(C_QuestLog.GetTitleForQuestID(questID))
end

function Wrappers.GetTitleForQuestIDInto(reuse: Maybe<string>, questID: number): Maybe<string>
	return Reuse.maybe(reuse, C_QuestLog.GetTitleForQuestID(questID))
end

function Wrappers.GetTitleForQuestIDAsync(questID: number): Task<string, Loads.LoadFailed>
	return Loads.load({
		api = "C_QuestLog.GetTitleForQuestID",
		event = "QUEST_DATA_LOAD_RESULT",
		key = questID,
		request = C_QuestLog.RequestLoadQuestByID,
		read = function(): Maybe<string>
			return Wrappers.GetTitleForQuestID(questID)
		end,
	})
end

function Wrappers.GetZoneStoryInfo(uiMapID: number): Maybe<GetZoneStoryInfoResults>
	local r1, r2 = C_QuestLog.GetZoneStoryInfo(uiMapID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		achievementID = r1,
		storyMapID = r2,
	})
end

function Wrappers.GetZoneStoryInfoInto(reuse: GetZoneStoryInfoResults, uiMapID: number): Maybe<GetZoneStoryInfoResults>
	local r1, r2 = C_QuestLog.GetZoneStoryInfo(uiMapID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.achievementID = r1
	fields.storyMapID = r2
	return Reuse.just(reuse)
end

function Wrappers.IsOnMap(questID: number): IsOnMapResults
	local r1, r2 = C_QuestLog.IsOnMap(questID)
	return {
		onMap = r1,
		hasLocalPOI = r2,
	}
end

function Wrappers.IsOnMapInto(reuse: IsOnMapResults, questID: number): IsOnMapResults
	local r1, r2 = C_QuestLog.IsOnMap(questID)
	local fields = Reuse.fields(reuse)
	fields.onMap = r1
	fields.hasLocalPOI = r2
	return reuse
end

function Wrappers.ReadyForTurnIn(questID: number): Maybe<boolean>
	return Maybe.of(C_QuestLog.ReadyForTurnIn(questID))
end

function Wrappers.ReadyForTurnInInto(reuse: Maybe<boolean>, questID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_QuestLog.ReadyForTurnIn(questID))
end

return Wrappers
