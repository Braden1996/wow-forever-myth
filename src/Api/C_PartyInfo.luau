--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetInstanceAbandonShutdownTimeResults = {
	read durationSeconds: number,
	read timeLeftSeconds: number,
}

export type GetInstanceAbandonVoteCooldownTimeResults = {
	read durationSeconds: number,
	read timeLeftSeconds: number,
}

export type GetInstanceAbandonVoteRequirementsResults = {
	read votesRequired: number,
	read keystoneOwnerVoteWeight: number,
}

export type GetInstanceAbandonVoteTimeResults = {
	read durationSeconds: number,
	read timeLeftSeconds: number,
}

export type GetInviteReferralInfoResults = {
	read outReferredByGuid: WOWGUID,
	read outReferredByName: string,
	read outRelationType: Enum_PartyRequestJoinRelation,
	read outIsQuickJoin: boolean,
	read outClubId: ClubId,
}

export type GetLootMethodResults = {
	read method: Enum_LootMethod,
	read masterLootPartyID: Maybe<number>,
	read masterLooterRaidID: Maybe<number>,
}

export type GetMinItemLevelResults = {
	read minItemLevel: number,
	read playerNameWithLowestItemLevel: string,
}

local Wrappers = {}

function Wrappers.DoCountdown(seconds: number): Maybe<boolean>
	return Maybe.of(C_PartyInfo.DoCountdown(seconds))
end

function Wrappers.DoCountdownInto(reuse: Maybe<boolean>, seconds: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_PartyInfo.DoCountdown(seconds))
end

function Wrappers.GetActiveCategories(): Maybe<{ number }>
	return Maybe.of(C_PartyInfo.GetActiveCategories())
end

function Wrappers.GetActiveCategoriesInto(reuse: Maybe<{ number }>): Maybe<{ number }>
	return Reuse.maybe(reuse, C_PartyInfo.GetActiveCategories())
end

function Wrappers.GetInstanceAbandonShutdownTime(): GetInstanceAbandonShutdownTimeResults
	local r1, r2 = C_PartyInfo.GetInstanceAbandonShutdownTime()
	return {
		durationSeconds = r1,
		timeLeftSeconds = r2,
	}
end

function Wrappers.GetInstanceAbandonShutdownTimeInto(
	reuse: GetInstanceAbandonShutdownTimeResults
): GetInstanceAbandonShutdownTimeResults
	local r1, r2 = C_PartyInfo.GetInstanceAbandonShutdownTime()
	local fields = Reuse.fields(reuse)
	fields.durationSeconds = r1
	fields.timeLeftSeconds = r2
	return reuse
end

function Wrappers.GetInstanceAbandonVoteCooldownTime(): Maybe<GetInstanceAbandonVoteCooldownTimeResults>
	local r1, r2 = C_PartyInfo.GetInstanceAbandonVoteCooldownTime()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		durationSeconds = r1,
		timeLeftSeconds = r2,
	})
end

function Wrappers.GetInstanceAbandonVoteCooldownTimeInto(
	reuse: GetInstanceAbandonVoteCooldownTimeResults
): Maybe<GetInstanceAbandonVoteCooldownTimeResults>
	local r1, r2 = C_PartyInfo.GetInstanceAbandonVoteCooldownTime()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.durationSeconds = r1
	fields.timeLeftSeconds = r2
	return Reuse.just(reuse)
end

function Wrappers.GetInstanceAbandonVoteRequirements(): GetInstanceAbandonVoteRequirementsResults
	local r1, r2 = C_PartyInfo.GetInstanceAbandonVoteRequirements()
	return {
		votesRequired = r1,
		keystoneOwnerVoteWeight = r2,
	}
end

function Wrappers.GetInstanceAbandonVoteRequirementsInto(
	reuse: GetInstanceAbandonVoteRequirementsResults
): GetInstanceAbandonVoteRequirementsResults
	local r1, r2 = C_PartyInfo.GetInstanceAbandonVoteRequirements()
	local fields = Reuse.fields(reuse)
	fields.votesRequired = r1
	fields.keystoneOwnerVoteWeight = r2
	return reuse
end

function Wrappers.GetInstanceAbandonVoteResponse(): Maybe<boolean>
	return Maybe.of(C_PartyInfo.GetInstanceAbandonVoteResponse())
end

function Wrappers.GetInstanceAbandonVoteResponseInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_PartyInfo.GetInstanceAbandonVoteResponse())
end

function Wrappers.GetInstanceAbandonVoteTime(): GetInstanceAbandonVoteTimeResults
	local r1, r2 = C_PartyInfo.GetInstanceAbandonVoteTime()
	return {
		durationSeconds = r1,
		timeLeftSeconds = r2,
	}
end

function Wrappers.GetInstanceAbandonVoteTimeInto(
	reuse: GetInstanceAbandonVoteTimeResults
): GetInstanceAbandonVoteTimeResults
	local r1, r2 = C_PartyInfo.GetInstanceAbandonVoteTime()
	local fields = Reuse.fields(reuse)
	fields.durationSeconds = r1
	fields.timeLeftSeconds = r2
	return reuse
end

function Wrappers.GetInviteConfirmationInvalidQueues(inviteGUID: WOWGUID): Maybe<{ QueueSpecificInfo }>
	return Maybe.of(C_PartyInfo.GetInviteConfirmationInvalidQueues(inviteGUID))
end

function Wrappers.GetInviteConfirmationInvalidQueuesInto(
	reuse: Maybe<{ QueueSpecificInfo }>,
	inviteGUID: WOWGUID
): Maybe<{ QueueSpecificInfo }>
	return Reuse.maybe(reuse, C_PartyInfo.GetInviteConfirmationInvalidQueues(inviteGUID))
end

function Wrappers.GetInviteReferralInfo(inviteGUID: WOWGUID): Maybe<GetInviteReferralInfoResults>
	local r1, r2, r3, r4, r5 = C_PartyInfo.GetInviteReferralInfo(inviteGUID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		outReferredByGuid = r1,
		outReferredByName = r2,
		outRelationType = r3,
		outIsQuickJoin = r4,
		outClubId = r5,
	})
end

function Wrappers.GetInviteReferralInfoInto(
	reuse: GetInviteReferralInfoResults,
	inviteGUID: WOWGUID
): Maybe<GetInviteReferralInfoResults>
	local r1, r2, r3, r4, r5 = C_PartyInfo.GetInviteReferralInfo(inviteGUID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.outReferredByGuid = r1
	fields.outReferredByName = r2
	fields.outRelationType = r3
	fields.outIsQuickJoin = r4
	fields.outClubId = r5
	return Reuse.just(reuse)
end

function Wrappers.GetLootMethod(): GetLootMethodResults
	local r1, r2, r3 = C_PartyInfo.GetLootMethod()
	return {
		method = r1,
		masterLootPartyID = Maybe.of(r2),
		masterLooterRaidID = Maybe.of(r3),
	}
end

function Wrappers.GetLootMethodInto(reuse: GetLootMethodResults): GetLootMethodResults
	local r1, r2, r3 = C_PartyInfo.GetLootMethod()
	local fields = Reuse.fields(reuse)
	fields.method = r1
	fields.masterLootPartyID = Reuse.maybe(fields.masterLootPartyID, r2)
	fields.masterLooterRaidID = Reuse.maybe(fields.masterLooterRaidID, r3)
	return reuse
end

function Wrappers.GetMinItemLevel(avgItemLevelCategory: Enum_AvgItemLevelCategories): GetMinItemLevelResults
	local r1, r2 = C_PartyInfo.GetMinItemLevel(avgItemLevelCategory)
	return {
		minItemLevel = r1,
		playerNameWithLowestItemLevel = r2,
	}
end

function Wrappers.GetMinItemLevelInto(
	reuse: GetMinItemLevelResults,
	avgItemLevelCategory: Enum_AvgItemLevelCategories
): GetMinItemLevelResults
	local r1, r2 = C_PartyInfo.GetMinItemLevel(avgItemLevelCategory)
	local fields = Reuse.fields(reuse)
	fields.minItemLevel = r1
	fields.playerNameWithLowestItemLevel = r2
	return reuse
end

function Wrappers.SetEveryoneIsAssistant(isAssistant: boolean): Maybe<boolean>
	return Maybe.of(C_PartyInfo.SetEveryoneIsAssistant(isAssistant))
end

function Wrappers.SetEveryoneIsAssistantInto(reuse: Maybe<boolean>, isAssistant: boolean): Maybe<boolean>
	return Reuse.maybe(reuse, C_PartyInfo.SetEveryoneIsAssistant(isAssistant))
end

function Wrappers.SetLootMethod(method: Enum_LootMethod, lootMaster: string?): Maybe<boolean>
	return Maybe.of(C_PartyInfo.SetLootMethod(method, lootMaster))
end

function Wrappers.SetLootMethodInto(reuse: Maybe<boolean>, method: Enum_LootMethod, lootMaster: string?): Maybe<boolean>
	return Reuse.maybe(reuse, C_PartyInfo.SetLootMethod(method, lootMaster))
end

return Wrappers
