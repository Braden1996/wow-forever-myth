--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type CanSummonFriendResults = {
	read canSummon: boolean,
	read reason: Enum_RecruitAFriendFailure,
}

export type GetRecruitInfoResults = {
	read active: boolean,
	read faction: number,
}

export type GetSummonFriendCooldownResults = {
	read startTimeSeconds: number,
	read durationSeconds: number,
	read enableCooldownTimer: boolean,
}

local Wrappers = {}

function Wrappers.CanSummonFriend(guid: WOWGUID): Maybe<CanSummonFriendResults>
	local r1, r2 = C_RecruitAFriend.CanSummonFriend(guid)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		canSummon = r1,
		reason = r2,
	})
end

function Wrappers.CanSummonFriendInto(reuse: CanSummonFriendResults, guid: WOWGUID): Maybe<CanSummonFriendResults>
	local r1, r2 = C_RecruitAFriend.CanSummonFriend(guid)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.canSummon = r1
	fields.reason = r2
	return Reuse.just(reuse)
end

function Wrappers.ClaimActivityReward(activityID: number, acceptanceID: RecruitAcceptanceID): Maybe<boolean>
	return Maybe.of(C_RecruitAFriend.ClaimActivityReward(activityID, acceptanceID))
end

function Wrappers.ClaimActivityRewardInto(
	reuse: Maybe<boolean>,
	activityID: number,
	acceptanceID: RecruitAcceptanceID
): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecruitAFriend.ClaimActivityReward(activityID, acceptanceID))
end

function Wrappers.ClaimNextReward(rafVersion: Enum_RecruitAFriendRewardsVersion?): Maybe<boolean>
	return Maybe.of(C_RecruitAFriend.ClaimNextReward(rafVersion))
end

function Wrappers.ClaimNextRewardInto(
	reuse: Maybe<boolean>,
	rafVersion: Enum_RecruitAFriendRewardsVersion?
): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecruitAFriend.ClaimNextReward(rafVersion))
end

function Wrappers.GenerateRecruitmentLink(): Maybe<boolean>
	return Maybe.of(C_RecruitAFriend.GenerateRecruitmentLink())
end

function Wrappers.GenerateRecruitmentLinkInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecruitAFriend.GenerateRecruitmentLink())
end

function Wrappers.GetRecruitInfo(): GetRecruitInfoResults
	local r1, r2 = C_RecruitAFriend.GetRecruitInfo()
	return {
		active = r1,
		faction = r2,
	}
end

function Wrappers.GetRecruitInfoInto(reuse: GetRecruitInfoResults): GetRecruitInfoResults
	local r1, r2 = C_RecruitAFriend.GetRecruitInfo()
	local fields = Reuse.fields(reuse)
	fields.active = r1
	fields.faction = r2
	return reuse
end

function Wrappers.GetSummonFriendCooldown(): GetSummonFriendCooldownResults
	local r1, r2, r3 = C_RecruitAFriend.GetSummonFriendCooldown()
	return {
		startTimeSeconds = r1,
		durationSeconds = r2,
		enableCooldownTimer = r3,
	}
end

function Wrappers.GetSummonFriendCooldownInto(reuse: GetSummonFriendCooldownResults): GetSummonFriendCooldownResults
	local r1, r2, r3 = C_RecruitAFriend.GetSummonFriendCooldown()
	local fields = Reuse.fields(reuse)
	fields.startTimeSeconds = r1
	fields.durationSeconds = r2
	fields.enableCooldownTimer = r3
	return reuse
end

function Wrappers.RemoveRAFRecruit(wowAccountGUID: WOWGUID): Maybe<boolean>
	return Maybe.of(C_RecruitAFriend.RemoveRAFRecruit(wowAccountGUID))
end

function Wrappers.RemoveRAFRecruitInto(reuse: Maybe<boolean>, wowAccountGUID: WOWGUID): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecruitAFriend.RemoveRAFRecruit(wowAccountGUID))
end

function Wrappers.RequestUpdatedRecruitmentInfo(): Maybe<boolean>
	return Maybe.of(C_RecruitAFriend.RequestUpdatedRecruitmentInfo())
end

function Wrappers.RequestUpdatedRecruitmentInfoInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecruitAFriend.RequestUpdatedRecruitmentInfo())
end

return Wrappers
