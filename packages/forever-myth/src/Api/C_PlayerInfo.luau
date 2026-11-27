--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Result<T, E> = Result.Result<T, E>

export type GetAlternateFormInfoResults = {
	read hasAlternateForm: boolean,
	read inAlternateForm: boolean,
}

export type GetClassResults = {
	read className: Maybe<string>,
	read classFilename: Maybe<string>,
	read classID: Maybe<number>,
}

export type GetGlidingInfoResults = {
	read isGliding: boolean,
	read canGlide: boolean,
	read forwardSpeed: number,
}

export type IsPlayerEligibleForNPEResults = {
	read isEligible: boolean,
	read failureReason: string,
}

export type IsPlayerEligibleForNPEv2Results = {
	read isEligible: boolean,
	read failureReason: string,
}

local Wrappers = {}

function Wrappers.CanPlayerUseMountEquipment(): Result<true, string>
	local r1, r2 = C_PlayerInfo.CanPlayerUseMountEquipment()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.GetAlternateFormInfo(): GetAlternateFormInfoResults
	local r1, r2 = C_PlayerInfo.GetAlternateFormInfo()
	return {
		hasAlternateForm = r1,
		inAlternateForm = r2,
	}
end

function Wrappers.GetAlternateFormInfoInto(reuse: GetAlternateFormInfoResults): GetAlternateFormInfoResults
	local r1, r2 = C_PlayerInfo.GetAlternateFormInfo()
	local fields = Reuse.fields(reuse)
	fields.hasAlternateForm = r1
	fields.inAlternateForm = r2
	return reuse
end

function Wrappers.GetClass(playerLocation: PlayerLocationMixin): GetClassResults
	local r1, r2, r3 = C_PlayerInfo.GetClass(playerLocation)
	return {
		className = Maybe.of(r1),
		classFilename = Maybe.of(r2),
		classID = Maybe.of(r3),
	}
end

function Wrappers.GetClassInto(reuse: GetClassResults, playerLocation: PlayerLocationMixin): GetClassResults
	local r1, r2, r3 = C_PlayerInfo.GetClass(playerLocation)
	local fields = Reuse.fields(reuse)
	fields.className = Reuse.maybe(fields.className, r1)
	fields.classFilename = Reuse.maybe(fields.classFilename, r2)
	fields.classID = Reuse.maybe(fields.classID, r3)
	return reuse
end

function Wrappers.GetGlidingInfo(): GetGlidingInfoResults
	local r1, r2, r3 = C_PlayerInfo.GetGlidingInfo()
	return {
		isGliding = r1,
		canGlide = r2,
		forwardSpeed = r3,
	}
end

function Wrappers.GetGlidingInfoInto(reuse: GetGlidingInfoResults): GetGlidingInfoResults
	local r1, r2, r3 = C_PlayerInfo.GetGlidingInfo()
	local fields = Reuse.fields(reuse)
	fields.isGliding = r1
	fields.canGlide = r2
	fields.forwardSpeed = r3
	return reuse
end

function Wrappers.GetInstancesUnlockedAtLevel(level: number, isRaid: boolean): Maybe<{ number }>
	return Maybe.of(C_PlayerInfo.GetInstancesUnlockedAtLevel(level, isRaid))
end

function Wrappers.GetInstancesUnlockedAtLevelInto(
	reuse: Maybe<{ number }>,
	level: number,
	isRaid: boolean
): Maybe<{ number }>
	return Reuse.maybe(reuse, C_PlayerInfo.GetInstancesUnlockedAtLevel(level, isRaid))
end

function Wrappers.GetName(playerLocation: PlayerLocationMixin): Maybe<string>
	return Maybe.of(C_PlayerInfo.GetName(playerLocation))
end

function Wrappers.GetNameInto(reuse: Maybe<string>, playerLocation: PlayerLocationMixin): Maybe<string>
	return Reuse.maybe(reuse, C_PlayerInfo.GetName(playerLocation))
end

function Wrappers.GetPlayerCharacterData(): Maybe<PlayerInfoCharacterData>
	return Maybe.of(C_PlayerInfo.GetPlayerCharacterData())
end

function Wrappers.GetPlayerCharacterDataInto(reuse: Maybe<PlayerInfoCharacterData>): Maybe<PlayerInfoCharacterData>
	return Reuse.maybe(reuse, C_PlayerInfo.GetPlayerCharacterData())
end

function Wrappers.GetPlayerMythicPlusRatingSummary(playerToken: UnitToken): Maybe<MythicPlusRatingSummary>
	return Maybe.of(C_PlayerInfo.GetPlayerMythicPlusRatingSummary(playerToken))
end

function Wrappers.GetPlayerMythicPlusRatingSummaryInto(
	reuse: Maybe<MythicPlusRatingSummary>,
	playerToken: UnitToken
): Maybe<MythicPlusRatingSummary>
	return Reuse.maybe(reuse, C_PlayerInfo.GetPlayerMythicPlusRatingSummary(playerToken))
end

function Wrappers.GetRace(playerLocation: PlayerLocationMixin): Maybe<number>
	return Maybe.of(C_PlayerInfo.GetRace(playerLocation))
end

function Wrappers.GetRaceInto(reuse: Maybe<number>, playerLocation: PlayerLocationMixin): Maybe<number>
	return Reuse.maybe(reuse, C_PlayerInfo.GetRace(playerLocation))
end

function Wrappers.GetSex(playerLocation: PlayerLocationMixin): Maybe<Enum_UnitSex>
	return Maybe.of(C_PlayerInfo.GetSex(playerLocation))
end

function Wrappers.GetSexInto(reuse: Maybe<Enum_UnitSex>, playerLocation: PlayerLocationMixin): Maybe<Enum_UnitSex>
	return Reuse.maybe(reuse, C_PlayerInfo.GetSex(playerLocation))
end

function Wrappers.IsConnected(playerLocation: PlayerLocationMixin?): Maybe<boolean>
	return Maybe.of(C_PlayerInfo.IsConnected(playerLocation))
end

function Wrappers.IsConnectedInto(reuse: Maybe<boolean>, playerLocation: PlayerLocationMixin?): Maybe<boolean>
	return Reuse.maybe(reuse, C_PlayerInfo.IsConnected(playerLocation))
end

function Wrappers.IsPlayerEligibleForNPE(): IsPlayerEligibleForNPEResults
	local r1, r2 = C_PlayerInfo.IsPlayerEligibleForNPE()
	return {
		isEligible = r1,
		failureReason = r2,
	}
end

function Wrappers.IsPlayerEligibleForNPEInto(reuse: IsPlayerEligibleForNPEResults): IsPlayerEligibleForNPEResults
	local r1, r2 = C_PlayerInfo.IsPlayerEligibleForNPE()
	local fields = Reuse.fields(reuse)
	fields.isEligible = r1
	fields.failureReason = r2
	return reuse
end

function Wrappers.IsPlayerEligibleForNPEv2(): IsPlayerEligibleForNPEv2Results
	local r1, r2 = C_PlayerInfo.IsPlayerEligibleForNPEv2()
	return {
		isEligible = r1,
		failureReason = r2,
	}
end

function Wrappers.IsPlayerEligibleForNPEv2Into(reuse: IsPlayerEligibleForNPEv2Results): IsPlayerEligibleForNPEv2Results
	local r1, r2 = C_PlayerInfo.IsPlayerEligibleForNPEv2()
	local fields = Reuse.fields(reuse)
	fields.isEligible = r1
	fields.failureReason = r2
	return reuse
end

return Wrappers
