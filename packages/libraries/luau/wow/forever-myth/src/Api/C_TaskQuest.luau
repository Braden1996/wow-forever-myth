--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetQuestInfoByQuestIDResults = {
	read questTitle: string,
	read factionID: Maybe<number>,
	read capped: Maybe<boolean>,
	read displayAsObjective: Maybe<boolean>,
}

export type GetQuestLocationResults = {
	read locationX: number,
	read locationY: number,
}

local Wrappers = {}

function Wrappers.GetQuestInfoByQuestID(questID: number): Maybe<GetQuestInfoByQuestIDResults>
	local r1, r2, r3, r4 = C_TaskQuest.GetQuestInfoByQuestID(questID)
	if r1 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		questTitle = r1,
		factionID = Maybe.of(r2),
		capped = Maybe.of(r3),
		displayAsObjective = Maybe.of(r4),
	})
end

function Wrappers.GetQuestInfoByQuestIDInto(
	reuse: GetQuestInfoByQuestIDResults,
	questID: number
): Maybe<GetQuestInfoByQuestIDResults>
	local r1, r2, r3, r4 = C_TaskQuest.GetQuestInfoByQuestID(questID)
	if r1 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.questTitle = r1
	fields.factionID = Reuse.maybe(fields.factionID, r2)
	fields.capped = Reuse.maybe(fields.capped, r3)
	fields.displayAsObjective = Reuse.maybe(fields.displayAsObjective, r4)
	return Reuse.just(reuse)
end

function Wrappers.GetQuestLocation(questID: number, uiMapID: number): Maybe<GetQuestLocationResults>
	local r1, r2 = C_TaskQuest.GetQuestLocation(questID, uiMapID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		locationX = r1,
		locationY = r2,
	})
end

function Wrappers.GetQuestLocationInto(
	reuse: GetQuestLocationResults,
	questID: number,
	uiMapID: number
): Maybe<GetQuestLocationResults>
	local r1, r2 = C_TaskQuest.GetQuestLocation(questID, uiMapID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.locationX = r1
	fields.locationY = r2
	return Reuse.just(reuse)
end

function Wrappers.GetQuestProgressBarInfo(questID: number): Maybe<number>
	return Maybe.of(C_TaskQuest.GetQuestProgressBarInfo(questID))
end

function Wrappers.GetQuestProgressBarInfoInto(reuse: Maybe<number>, questID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TaskQuest.GetQuestProgressBarInfo(questID))
end

function Wrappers.GetQuestTimeLeftMinutes(questID: number): Maybe<number>
	return Maybe.of(C_TaskQuest.GetQuestTimeLeftMinutes(questID))
end

function Wrappers.GetQuestTimeLeftMinutesInto(reuse: Maybe<number>, questID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TaskQuest.GetQuestTimeLeftMinutes(questID))
end

function Wrappers.GetQuestTimeLeftSeconds(questID: number): Maybe<number>
	return Maybe.of(C_TaskQuest.GetQuestTimeLeftSeconds(questID))
end

function Wrappers.GetQuestTimeLeftSecondsInto(reuse: Maybe<number>, questID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TaskQuest.GetQuestTimeLeftSeconds(questID))
end

function Wrappers.GetQuestUIWidgetSetByType(questID: number, type: Enum_MapIconUIWidgetSetType): Maybe<number>
	return Maybe.of(C_TaskQuest.GetQuestUIWidgetSetByType(questID, type))
end

function Wrappers.GetQuestUIWidgetSetByTypeInto(
	reuse: Maybe<number>,
	questID: number,
	type: Enum_MapIconUIWidgetSetType
): Maybe<number>
	return Reuse.maybe(reuse, C_TaskQuest.GetQuestUIWidgetSetByType(questID, type))
end

function Wrappers.GetQuestZoneID(questID: number): Maybe<number>
	return Maybe.of(C_TaskQuest.GetQuestZoneID(questID))
end

function Wrappers.GetQuestZoneIDInto(reuse: Maybe<number>, questID: number): Maybe<number>
	return Reuse.maybe(reuse, C_TaskQuest.GetQuestZoneID(questID))
end

function Wrappers.GetQuestsOnMap(uiMapID: number): Maybe<{ QuestPOIMapInfo }>
	return Maybe.of(C_TaskQuest.GetQuestsOnMap(uiMapID))
end

function Wrappers.GetQuestsOnMapInto(reuse: Maybe<{ QuestPOIMapInfo }>, uiMapID: number): Maybe<{ QuestPOIMapInfo }>
	return Reuse.maybe(reuse, C_TaskQuest.GetQuestsOnMap(uiMapID))
end

return Wrappers
