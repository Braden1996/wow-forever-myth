--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetFactionParagonInfoResults = {
	read currentValue: number,
	read threshold: number,
	read rewardQuestID: number,
	read hasRewardPending: boolean,
	read tooLowLevelForParagon: boolean,
	read paragonStorageLevel: number,
}

local Wrappers = {}

function Wrappers.GetFactionDataByID(factionID: number): Maybe<FactionData>
	return Maybe.of(C_Reputation.GetFactionDataByID(factionID))
end

function Wrappers.GetFactionDataByIDInto(reuse: Maybe<FactionData>, factionID: number): Maybe<FactionData>
	return Reuse.maybe(reuse, C_Reputation.GetFactionDataByID(factionID))
end

function Wrappers.GetFactionDataByIndex(factionSortIndex: number): Maybe<FactionData>
	return Maybe.of(C_Reputation.GetFactionDataByIndex(factionSortIndex))
end

function Wrappers.GetFactionDataByIndexInto(reuse: Maybe<FactionData>, factionSortIndex: number): Maybe<FactionData>
	return Reuse.maybe(reuse, C_Reputation.GetFactionDataByIndex(factionSortIndex))
end

function Wrappers.GetFactionParagonInfo(factionID: number): Maybe<GetFactionParagonInfoResults>
	local r1, r2, r3, r4, r5, r6 = C_Reputation.GetFactionParagonInfo(factionID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		currentValue = r1,
		threshold = r2,
		rewardQuestID = r3,
		hasRewardPending = r4,
		tooLowLevelForParagon = r5,
		paragonStorageLevel = r6,
	})
end

function Wrappers.GetFactionParagonInfoInto(
	reuse: GetFactionParagonInfoResults,
	factionID: number
): Maybe<GetFactionParagonInfoResults>
	local r1, r2, r3, r4, r5, r6 = C_Reputation.GetFactionParagonInfo(factionID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.currentValue = r1
	fields.threshold = r2
	fields.rewardQuestID = r3
	fields.hasRewardPending = r4
	fields.tooLowLevelForParagon = r5
	fields.paragonStorageLevel = r6
	return Reuse.just(reuse)
end

function Wrappers.GetGuildFactionData(): Maybe<FactionData>
	return Maybe.of(C_Reputation.GetGuildFactionData())
end

function Wrappers.GetGuildFactionDataInto(reuse: Maybe<FactionData>): Maybe<FactionData>
	return Reuse.maybe(reuse, C_Reputation.GetGuildFactionData())
end

function Wrappers.GetGuildRepExpirationTime(): Maybe<number>
	return Maybe.of(C_Reputation.GetGuildRepExpirationTime())
end

function Wrappers.GetGuildRepExpirationTimeInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Reputation.GetGuildRepExpirationTime())
end

function Wrappers.GetWatchedFactionData(): Maybe<FactionData>
	return Maybe.of(C_Reputation.GetWatchedFactionData())
end

function Wrappers.GetWatchedFactionDataInto(reuse: Maybe<FactionData>): Maybe<FactionData>
	return Reuse.maybe(reuse, C_Reputation.GetWatchedFactionData())
end

return Wrappers
