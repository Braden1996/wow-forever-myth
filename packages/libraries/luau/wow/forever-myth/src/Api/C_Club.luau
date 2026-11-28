--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetInfoFromLastCommunityChatLineResults = {
	read messageInfo: ClubMessageInfo,
	read clubId: ClubId,
	read streamId: ClubStreamId,
	read clubType: Enum_ClubType,
}

export type GetLastTicketResponseResults = {
	read error: Enum_ClubErrorType,
	read info: Maybe<ClubInfo>,
	read showError: boolean,
}

local Wrappers = {}

function Wrappers.AreMembersReady(clubId: ClubId): Maybe<boolean>
	return Maybe.of(C_Club.AreMembersReady(clubId))
end

function Wrappers.AreMembersReadyInto(reuse: Maybe<boolean>, clubId: ClubId): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.AreMembersReady(clubId))
end

function Wrappers.CanResolvePlayerLocationFromClubMessageData(
	clubId: ClubId,
	streamId: ClubStreamId,
	epoch: BigUInteger,
	position: BigUInteger
): Maybe<boolean>
	return Maybe.of(C_Club.CanResolvePlayerLocationFromClubMessageData(clubId, streamId, epoch, position))
end

function Wrappers.CanResolvePlayerLocationFromClubMessageDataInto(
	reuse: Maybe<boolean>,
	clubId: ClubId,
	streamId: ClubStreamId,
	epoch: BigUInteger,
	position: BigUInteger
): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.CanResolvePlayerLocationFromClubMessageData(clubId, streamId, epoch, position))
end

function Wrappers.CompareBattleNetDisplayName(clubId: ClubId, lhsMemberId: number, rhsMemberId: number): Maybe<number>
	return Maybe.of(C_Club.CompareBattleNetDisplayName(clubId, lhsMemberId, rhsMemberId))
end

function Wrappers.CompareBattleNetDisplayNameInto(
	reuse: Maybe<number>,
	clubId: ClubId,
	lhsMemberId: number,
	rhsMemberId: number
): Maybe<number>
	return Reuse.maybe(reuse, C_Club.CompareBattleNetDisplayName(clubId, lhsMemberId, rhsMemberId))
end

function Wrappers.DoesAnyCommunityHaveUnreadMessages(): Maybe<boolean>
	return Maybe.of(C_Club.DoesAnyCommunityHaveUnreadMessages())
end

function Wrappers.DoesAnyCommunityHaveUnreadMessagesInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.DoesAnyCommunityHaveUnreadMessages())
end

function Wrappers.DoesCommunityHaveMembersOfTheOppositeFaction(clubId: ClubId): Maybe<boolean>
	return Maybe.of(C_Club.DoesCommunityHaveMembersOfTheOppositeFaction(clubId))
end

function Wrappers.DoesCommunityHaveMembersOfTheOppositeFactionInto(
	reuse: Maybe<boolean>,
	clubId: ClubId
): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.DoesCommunityHaveMembersOfTheOppositeFaction(clubId))
end

function Wrappers.FocusStream(clubId: ClubId, streamId: ClubStreamId): Maybe<boolean>
	return Maybe.of(C_Club.FocusStream(clubId, streamId))
end

function Wrappers.FocusStreamInto(reuse: Maybe<boolean>, clubId: ClubId, streamId: ClubStreamId): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.FocusStream(clubId, streamId))
end

function Wrappers.GetAssignableRoles(clubId: ClubId, memberId: number): Maybe<{ Enum_ClubRoleIdentifier }>
	return Maybe.of(C_Club.GetAssignableRoles(clubId, memberId))
end

function Wrappers.GetAssignableRolesInto(
	reuse: Maybe<{ Enum_ClubRoleIdentifier }>,
	clubId: ClubId,
	memberId: number
): Maybe<{ Enum_ClubRoleIdentifier }>
	return Reuse.maybe(reuse, C_Club.GetAssignableRoles(clubId, memberId))
end

function Wrappers.GetAvatarIdList(clubType: Enum_ClubType): Maybe<{ number }>
	return Maybe.of(C_Club.GetAvatarIdList(clubType))
end

function Wrappers.GetAvatarIdListInto(reuse: Maybe<{ number }>, clubType: Enum_ClubType): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Club.GetAvatarIdList(clubType))
end

function Wrappers.GetClubCapacity(): Maybe<number>
	return Maybe.of(C_Club.GetClubCapacity())
end

function Wrappers.GetClubCapacityInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Club.GetClubCapacity())
end

function Wrappers.GetClubInfo(clubId: ClubId): Maybe<ClubInfo>
	return Maybe.of(C_Club.GetClubInfo(clubId))
end

function Wrappers.GetClubInfoInto(reuse: Maybe<ClubInfo>, clubId: ClubId): Maybe<ClubInfo>
	return Reuse.maybe(reuse, C_Club.GetClubInfo(clubId))
end

function Wrappers.GetClubLimits(clubType: Enum_ClubType): Maybe<ClubLimits>
	return Maybe.of(C_Club.GetClubLimits(clubType))
end

function Wrappers.GetClubLimitsInto(reuse: Maybe<ClubLimits>, clubType: Enum_ClubType): Maybe<ClubLimits>
	return Reuse.maybe(reuse, C_Club.GetClubLimits(clubType))
end

function Wrappers.GetClubMembers(clubId: ClubId, streamId: ClubStreamId?): Maybe<{ number }>
	return Maybe.of(C_Club.GetClubMembers(clubId, streamId))
end

function Wrappers.GetClubMembersInto(
	reuse: Maybe<{ number }>,
	clubId: ClubId,
	streamId: ClubStreamId?
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Club.GetClubMembers(clubId, streamId))
end

function Wrappers.GetClubPrivileges(clubId: ClubId): Maybe<ClubPrivilegeInfo>
	return Maybe.of(C_Club.GetClubPrivileges(clubId))
end

function Wrappers.GetClubPrivilegesInto(reuse: Maybe<ClubPrivilegeInfo>, clubId: ClubId): Maybe<ClubPrivilegeInfo>
	return Reuse.maybe(reuse, C_Club.GetClubPrivileges(clubId))
end

function Wrappers.GetClubStreamNotificationSettings(clubId: ClubId): Maybe<{ ClubStreamNotificationSetting }>
	return Maybe.of(C_Club.GetClubStreamNotificationSettings(clubId))
end

function Wrappers.GetClubStreamNotificationSettingsInto(
	reuse: Maybe<{ ClubStreamNotificationSetting }>,
	clubId: ClubId
): Maybe<{ ClubStreamNotificationSetting }>
	return Reuse.maybe(reuse, C_Club.GetClubStreamNotificationSettings(clubId))
end

function Wrappers.GetCommunityNameResultText(result: Enum_ValidateNameResult): Maybe<string>
	return Maybe.of(C_Club.GetCommunityNameResultText(result))
end

function Wrappers.GetCommunityNameResultTextInto(reuse: Maybe<string>, result: Enum_ValidateNameResult): Maybe<string>
	return Reuse.maybe(reuse, C_Club.GetCommunityNameResultText(result))
end

function Wrappers.GetGuildClubId(): Maybe<ClubId>
	return Maybe.of(C_Club.GetGuildClubId())
end

function Wrappers.GetGuildClubIdInto(reuse: Maybe<ClubId>): Maybe<ClubId>
	return Reuse.maybe(reuse, C_Club.GetGuildClubId())
end

function Wrappers.GetInfoFromLastCommunityChatLine(): Maybe<GetInfoFromLastCommunityChatLineResults>
	local r1, r2, r3, r4 = C_Club.GetInfoFromLastCommunityChatLine()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		messageInfo = r1,
		clubId = r2,
		streamId = r3,
		clubType = r4,
	})
end

function Wrappers.GetInfoFromLastCommunityChatLineInto(
	reuse: GetInfoFromLastCommunityChatLineResults
): Maybe<GetInfoFromLastCommunityChatLineResults>
	local r1, r2, r3, r4 = C_Club.GetInfoFromLastCommunityChatLine()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.messageInfo = r1
	fields.clubId = r2
	fields.streamId = r3
	fields.clubType = r4
	return Reuse.just(reuse)
end

function Wrappers.GetInvitationCandidates(
	filter: string?,
	maxResults: number?,
	cursorPosition: number?,
	allowFullMatch: boolean?,
	clubId: ClubId
): Maybe<{ ClubInvitationCandidateInfo }>
	return Maybe.of(C_Club.GetInvitationCandidates(filter, maxResults, cursorPosition, allowFullMatch, clubId))
end

function Wrappers.GetInvitationCandidatesInto(
	reuse: Maybe<{ ClubInvitationCandidateInfo }>,
	filter: string?,
	maxResults: number?,
	cursorPosition: number?,
	allowFullMatch: boolean?,
	clubId: ClubId
): Maybe<{ ClubInvitationCandidateInfo }>
	return Reuse.maybe(
		reuse,
		C_Club.GetInvitationCandidates(filter, maxResults, cursorPosition, allowFullMatch, clubId)
	)
end

function Wrappers.GetInvitationInfo(clubId: ClubId): Maybe<ClubSelfInvitationInfo>
	return Maybe.of(C_Club.GetInvitationInfo(clubId))
end

function Wrappers.GetInvitationInfoInto(
	reuse: Maybe<ClubSelfInvitationInfo>,
	clubId: ClubId
): Maybe<ClubSelfInvitationInfo>
	return Reuse.maybe(reuse, C_Club.GetInvitationInfo(clubId))
end

function Wrappers.GetInvitationsForClub(clubId: ClubId): Maybe<{ ClubInvitationInfo }>
	return Maybe.of(C_Club.GetInvitationsForClub(clubId))
end

function Wrappers.GetInvitationsForClubInto(
	reuse: Maybe<{ ClubInvitationInfo }>,
	clubId: ClubId
): Maybe<{ ClubInvitationInfo }>
	return Reuse.maybe(reuse, C_Club.GetInvitationsForClub(clubId))
end

function Wrappers.GetInvitationsForSelf(): Maybe<{ ClubSelfInvitationInfo }>
	return Maybe.of(C_Club.GetInvitationsForSelf())
end

function Wrappers.GetInvitationsForSelfInto(reuse: Maybe<{ ClubSelfInvitationInfo }>): Maybe<{ ClubSelfInvitationInfo }>
	return Reuse.maybe(reuse, C_Club.GetInvitationsForSelf())
end

function Wrappers.GetLastTicketResponse(ticket: string): Maybe<GetLastTicketResponseResults>
	local r1, r2, r3 = C_Club.GetLastTicketResponse(ticket)
	if r1 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		error = r1,
		info = Maybe.of(r2),
		showError = r3,
	})
end

function Wrappers.GetLastTicketResponseInto(
	reuse: GetLastTicketResponseResults,
	ticket: string
): Maybe<GetLastTicketResponseResults>
	local r1, r2, r3 = C_Club.GetLastTicketResponse(ticket)
	if r1 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.error = r1
	fields.info = Reuse.maybe(fields.info, r2)
	fields.showError = r3
	return Reuse.just(reuse)
end

function Wrappers.GetMemberInfo(clubId: ClubId, memberId: number): Maybe<ClubMemberInfo>
	return Maybe.of(C_Club.GetMemberInfo(clubId, memberId))
end

function Wrappers.GetMemberInfoInto(
	reuse: Maybe<ClubMemberInfo>,
	clubId: ClubId,
	memberId: number
): Maybe<ClubMemberInfo>
	return Reuse.maybe(reuse, C_Club.GetMemberInfo(clubId, memberId))
end

function Wrappers.GetMemberInfoForSelf(clubId: ClubId): Maybe<ClubMemberInfo>
	return Maybe.of(C_Club.GetMemberInfoForSelf(clubId))
end

function Wrappers.GetMemberInfoForSelfInto(reuse: Maybe<ClubMemberInfo>, clubId: ClubId): Maybe<ClubMemberInfo>
	return Reuse.maybe(reuse, C_Club.GetMemberInfoForSelf(clubId))
end

function Wrappers.GetMessageInfo(
	clubId: ClubId,
	streamId: ClubStreamId,
	messageId: ClubMessageIdentifier
): Maybe<ClubMessageInfo>
	return Maybe.of(C_Club.GetMessageInfo(clubId, streamId, messageId))
end

function Wrappers.GetMessageInfoInto(
	reuse: Maybe<ClubMessageInfo>,
	clubId: ClubId,
	streamId: ClubStreamId,
	messageId: ClubMessageIdentifier
): Maybe<ClubMessageInfo>
	return Reuse.maybe(reuse, C_Club.GetMessageInfo(clubId, streamId, messageId))
end

function Wrappers.GetMessageRanges(clubId: ClubId, streamId: ClubStreamId): Maybe<{ ClubMessageRange }>
	return Maybe.of(C_Club.GetMessageRanges(clubId, streamId))
end

function Wrappers.GetMessageRangesInto(
	reuse: Maybe<{ ClubMessageRange }>,
	clubId: ClubId,
	streamId: ClubStreamId
): Maybe<{ ClubMessageRange }>
	return Reuse.maybe(reuse, C_Club.GetMessageRanges(clubId, streamId))
end

function Wrappers.GetMessagesBefore(
	clubId: ClubId,
	streamId: ClubStreamId,
	newest: ClubMessageIdentifier,
	count: number
): Maybe<{ ClubMessageInfo }>
	return Maybe.of(C_Club.GetMessagesBefore(clubId, streamId, newest, count))
end

function Wrappers.GetMessagesBeforeInto(
	reuse: Maybe<{ ClubMessageInfo }>,
	clubId: ClubId,
	streamId: ClubStreamId,
	newest: ClubMessageIdentifier,
	count: number
): Maybe<{ ClubMessageInfo }>
	return Reuse.maybe(reuse, C_Club.GetMessagesBefore(clubId, streamId, newest, count))
end

function Wrappers.GetMessagesInRange(
	clubId: ClubId,
	streamId: ClubStreamId,
	oldest: ClubMessageIdentifier,
	newest: ClubMessageIdentifier
): Maybe<{ ClubMessageInfo }>
	return Maybe.of(C_Club.GetMessagesInRange(clubId, streamId, oldest, newest))
end

function Wrappers.GetMessagesInRangeInto(
	reuse: Maybe<{ ClubMessageInfo }>,
	clubId: ClubId,
	streamId: ClubStreamId,
	oldest: ClubMessageIdentifier,
	newest: ClubMessageIdentifier
): Maybe<{ ClubMessageInfo }>
	return Reuse.maybe(reuse, C_Club.GetMessagesInRange(clubId, streamId, oldest, newest))
end

function Wrappers.GetStreamInfo(clubId: ClubId, streamId: ClubStreamId): Maybe<ClubStreamInfo>
	return Maybe.of(C_Club.GetStreamInfo(clubId, streamId))
end

function Wrappers.GetStreamInfoInto(
	reuse: Maybe<ClubStreamInfo>,
	clubId: ClubId,
	streamId: ClubStreamId
): Maybe<ClubStreamInfo>
	return Reuse.maybe(reuse, C_Club.GetStreamInfo(clubId, streamId))
end

function Wrappers.GetStreamViewMarker(clubId: ClubId, streamId: ClubStreamId): Maybe<BigUInteger>
	return Maybe.of(C_Club.GetStreamViewMarker(clubId, streamId))
end

function Wrappers.GetStreamViewMarkerInto(
	reuse: Maybe<BigUInteger>,
	clubId: ClubId,
	streamId: ClubStreamId
): Maybe<BigUInteger>
	return Reuse.maybe(reuse, C_Club.GetStreamViewMarker(clubId, streamId))
end

function Wrappers.GetStreams(clubId: ClubId): Maybe<{ ClubStreamInfo }>
	return Maybe.of(C_Club.GetStreams(clubId))
end

function Wrappers.GetStreamsInto(reuse: Maybe<{ ClubStreamInfo }>, clubId: ClubId): Maybe<{ ClubStreamInfo }>
	return Reuse.maybe(reuse, C_Club.GetStreams(clubId))
end

function Wrappers.GetSubscribedClubs(): Maybe<{ ClubInfo }>
	return Maybe.of(C_Club.GetSubscribedClubs())
end

function Wrappers.GetSubscribedClubsInto(reuse: Maybe<{ ClubInfo }>): Maybe<{ ClubInfo }>
	return Reuse.maybe(reuse, C_Club.GetSubscribedClubs())
end

function Wrappers.GetTickets(clubId: ClubId): Maybe<{ ClubTicketInfo }>
	return Maybe.of(C_Club.GetTickets(clubId))
end

function Wrappers.GetTicketsInto(reuse: Maybe<{ ClubTicketInfo }>, clubId: ClubId): Maybe<{ ClubTicketInfo }>
	return Reuse.maybe(reuse, C_Club.GetTickets(clubId))
end

function Wrappers.IsAccountMuted(clubId: ClubId): Maybe<boolean>
	return Maybe.of(C_Club.IsAccountMuted(clubId))
end

function Wrappers.IsAccountMutedInto(reuse: Maybe<boolean>, clubId: ClubId): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.IsAccountMuted(clubId))
end

function Wrappers.IsBeginningOfStream(
	clubId: ClubId,
	streamId: ClubStreamId,
	messageId: ClubMessageIdentifier
): Maybe<boolean>
	return Maybe.of(C_Club.IsBeginningOfStream(clubId, streamId, messageId))
end

function Wrappers.IsBeginningOfStreamInto(
	reuse: Maybe<boolean>,
	clubId: ClubId,
	streamId: ClubStreamId,
	messageId: ClubMessageIdentifier
): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.IsBeginningOfStream(clubId, streamId, messageId))
end

function Wrappers.IsEnabled(): Maybe<boolean>
	return Maybe.of(C_Club.IsEnabled())
end

function Wrappers.IsEnabledInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.IsEnabled())
end

function Wrappers.IsRestricted(): Maybe<Enum_ClubRestrictionReason>
	return Maybe.of(C_Club.IsRestricted())
end

function Wrappers.IsRestrictedInto(reuse: Maybe<Enum_ClubRestrictionReason>): Maybe<Enum_ClubRestrictionReason>
	return Reuse.maybe(reuse, C_Club.IsRestricted())
end

function Wrappers.IsSubscribedToStream(clubId: ClubId, streamId: ClubStreamId): Maybe<boolean>
	return Maybe.of(C_Club.IsSubscribedToStream(clubId, streamId))
end

function Wrappers.IsSubscribedToStreamInto(
	reuse: Maybe<boolean>,
	clubId: ClubId,
	streamId: ClubStreamId
): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.IsSubscribedToStream(clubId, streamId))
end

function Wrappers.RequestMoreMessagesBefore(
	clubId: ClubId,
	streamId: ClubStreamId,
	messageId: ClubMessageIdentifier?,
	count: number?
): Maybe<boolean>
	return Maybe.of(C_Club.RequestMoreMessagesBefore(clubId, streamId, messageId, count))
end

function Wrappers.RequestMoreMessagesBeforeInto(
	reuse: Maybe<boolean>,
	clubId: ClubId,
	streamId: ClubStreamId,
	messageId: ClubMessageIdentifier?,
	count: number?
): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.RequestMoreMessagesBefore(clubId, streamId, messageId, count))
end

function Wrappers.ShouldAllowClubType(clubType: Enum_ClubType): Maybe<boolean>
	return Maybe.of(C_Club.ShouldAllowClubType(clubType))
end

function Wrappers.ShouldAllowClubTypeInto(reuse: Maybe<boolean>, clubType: Enum_ClubType): Maybe<boolean>
	return Reuse.maybe(reuse, C_Club.ShouldAllowClubType(clubType))
end

function Wrappers.ValidateText(
	clubType: Enum_ClubType,
	text: string,
	clubFieldType: Enum_ClubFieldType
): Maybe<Enum_ValidateNameResult>
	return Maybe.of(C_Club.ValidateText(clubType, text, clubFieldType))
end

function Wrappers.ValidateTextInto(
	reuse: Maybe<Enum_ValidateNameResult>,
	clubType: Enum_ClubType,
	text: string,
	clubFieldType: Enum_ClubFieldType
): Maybe<Enum_ValidateNameResult>
	return Reuse.maybe(reuse, C_Club.ValidateText(clubType, text, clubFieldType))
end

return Wrappers
