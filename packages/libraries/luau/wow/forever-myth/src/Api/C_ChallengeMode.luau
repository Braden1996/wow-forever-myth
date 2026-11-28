--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetActiveKeystoneInfoResults = {
	read activeKeystoneLevel: number,
	read activeAffixIDs: { number },
	read wasActiveKeystoneCharged: boolean,
}

export type GetAffixInfoResults = {
	read name: string,
	read description: string,
	read filedataid: number,
}

export type GetDeathCountResults = {
	read numDeaths: number,
	read timeLost: number,
}

export type GetMapUIInfoResults = {
	read name: string,
	read id: number,
	read timeLimit: number,
	read texture: Maybe<number>,
	read backgroundTexture: number,
	read mapID: number,
}

export type GetPowerLevelDamageHealthModResults = {
	read damageMod: number,
	read healthMod: number,
}

export type GetSlottedKeystoneInfoResults = {
	read mapChallengeModeID: number,
	read affixIDs: { number },
	read keystoneLevel: number,
}

local Wrappers = {}

function Wrappers.GetActiveChallengeMapID(): Maybe<number>
	return Maybe.of(C_ChallengeMode.GetActiveChallengeMapID())
end

function Wrappers.GetActiveChallengeMapIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_ChallengeMode.GetActiveChallengeMapID())
end

function Wrappers.GetActiveKeystoneInfo(): GetActiveKeystoneInfoResults
	local r1, r2, r3 = C_ChallengeMode.GetActiveKeystoneInfo()
	return {
		activeKeystoneLevel = r1,
		activeAffixIDs = r2,
		wasActiveKeystoneCharged = r3,
	}
end

function Wrappers.GetActiveKeystoneInfoInto(reuse: GetActiveKeystoneInfoResults): GetActiveKeystoneInfoResults
	local r1, r2, r3 = C_ChallengeMode.GetActiveKeystoneInfo()
	local fields = Reuse.fields(reuse)
	fields.activeKeystoneLevel = r1
	fields.activeAffixIDs = r2
	fields.wasActiveKeystoneCharged = r3
	return reuse
end

function Wrappers.GetAffixInfo(affixID: number): Maybe<GetAffixInfoResults>
	local r1, r2, r3 = C_ChallengeMode.GetAffixInfo(affixID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		description = r2,
		filedataid = r3,
	})
end

function Wrappers.GetAffixInfoInto(reuse: GetAffixInfoResults, affixID: number): Maybe<GetAffixInfoResults>
	local r1, r2, r3 = C_ChallengeMode.GetAffixInfo(affixID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.description = r2
	fields.filedataid = r3
	return Reuse.just(reuse)
end

function Wrappers.GetDeathCount(): Maybe<GetDeathCountResults>
	local r1, r2 = C_ChallengeMode.GetDeathCount()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		numDeaths = r1,
		timeLost = r2,
	})
end

function Wrappers.GetDeathCountInto(reuse: GetDeathCountResults): Maybe<GetDeathCountResults>
	local r1, r2 = C_ChallengeMode.GetDeathCount()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.numDeaths = r1
	fields.timeLost = r2
	return Reuse.just(reuse)
end

function Wrappers.GetGuildLeaders(): Maybe<{ ChallengeModeGuildTopAttempt }>
	return Maybe.of(C_ChallengeMode.GetGuildLeaders())
end

function Wrappers.GetGuildLeadersInto(
	reuse: Maybe<{ ChallengeModeGuildTopAttempt }>
): Maybe<{ ChallengeModeGuildTopAttempt }>
	return Reuse.maybe(reuse, C_ChallengeMode.GetGuildLeaders())
end

function Wrappers.GetMapScoreInfo(): Maybe<{ MythicPlusRatingLinkInfo }>
	return Maybe.of(C_ChallengeMode.GetMapScoreInfo())
end

function Wrappers.GetMapScoreInfoInto(reuse: Maybe<{ MythicPlusRatingLinkInfo }>): Maybe<{ MythicPlusRatingLinkInfo }>
	return Reuse.maybe(reuse, C_ChallengeMode.GetMapScoreInfo())
end

function Wrappers.GetMapUIInfo(mapChallengeModeID: number): Maybe<GetMapUIInfoResults>
	local r1, r2, r3, r4, r5, r6 = C_ChallengeMode.GetMapUIInfo(mapChallengeModeID)
	if r1 == nil or r2 == nil or r3 == nil or r5 == nil or r6 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		id = r2,
		timeLimit = r3,
		texture = Maybe.of(r4),
		backgroundTexture = r5,
		mapID = r6,
	})
end

function Wrappers.GetMapUIInfoInto(reuse: GetMapUIInfoResults, mapChallengeModeID: number): Maybe<GetMapUIInfoResults>
	local r1, r2, r3, r4, r5, r6 = C_ChallengeMode.GetMapUIInfo(mapChallengeModeID)
	if r1 == nil or r2 == nil or r3 == nil or r5 == nil or r6 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.id = r2
	fields.timeLimit = r3
	fields.texture = Reuse.maybe(fields.texture, r4)
	fields.backgroundTexture = r5
	fields.mapID = r6
	return Reuse.just(reuse)
end

function Wrappers.GetPowerLevelDamageHealthMod(powerLevel: number): Maybe<GetPowerLevelDamageHealthModResults>
	local r1, r2 = C_ChallengeMode.GetPowerLevelDamageHealthMod(powerLevel)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		damageMod = r1,
		healthMod = r2,
	})
end

function Wrappers.GetPowerLevelDamageHealthModInto(
	reuse: GetPowerLevelDamageHealthModResults,
	powerLevel: number
): Maybe<GetPowerLevelDamageHealthModResults>
	local r1, r2 = C_ChallengeMode.GetPowerLevelDamageHealthMod(powerLevel)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.damageMod = r1
	fields.healthMod = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSlottedKeystoneInfo(): Maybe<GetSlottedKeystoneInfoResults>
	local r1, r2, r3 = C_ChallengeMode.GetSlottedKeystoneInfo()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		mapChallengeModeID = r1,
		affixIDs = r2,
		keystoneLevel = r3,
	})
end

function Wrappers.GetSlottedKeystoneInfoInto(reuse: GetSlottedKeystoneInfoResults): Maybe<GetSlottedKeystoneInfoResults>
	local r1, r2, r3 = C_ChallengeMode.GetSlottedKeystoneInfo()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.mapChallengeModeID = r1
	fields.affixIDs = r2
	fields.keystoneLevel = r3
	return Reuse.just(reuse)
end

return Wrappers
