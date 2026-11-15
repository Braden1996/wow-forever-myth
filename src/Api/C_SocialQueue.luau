--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetGroupForPlayerResults = {
	read groupGUID: WOWGUID,
	read isSoloQueueParty: boolean,
}

export type GetGroupInfoResults = {
	read canJoin: boolean,
	read numQueues: number,
	read needTank: boolean,
	read needHealer: boolean,
	read needDamage: boolean,
	read isSoloQueueParty: boolean,
	read questSessionActive: boolean,
	read leaderGUID: WOWGUID,
}

local Wrappers = {}

function Wrappers.GetConfig(): Maybe<SocialQueueConfig>
	return Maybe.of(C_SocialQueue.GetConfig())
end

function Wrappers.GetConfigInto(reuse: Maybe<SocialQueueConfig>): Maybe<SocialQueueConfig>
	return Reuse.maybe(reuse, C_SocialQueue.GetConfig())
end

function Wrappers.GetGroupForPlayer(playerGUID: WOWGUID): Maybe<GetGroupForPlayerResults>
	local r1, r2 = C_SocialQueue.GetGroupForPlayer(playerGUID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		groupGUID = r1,
		isSoloQueueParty = r2,
	})
end

function Wrappers.GetGroupForPlayerInto(
	reuse: GetGroupForPlayerResults,
	playerGUID: WOWGUID
): Maybe<GetGroupForPlayerResults>
	local r1, r2 = C_SocialQueue.GetGroupForPlayer(playerGUID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.groupGUID = r1
	fields.isSoloQueueParty = r2
	return Reuse.just(reuse)
end

function Wrappers.GetGroupInfo(groupGUID: WOWGUID): Maybe<GetGroupInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_SocialQueue.GetGroupInfo(groupGUID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		canJoin = r1,
		numQueues = r2,
		needTank = r3,
		needHealer = r4,
		needDamage = r5,
		isSoloQueueParty = r6,
		questSessionActive = r7,
		leaderGUID = r8,
	})
end

function Wrappers.GetGroupInfoInto(reuse: GetGroupInfoResults, groupGUID: WOWGUID): Maybe<GetGroupInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_SocialQueue.GetGroupInfo(groupGUID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.canJoin = r1
	fields.numQueues = r2
	fields.needTank = r3
	fields.needHealer = r4
	fields.needDamage = r5
	fields.isSoloQueueParty = r6
	fields.questSessionActive = r7
	fields.leaderGUID = r8
	return Reuse.just(reuse)
end

function Wrappers.GetGroupMembers(groupGUID: WOWGUID): Maybe<{ SocialQueuePlayerInfo }>
	return Maybe.of(C_SocialQueue.GetGroupMembers(groupGUID))
end

function Wrappers.GetGroupMembersInto(
	reuse: Maybe<{ SocialQueuePlayerInfo }>,
	groupGUID: WOWGUID
): Maybe<{ SocialQueuePlayerInfo }>
	return Reuse.maybe(reuse, C_SocialQueue.GetGroupMembers(groupGUID))
end

function Wrappers.GetGroupQueues(groupGUID: WOWGUID): Maybe<{ SocialQueueGroupQueueInfo }>
	return Maybe.of(C_SocialQueue.GetGroupQueues(groupGUID))
end

function Wrappers.GetGroupQueuesInto(
	reuse: Maybe<{ SocialQueueGroupQueueInfo }>,
	groupGUID: WOWGUID
): Maybe<{ SocialQueueGroupQueueInfo }>
	return Reuse.maybe(reuse, C_SocialQueue.GetGroupQueues(groupGUID))
end

return Wrappers
