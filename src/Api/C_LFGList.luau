--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetActivityGroupInfoResults = {
	read name: string,
	read orderIndex: number,
}

export type GetApplicantMemberInfoResults = {
	read name: string,
	read class: string,
	read localizedClass: string,
	read level: number,
	read itemLevel: number,
	read honorLevel: number,
	read tank: boolean,
	read healer: boolean,
	read damage: boolean,
	read assignedRole: string,
	read relationship: Maybe<boolean>,
	read dungeonScore: number,
	read pvpItemLevel: number,
	read factionGroup: unknown,
	read raceID: number,
	read specID: number,
	read isLeaver: boolean,
}

export type GetFilteredSearchResultsResults = {
	read totalResultsFound: number,
	read filteredResults: { number },
}

export type GetGroupLeaverCountsByRoleResults = {
	read tankLeavers: number,
	read healerLeavers: number,
	read damageLeavers: number,
}

export type GetOwnedKeystoneActivityAndGroupAndLevelResults = {
	read activityID: number,
	read groupID: number,
	read keystoneLevel: number,
}

export type GetSearchResultFriendsResults = {
	read bnetFriends: { string },
	read charFriends: { string },
	read guildMates: { string },
}

export type GetSearchResultsResults = {
	read totalResultsFound: number,
	read results: { number },
}

local Wrappers = {}

function Wrappers.CreateListing(createData: LfgListingCreateData): Maybe<boolean>
	return Maybe.of(C_LFGList.CreateListing(createData))
end

function Wrappers.CreateListingInto(reuse: Maybe<boolean>, createData: LfgListingCreateData): Maybe<boolean>
	return Reuse.maybe(reuse, C_LFGList.CreateListing(createData))
end

function Wrappers.GetActiveEntryInfo(): Maybe<LfgEntryData>
	return Maybe.of(C_LFGList.GetActiveEntryInfo())
end

function Wrappers.GetActiveEntryInfoInto(reuse: Maybe<LfgEntryData>): Maybe<LfgEntryData>
	return Reuse.maybe(reuse, C_LFGList.GetActiveEntryInfo())
end

function Wrappers.GetActivityGroupInfo(groupID: number): Maybe<GetActivityGroupInfoResults>
	local r1, r2 = C_LFGList.GetActivityGroupInfo(groupID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		orderIndex = r2,
	})
end

function Wrappers.GetActivityGroupInfoInto(
	reuse: GetActivityGroupInfoResults,
	groupID: number
): Maybe<GetActivityGroupInfoResults>
	local r1, r2 = C_LFGList.GetActivityGroupInfo(groupID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.orderIndex = r2
	return Reuse.just(reuse)
end

function Wrappers.GetActivityInfoTable(
	activityID: number,
	questID: number?,
	showWarmode: boolean?
): Maybe<GroupFinderActivityInfo>
	return Maybe.of(C_LFGList.GetActivityInfoTable(activityID, questID, showWarmode))
end

function Wrappers.GetActivityInfoTableInto(
	reuse: Maybe<GroupFinderActivityInfo>,
	activityID: number,
	questID: number?,
	showWarmode: boolean?
): Maybe<GroupFinderActivityInfo>
	return Reuse.maybe(reuse, C_LFGList.GetActivityInfoTable(activityID, questID, showWarmode))
end

function Wrappers.GetApplicantBestDungeonScore(localID: number, applicantIndex: number): Maybe<BestDungeonScoreMapInfo>
	return Maybe.of(C_LFGList.GetApplicantBestDungeonScore(localID, applicantIndex))
end

function Wrappers.GetApplicantBestDungeonScoreInto(
	reuse: Maybe<BestDungeonScoreMapInfo>,
	localID: number,
	applicantIndex: number
): Maybe<BestDungeonScoreMapInfo>
	return Reuse.maybe(reuse, C_LFGList.GetApplicantBestDungeonScore(localID, applicantIndex))
end

function Wrappers.GetApplicantDungeonScoreForListing(
	localID: number,
	applicantIndex: number,
	activityID: number
): Maybe<BestDungeonScoreMapInfo>
	return Maybe.of(C_LFGList.GetApplicantDungeonScoreForListing(localID, applicantIndex, activityID))
end

function Wrappers.GetApplicantDungeonScoreForListingInto(
	reuse: Maybe<BestDungeonScoreMapInfo>,
	localID: number,
	applicantIndex: number,
	activityID: number
): Maybe<BestDungeonScoreMapInfo>
	return Reuse.maybe(reuse, C_LFGList.GetApplicantDungeonScoreForListing(localID, applicantIndex, activityID))
end

function Wrappers.GetApplicantInfo(applicantID: number): Maybe<LfgApplicantData>
	return Maybe.of(C_LFGList.GetApplicantInfo(applicantID))
end

function Wrappers.GetApplicantInfoInto(reuse: Maybe<LfgApplicantData>, applicantID: number): Maybe<LfgApplicantData>
	return Reuse.maybe(reuse, C_LFGList.GetApplicantInfo(applicantID))
end

function Wrappers.GetApplicantMemberInfo(applicantID: number, memberIndex: number): GetApplicantMemberInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 =
		C_LFGList.GetApplicantMemberInfo(applicantID, memberIndex)
	return {
		name = r1,
		class = r2,
		localizedClass = r3,
		level = r4,
		itemLevel = r5,
		honorLevel = r6,
		tank = r7,
		healer = r8,
		damage = r9,
		assignedRole = r10,
		relationship = Maybe.of(r11),
		dungeonScore = r12,
		pvpItemLevel = r13,
		factionGroup = r14,
		raceID = r15,
		specID = r16,
		isLeaver = r17,
	}
end

function Wrappers.GetApplicantMemberInfoInto(
	reuse: GetApplicantMemberInfoResults,
	applicantID: number,
	memberIndex: number
): GetApplicantMemberInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 =
		C_LFGList.GetApplicantMemberInfo(applicantID, memberIndex)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.class = r2
	fields.localizedClass = r3
	fields.level = r4
	fields.itemLevel = r5
	fields.honorLevel = r6
	fields.tank = r7
	fields.healer = r8
	fields.damage = r9
	fields.assignedRole = r10
	fields.relationship = Reuse.maybe(fields.relationship, r11)
	fields.dungeonScore = r12
	fields.pvpItemLevel = r13
	fields.factionGroup = r14
	fields.raceID = r15
	fields.specID = r16
	fields.isLeaver = r17
	return reuse
end

function Wrappers.GetApplicantPvpRatingInfoForListing(
	localID: number,
	applicantIndex: number,
	activityID: number
): Maybe<PvpRatingInfo>
	return Maybe.of(C_LFGList.GetApplicantPvpRatingInfoForListing(localID, applicantIndex, activityID))
end

function Wrappers.GetApplicantPvpRatingInfoForListingInto(
	reuse: Maybe<PvpRatingInfo>,
	localID: number,
	applicantIndex: number,
	activityID: number
): Maybe<PvpRatingInfo>
	return Reuse.maybe(reuse, C_LFGList.GetApplicantPvpRatingInfoForListing(localID, applicantIndex, activityID))
end

function Wrappers.GetFilteredSearchResults(): GetFilteredSearchResultsResults
	local r1, r2 = C_LFGList.GetFilteredSearchResults()
	return {
		totalResultsFound = r1,
		filteredResults = r2,
	}
end

function Wrappers.GetFilteredSearchResultsInto(reuse: GetFilteredSearchResultsResults): GetFilteredSearchResultsResults
	local r1, r2 = C_LFGList.GetFilteredSearchResults()
	local fields = Reuse.fields(reuse)
	fields.totalResultsFound = r1
	fields.filteredResults = r2
	return reuse
end

function Wrappers.GetGroupLeaverCountsByRole(): GetGroupLeaverCountsByRoleResults
	local r1, r2, r3 = C_LFGList.GetGroupLeaverCountsByRole()
	return {
		tankLeavers = r1,
		healerLeavers = r2,
		damageLeavers = r3,
	}
end

function Wrappers.GetGroupLeaverCountsByRoleInto(
	reuse: GetGroupLeaverCountsByRoleResults
): GetGroupLeaverCountsByRoleResults
	local r1, r2, r3 = C_LFGList.GetGroupLeaverCountsByRole()
	local fields = Reuse.fields(reuse)
	fields.tankLeavers = r1
	fields.healerLeavers = r2
	fields.damageLeavers = r3
	return reuse
end

function Wrappers.GetKeystoneForActivity(activityID: number): Maybe<number>
	return Maybe.of(C_LFGList.GetKeystoneForActivity(activityID))
end

function Wrappers.GetKeystoneForActivityInto(reuse: Maybe<number>, activityID: number): Maybe<number>
	return Reuse.maybe(reuse, C_LFGList.GetKeystoneForActivity(activityID))
end

function Wrappers.GetLfgCategoryInfo(categoryID: number): Maybe<LfgCategoryData>
	return Maybe.of(C_LFGList.GetLfgCategoryInfo(categoryID))
end

function Wrappers.GetLfgCategoryInfoInto(reuse: Maybe<LfgCategoryData>, categoryID: number): Maybe<LfgCategoryData>
	return Reuse.maybe(reuse, C_LFGList.GetLfgCategoryInfo(categoryID))
end

function Wrappers.GetOwnedKeystoneActivityAndGroupAndLevel(
	getTimewalking: boolean?
): Maybe<GetOwnedKeystoneActivityAndGroupAndLevelResults>
	local r1, r2, r3 = C_LFGList.GetOwnedKeystoneActivityAndGroupAndLevel(getTimewalking)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		activityID = r1,
		groupID = r2,
		keystoneLevel = r3,
	})
end

function Wrappers.GetOwnedKeystoneActivityAndGroupAndLevelInto(
	reuse: GetOwnedKeystoneActivityAndGroupAndLevelResults,
	getTimewalking: boolean?
): Maybe<GetOwnedKeystoneActivityAndGroupAndLevelResults>
	local r1, r2, r3 = C_LFGList.GetOwnedKeystoneActivityAndGroupAndLevel(getTimewalking)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.activityID = r1
	fields.groupID = r2
	fields.keystoneLevel = r3
	return Reuse.just(reuse)
end

function Wrappers.GetSearchResultFriends(searchResultID: number): GetSearchResultFriendsResults
	local r1, r2, r3 = C_LFGList.GetSearchResultFriends(searchResultID)
	return {
		bnetFriends = r1,
		charFriends = r2,
		guildMates = r3,
	}
end

function Wrappers.GetSearchResultFriendsInto(
	reuse: GetSearchResultFriendsResults,
	searchResultID: number
): GetSearchResultFriendsResults
	local r1, r2, r3 = C_LFGList.GetSearchResultFriends(searchResultID)
	local fields = Reuse.fields(reuse)
	fields.bnetFriends = r1
	fields.charFriends = r2
	fields.guildMates = r3
	return reuse
end

function Wrappers.GetSearchResultInfo(searchResultID: number): Maybe<LfgSearchResultData>
	return Maybe.of(C_LFGList.GetSearchResultInfo(searchResultID))
end

function Wrappers.GetSearchResultInfoInto(
	reuse: Maybe<LfgSearchResultData>,
	searchResultID: number
): Maybe<LfgSearchResultData>
	return Reuse.maybe(reuse, C_LFGList.GetSearchResultInfo(searchResultID))
end

function Wrappers.GetSearchResultLeaderInfo(searchResultID: number): Maybe<LfgSearchResultPlayerInfo>
	return Maybe.of(C_LFGList.GetSearchResultLeaderInfo(searchResultID))
end

function Wrappers.GetSearchResultLeaderInfoInto(
	reuse: Maybe<LfgSearchResultPlayerInfo>,
	searchResultID: number
): Maybe<LfgSearchResultPlayerInfo>
	return Reuse.maybe(reuse, C_LFGList.GetSearchResultLeaderInfo(searchResultID))
end

function Wrappers.GetSearchResultPlayerInfo(
	searchResultID: number,
	memberIndex: number
): Maybe<LfgSearchResultPlayerInfo>
	return Maybe.of(C_LFGList.GetSearchResultPlayerInfo(searchResultID, memberIndex))
end

function Wrappers.GetSearchResultPlayerInfoInto(
	reuse: Maybe<LfgSearchResultPlayerInfo>,
	searchResultID: number,
	memberIndex: number
): Maybe<LfgSearchResultPlayerInfo>
	return Reuse.maybe(reuse, C_LFGList.GetSearchResultPlayerInfo(searchResultID, memberIndex))
end

function Wrappers.GetSearchResults(): GetSearchResultsResults
	local r1, r2 = C_LFGList.GetSearchResults()
	return {
		totalResultsFound = r1,
		results = r2,
	}
end

function Wrappers.GetSearchResultsInto(reuse: GetSearchResultsResults): GetSearchResultsResults
	local r1, r2 = C_LFGList.GetSearchResults()
	local fields = Reuse.fields(reuse)
	fields.totalResultsFound = r1
	fields.results = r2
	return reuse
end

function Wrappers.UpdateListing(createData: LfgListingCreateData): Maybe<boolean>
	return Maybe.of(C_LFGList.UpdateListing(createData))
end

function Wrappers.UpdateListingInto(reuse: Maybe<boolean>, createData: LfgListingCreateData): Maybe<boolean>
	return Reuse.maybe(reuse, C_LFGList.UpdateListing(createData))
end

return Wrappers
