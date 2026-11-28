--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetClubFinderDisableReason(): Maybe<Enum_ClubFinderDisableReason>
	return Maybe.of(C_ClubFinder.GetClubFinderDisableReason())
end

function Wrappers.GetClubFinderDisableReasonInto(
	reuse: Maybe<Enum_ClubFinderDisableReason>
): Maybe<Enum_ClubFinderDisableReason>
	return Reuse.maybe(reuse, C_ClubFinder.GetClubFinderDisableReason())
end

function Wrappers.GetClubTypeFromFinderGUID(clubFinderGUID: WOWGUID): Maybe<Enum_ClubFinderRequestType>
	return Maybe.of(C_ClubFinder.GetClubTypeFromFinderGUID(clubFinderGUID))
end

function Wrappers.GetClubTypeFromFinderGUIDInto(
	reuse: Maybe<Enum_ClubFinderRequestType>,
	clubFinderGUID: WOWGUID
): Maybe<Enum_ClubFinderRequestType>
	return Reuse.maybe(reuse, C_ClubFinder.GetClubTypeFromFinderGUID(clubFinderGUID))
end

function Wrappers.GetPostingIDFromClubFinderGUID(clubFinderGUID: WOWGUID): Maybe<number>
	return Maybe.of(C_ClubFinder.GetPostingIDFromClubFinderGUID(clubFinderGUID))
end

function Wrappers.GetPostingIDFromClubFinderGUIDInto(reuse: Maybe<number>, clubFinderGUID: WOWGUID): Maybe<number>
	return Reuse.maybe(reuse, C_ClubFinder.GetPostingIDFromClubFinderGUID(clubFinderGUID))
end

function Wrappers.GetRecruitingClubInfoFromClubID(clubId: ClubId): Maybe<RecruitingClubInfo>
	return Maybe.of(C_ClubFinder.GetRecruitingClubInfoFromClubID(clubId))
end

function Wrappers.GetRecruitingClubInfoFromClubIDInto(
	reuse: Maybe<RecruitingClubInfo>,
	clubId: ClubId
): Maybe<RecruitingClubInfo>
	return Reuse.maybe(reuse, C_ClubFinder.GetRecruitingClubInfoFromClubID(clubId))
end

function Wrappers.PlayerGetClubInvitationList(): Maybe<{ RecruitingClubInfo }>
	return Maybe.of(C_ClubFinder.PlayerGetClubInvitationList())
end

function Wrappers.PlayerGetClubInvitationListInto(reuse: Maybe<{ RecruitingClubInfo }>): Maybe<{ RecruitingClubInfo }>
	return Reuse.maybe(reuse, C_ClubFinder.PlayerGetClubInvitationList())
end

function Wrappers.PostClub(
	clubId: ClubId,
	itemLevelRequirement: number,
	name: string,
	description: string,
	avatarId: number,
	specs: { number },
	type: Enum_ClubFinderRequestType,
	crossFaction: boolean?
): Maybe<boolean>
	return Maybe.of(
		C_ClubFinder.PostClub(clubId, itemLevelRequirement, name, description, avatarId, specs, type, crossFaction)
	)
end

function Wrappers.PostClubInto(
	reuse: Maybe<boolean>,
	clubId: ClubId,
	itemLevelRequirement: number,
	name: string,
	description: string,
	avatarId: number,
	specs: { number },
	type: Enum_ClubFinderRequestType,
	crossFaction: boolean?
): Maybe<boolean>
	return Reuse.maybe(
		reuse,
		C_ClubFinder.PostClub(clubId, itemLevelRequirement, name, description, avatarId, specs, type, crossFaction)
	)
end

return Wrappers
