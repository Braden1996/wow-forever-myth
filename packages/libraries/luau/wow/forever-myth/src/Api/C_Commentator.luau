--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type FindSpectatedUnitResults = {
	read playerIndex: number,
	read teamIndex: number,
	read isPet: boolean,
}

export type GetAdditionalCameraWeightResults = {
	read teamIndex: number,
	read playerIndex: number,
}

export type GetCameraResults = {
	read xPos: number,
	read yPos: number,
	read zPos: number,
	read yaw: number,
	read pitch: number,
	read roll: number,
	read fov: number,
}

export type GetCameraPositionResults = {
	read xPos: number,
	read yPos: number,
	read zPos: number,
}

export type GetInstanceInfoResults = {
	read mapID: number,
	read mapName: Maybe<string>,
	read status: number,
	read instanceIDLow: number,
	read instanceIDHigh: number,
}

export type GetMapInfoResults = {
	read teamSize: number,
	read minLevel: number,
	read maxLevel: number,
	read numInstances: number,
}

export type GetPlayerAuraInfoResults = {
	read startTime: number,
	read duration: number,
	read enable: boolean,
}

export type GetPlayerAuraInfoByUnitResults = {
	read startTime: number,
	read duration: number,
	read enable: boolean,
}

export type GetPlayerCooldownInfoResults = {
	read startTime: number,
	read duration: number,
	read enable: boolean,
}

export type GetPlayerCooldownInfoByUnitResults = {
	read startTime: number,
	read duration: number,
	read enable: boolean,
}

export type GetPlayerCrowdControlInfoResults = {
	read spellID: number,
	read expiration: number,
	read duration: number,
}

export type GetPlayerCrowdControlInfoByUnitResults = {
	read spellID: number,
	read expiration: number,
	read duration: number,
}

export type GetPlayerItemCooldownInfoResults = {
	read startTime: number,
	read duration: number,
	read enable: boolean,
}

export type GetPlayerItemCooldownInfoByUnitResults = {
	read startTime: number,
	read duration: number,
	read enable: boolean,
}

export type GetPlayerSpellChargesResults = {
	read charges: number,
	read maxCharges: number,
	read startTime: number,
	read duration: number,
}

export type GetPlayerSpellChargesByUnitResults = {
	read charges: number,
	read maxCharges: number,
	read startTime: number,
	read duration: number,
}

export type GetTrackedSpellsResults = {
	read spells: Maybe<{ number }>,
	read result: Enum_TrackedSpellsResult,
}

export type GetTrackedSpellsByUnitResults = {
	read spells: Maybe<{ number }>,
	read result: Enum_TrackedSpellsResult,
}

export type GetWargameInfoResults = {
	read name: string,
	read minPlayers: number,
	read maxPlayers: number,
	read isArena: boolean,
}

export type HasTrackedAurasResults = {
	read hasOffensiveAura: boolean,
	read hasDefensiveAura: boolean,
}

local Wrappers = {}

function Wrappers.FindSpectatedUnit(unitToken: UnitToken): Maybe<FindSpectatedUnitResults>
	local r1, r2, r3 = C_Commentator.FindSpectatedUnit(unitToken)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		playerIndex = r1,
		teamIndex = r2,
		isPet = r3,
	})
end

function Wrappers.FindSpectatedUnitInto(
	reuse: FindSpectatedUnitResults,
	unitToken: UnitToken
): Maybe<FindSpectatedUnitResults>
	local r1, r2, r3 = C_Commentator.FindSpectatedUnit(unitToken)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.playerIndex = r1
	fields.teamIndex = r2
	fields.isPet = r3
	return Reuse.just(reuse)
end

function Wrappers.FindTeamNameInCurrentInstance(teamIndex: number): Maybe<string>
	return Maybe.of(C_Commentator.FindTeamNameInCurrentInstance(teamIndex))
end

function Wrappers.FindTeamNameInCurrentInstanceInto(reuse: Maybe<string>, teamIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_Commentator.FindTeamNameInCurrentInstance(teamIndex))
end

function Wrappers.FindTeamNameInDirectory(playerNames: { string }): Maybe<string>
	return Maybe.of(C_Commentator.FindTeamNameInDirectory(playerNames))
end

function Wrappers.FindTeamNameInDirectoryInto(reuse: Maybe<string>, playerNames: { string }): Maybe<string>
	return Reuse.maybe(reuse, C_Commentator.FindTeamNameInDirectory(playerNames))
end

function Wrappers.GetAdditionalCameraWeight(): Maybe<GetAdditionalCameraWeightResults>
	local r1, r2 = C_Commentator.GetAdditionalCameraWeight()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		teamIndex = r1,
		playerIndex = r2,
	})
end

function Wrappers.GetAdditionalCameraWeightInto(
	reuse: GetAdditionalCameraWeightResults
): Maybe<GetAdditionalCameraWeightResults>
	local r1, r2 = C_Commentator.GetAdditionalCameraWeight()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.teamIndex = r1
	fields.playerIndex = r2
	return Reuse.just(reuse)
end

function Wrappers.GetAdditionalCameraWeightByToken(unitToken: UnitToken): Maybe<number>
	return Maybe.of(C_Commentator.GetAdditionalCameraWeightByToken(unitToken))
end

function Wrappers.GetAdditionalCameraWeightByTokenInto(reuse: Maybe<number>, unitToken: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, C_Commentator.GetAdditionalCameraWeightByToken(unitToken))
end

function Wrappers.GetAllPlayerOverrideNames(): Maybe<{ NameOverrideEntry }>
	return Maybe.of(C_Commentator.GetAllPlayerOverrideNames())
end

function Wrappers.GetAllPlayerOverrideNamesInto(reuse: Maybe<{ NameOverrideEntry }>): Maybe<{ NameOverrideEntry }>
	return Reuse.maybe(reuse, C_Commentator.GetAllPlayerOverrideNames())
end

function Wrappers.GetCamera(): Maybe<GetCameraResults>
	local r1, r2, r3, r4, r5, r6, r7 = C_Commentator.GetCamera()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		xPos = r1,
		yPos = r2,
		zPos = r3,
		yaw = r4,
		pitch = r5,
		roll = r6,
		fov = r7,
	})
end

function Wrappers.GetCameraInto(reuse: GetCameraResults): Maybe<GetCameraResults>
	local r1, r2, r3, r4, r5, r6, r7 = C_Commentator.GetCamera()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.xPos = r1
	fields.yPos = r2
	fields.zPos = r3
	fields.yaw = r4
	fields.pitch = r5
	fields.roll = r6
	fields.fov = r7
	return Reuse.just(reuse)
end

function Wrappers.GetCameraPosition(): Maybe<GetCameraPositionResults>
	local r1, r2, r3 = C_Commentator.GetCameraPosition()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		xPos = r1,
		yPos = r2,
		zPos = r3,
	})
end

function Wrappers.GetCameraPositionInto(reuse: GetCameraPositionResults): Maybe<GetCameraPositionResults>
	local r1, r2, r3 = C_Commentator.GetCameraPosition()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.xPos = r1
	fields.yPos = r2
	fields.zPos = r3
	return Reuse.just(reuse)
end

function Wrappers.GetCommentatorMatchDataState(): Maybe<CommentatorMatchDataState>
	return Maybe.of(C_Commentator.GetCommentatorMatchDataState())
end

function Wrappers.GetCommentatorMatchDataStateInto(
	reuse: Maybe<CommentatorMatchDataState>
): Maybe<CommentatorMatchDataState>
	return Reuse.maybe(reuse, C_Commentator.GetCommentatorMatchDataState())
end

function Wrappers.GetCurrentMapID(): Maybe<number>
	return Maybe.of(C_Commentator.GetCurrentMapID())
end

function Wrappers.GetCurrentMapIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Commentator.GetCurrentMapID())
end

function Wrappers.GetIndirectSpellID(trackedSpellID: number): Maybe<number>
	return Maybe.of(C_Commentator.GetIndirectSpellID(trackedSpellID))
end

function Wrappers.GetIndirectSpellIDInto(reuse: Maybe<number>, trackedSpellID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Commentator.GetIndirectSpellID(trackedSpellID))
end

function Wrappers.GetInstanceInfo(mapIndex: number, instanceIndex: number): Maybe<GetInstanceInfoResults>
	local r1, r2, r3, r4, r5 = C_Commentator.GetInstanceInfo(mapIndex, instanceIndex)
	if r1 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		mapID = r1,
		mapName = Maybe.of(r2),
		status = r3,
		instanceIDLow = r4,
		instanceIDHigh = r5,
	})
end

function Wrappers.GetInstanceInfoInto(
	reuse: GetInstanceInfoResults,
	mapIndex: number,
	instanceIndex: number
): Maybe<GetInstanceInfoResults>
	local r1, r2, r3, r4, r5 = C_Commentator.GetInstanceInfo(mapIndex, instanceIndex)
	if r1 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.mapID = r1
	fields.mapName = Reuse.maybe(fields.mapName, r2)
	fields.status = r3
	fields.instanceIDLow = r4
	fields.instanceIDHigh = r5
	return Reuse.just(reuse)
end

function Wrappers.GetMapInfo(mapIndex: number): Maybe<GetMapInfoResults>
	local r1, r2, r3, r4 = C_Commentator.GetMapInfo(mapIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		teamSize = r1,
		minLevel = r2,
		maxLevel = r3,
		numInstances = r4,
	})
end

function Wrappers.GetMapInfoInto(reuse: GetMapInfoResults, mapIndex: number): Maybe<GetMapInfoResults>
	local r1, r2, r3, r4 = C_Commentator.GetMapInfo(mapIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.teamSize = r1
	fields.minLevel = r2
	fields.maxLevel = r3
	fields.numInstances = r4
	return Reuse.just(reuse)
end

function Wrappers.GetNumPlayers(factionIndex: number): Maybe<number>
	return Maybe.of(C_Commentator.GetNumPlayers(factionIndex))
end

function Wrappers.GetNumPlayersInto(reuse: Maybe<number>, factionIndex: number): Maybe<number>
	return Reuse.maybe(reuse, C_Commentator.GetNumPlayers(factionIndex))
end

function Wrappers.GetPlayerAuraInfo(
	teamIndex: number,
	playerIndex: number,
	spellID: number
): Maybe<GetPlayerAuraInfoResults>
	local r1, r2, r3 = C_Commentator.GetPlayerAuraInfo(teamIndex, playerIndex, spellID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		startTime = r1,
		duration = r2,
		enable = r3,
	})
end

function Wrappers.GetPlayerAuraInfoInto(
	reuse: GetPlayerAuraInfoResults,
	teamIndex: number,
	playerIndex: number,
	spellID: number
): Maybe<GetPlayerAuraInfoResults>
	local r1, r2, r3 = C_Commentator.GetPlayerAuraInfo(teamIndex, playerIndex, spellID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerAuraInfoByUnit(token: UnitToken, spellID: number): Maybe<GetPlayerAuraInfoByUnitResults>
	local r1, r2, r3 = C_Commentator.GetPlayerAuraInfoByUnit(token, spellID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		startTime = r1,
		duration = r2,
		enable = r3,
	})
end

function Wrappers.GetPlayerAuraInfoByUnitInto(
	reuse: GetPlayerAuraInfoByUnitResults,
	token: UnitToken,
	spellID: number
): Maybe<GetPlayerAuraInfoByUnitResults>
	local r1, r2, r3 = C_Commentator.GetPlayerAuraInfoByUnit(token, spellID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerCooldownInfo(
	teamIndex: number,
	playerIndex: number,
	spellID: number
): Maybe<GetPlayerCooldownInfoResults>
	local r1, r2, r3 = C_Commentator.GetPlayerCooldownInfo(teamIndex, playerIndex, spellID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		startTime = r1,
		duration = r2,
		enable = r3,
	})
end

function Wrappers.GetPlayerCooldownInfoInto(
	reuse: GetPlayerCooldownInfoResults,
	teamIndex: number,
	playerIndex: number,
	spellID: number
): Maybe<GetPlayerCooldownInfoResults>
	local r1, r2, r3 = C_Commentator.GetPlayerCooldownInfo(teamIndex, playerIndex, spellID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerCooldownInfoByUnit(
	unitToken: UnitToken,
	spellID: number
): Maybe<GetPlayerCooldownInfoByUnitResults>
	local r1, r2, r3 = C_Commentator.GetPlayerCooldownInfoByUnit(unitToken, spellID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		startTime = r1,
		duration = r2,
		enable = r3,
	})
end

function Wrappers.GetPlayerCooldownInfoByUnitInto(
	reuse: GetPlayerCooldownInfoByUnitResults,
	unitToken: UnitToken,
	spellID: number
): Maybe<GetPlayerCooldownInfoByUnitResults>
	local r1, r2, r3 = C_Commentator.GetPlayerCooldownInfoByUnit(unitToken, spellID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerCrowdControlInfo(
	teamIndex: number,
	playerIndex: number
): Maybe<GetPlayerCrowdControlInfoResults>
	local r1, r2, r3 = C_Commentator.GetPlayerCrowdControlInfo(teamIndex, playerIndex)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		spellID = r1,
		expiration = r2,
		duration = r3,
	})
end

function Wrappers.GetPlayerCrowdControlInfoInto(
	reuse: GetPlayerCrowdControlInfoResults,
	teamIndex: number,
	playerIndex: number
): Maybe<GetPlayerCrowdControlInfoResults>
	local r1, r2, r3 = C_Commentator.GetPlayerCrowdControlInfo(teamIndex, playerIndex)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.spellID = r1
	fields.expiration = r2
	fields.duration = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerCrowdControlInfoByUnit(token: UnitToken): Maybe<GetPlayerCrowdControlInfoByUnitResults>
	local r1, r2, r3 = C_Commentator.GetPlayerCrowdControlInfoByUnit(token)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		spellID = r1,
		expiration = r2,
		duration = r3,
	})
end

function Wrappers.GetPlayerCrowdControlInfoByUnitInto(
	reuse: GetPlayerCrowdControlInfoByUnitResults,
	token: UnitToken
): Maybe<GetPlayerCrowdControlInfoByUnitResults>
	local r1, r2, r3 = C_Commentator.GetPlayerCrowdControlInfoByUnit(token)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.spellID = r1
	fields.expiration = r2
	fields.duration = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerData(teamIndex: number, playerIndex: number): Maybe<CommentatorPlayerData>
	return Maybe.of(C_Commentator.GetPlayerData(teamIndex, playerIndex))
end

function Wrappers.GetPlayerDataInto(
	reuse: Maybe<CommentatorPlayerData>,
	teamIndex: number,
	playerIndex: number
): Maybe<CommentatorPlayerData>
	return Reuse.maybe(reuse, C_Commentator.GetPlayerData(teamIndex, playerIndex))
end

function Wrappers.GetPlayerFlagInfo(teamIndex: number, playerIndex: number): Maybe<boolean>
	return Maybe.of(C_Commentator.GetPlayerFlagInfo(teamIndex, playerIndex))
end

function Wrappers.GetPlayerFlagInfoInto(reuse: Maybe<boolean>, teamIndex: number, playerIndex: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_Commentator.GetPlayerFlagInfo(teamIndex, playerIndex))
end

function Wrappers.GetPlayerFlagInfoByUnit(unitToken: UnitToken): Maybe<boolean>
	return Maybe.of(C_Commentator.GetPlayerFlagInfoByUnit(unitToken))
end

function Wrappers.GetPlayerFlagInfoByUnitInto(reuse: Maybe<boolean>, unitToken: UnitToken): Maybe<boolean>
	return Reuse.maybe(reuse, C_Commentator.GetPlayerFlagInfoByUnit(unitToken))
end

function Wrappers.GetPlayerItemCooldownInfo(
	teamIndex: number,
	playerIndex: number,
	itemID: number
): Maybe<GetPlayerItemCooldownInfoResults>
	local r1, r2, r3 = C_Commentator.GetPlayerItemCooldownInfo(teamIndex, playerIndex, itemID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		startTime = r1,
		duration = r2,
		enable = r3,
	})
end

function Wrappers.GetPlayerItemCooldownInfoInto(
	reuse: GetPlayerItemCooldownInfoResults,
	teamIndex: number,
	playerIndex: number,
	itemID: number
): Maybe<GetPlayerItemCooldownInfoResults>
	local r1, r2, r3 = C_Commentator.GetPlayerItemCooldownInfo(teamIndex, playerIndex, itemID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerItemCooldownInfoByUnit(
	unitToken: UnitToken,
	itemID: number
): Maybe<GetPlayerItemCooldownInfoByUnitResults>
	local r1, r2, r3 = C_Commentator.GetPlayerItemCooldownInfoByUnit(unitToken, itemID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		startTime = r1,
		duration = r2,
		enable = r3,
	})
end

function Wrappers.GetPlayerItemCooldownInfoByUnitInto(
	reuse: GetPlayerItemCooldownInfoByUnitResults,
	unitToken: UnitToken,
	itemID: number
): Maybe<GetPlayerItemCooldownInfoByUnitResults>
	local r1, r2, r3 = C_Commentator.GetPlayerItemCooldownInfoByUnit(unitToken, itemID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerOverrideName(originalName: string): Maybe<string>
	return Maybe.of(C_Commentator.GetPlayerOverrideName(originalName))
end

function Wrappers.GetPlayerOverrideNameInto(reuse: Maybe<string>, originalName: string): Maybe<string>
	return Reuse.maybe(reuse, C_Commentator.GetPlayerOverrideName(originalName))
end

function Wrappers.GetPlayerSpellCharges(
	teamIndex: number,
	playerIndex: number,
	spellID: number
): Maybe<GetPlayerSpellChargesResults>
	local r1, r2, r3, r4 = C_Commentator.GetPlayerSpellCharges(teamIndex, playerIndex, spellID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		charges = r1,
		maxCharges = r2,
		startTime = r3,
		duration = r4,
	})
end

function Wrappers.GetPlayerSpellChargesInto(
	reuse: GetPlayerSpellChargesResults,
	teamIndex: number,
	playerIndex: number,
	spellID: number
): Maybe<GetPlayerSpellChargesResults>
	local r1, r2, r3, r4 = C_Commentator.GetPlayerSpellCharges(teamIndex, playerIndex, spellID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.charges = r1
	fields.maxCharges = r2
	fields.startTime = r3
	fields.duration = r4
	return Reuse.just(reuse)
end

function Wrappers.GetPlayerSpellChargesByUnit(
	unitToken: UnitToken,
	spellID: number
): Maybe<GetPlayerSpellChargesByUnitResults>
	local r1, r2, r3, r4 = C_Commentator.GetPlayerSpellChargesByUnit(unitToken, spellID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		charges = r1,
		maxCharges = r2,
		startTime = r3,
		duration = r4,
	})
end

function Wrappers.GetPlayerSpellChargesByUnitInto(
	reuse: GetPlayerSpellChargesByUnitResults,
	unitToken: UnitToken,
	spellID: number
): Maybe<GetPlayerSpellChargesByUnitResults>
	local r1, r2, r3, r4 = C_Commentator.GetPlayerSpellChargesByUnit(unitToken, spellID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.charges = r1
	fields.maxCharges = r2
	fields.startTime = r3
	fields.duration = r4
	return Reuse.just(reuse)
end

function Wrappers.GetSmoothFollowTransitioning(): Maybe<boolean>
	return Maybe.of(C_Commentator.GetSmoothFollowTransitioning())
end

function Wrappers.GetSmoothFollowTransitioningInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_Commentator.GetSmoothFollowTransitioning())
end

function Wrappers.GetStartLocation(mapID: number): Maybe<Vector3DMixin>
	return Maybe.of(C_Commentator.GetStartLocation(mapID))
end

function Wrappers.GetStartLocationInto(reuse: Maybe<Vector3DMixin>, mapID: number): Maybe<Vector3DMixin>
	return Reuse.maybe(reuse, C_Commentator.GetStartLocation(mapID))
end

function Wrappers.GetTimeLeftInMatch(): Maybe<number>
	return Maybe.of(C_Commentator.GetTimeLeftInMatch())
end

function Wrappers.GetTimeLeftInMatchInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Commentator.GetTimeLeftInMatch())
end

function Wrappers.GetTrackedSpellID(indirectSpellID: number): Maybe<number>
	return Maybe.of(C_Commentator.GetTrackedSpellID(indirectSpellID))
end

function Wrappers.GetTrackedSpellIDInto(reuse: Maybe<number>, indirectSpellID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Commentator.GetTrackedSpellID(indirectSpellID))
end

function Wrappers.GetTrackedSpells(
	teamIndex: number,
	playerIndex: number,
	category: Enum_TrackedSpellCategory
): Maybe<GetTrackedSpellsResults>
	local r1, r2 = C_Commentator.GetTrackedSpells(teamIndex, playerIndex, category)
	if r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		spells = Maybe.of(r1),
		result = r2,
	})
end

function Wrappers.GetTrackedSpellsInto(
	reuse: GetTrackedSpellsResults,
	teamIndex: number,
	playerIndex: number,
	category: Enum_TrackedSpellCategory
): Maybe<GetTrackedSpellsResults>
	local r1, r2 = C_Commentator.GetTrackedSpells(teamIndex, playerIndex, category)
	if r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.spells = Reuse.maybe(fields.spells, r1)
	fields.result = r2
	return Reuse.just(reuse)
end

function Wrappers.GetTrackedSpellsByUnit(
	unitToken: UnitToken,
	category: Enum_TrackedSpellCategory
): Maybe<GetTrackedSpellsByUnitResults>
	local r1, r2 = C_Commentator.GetTrackedSpellsByUnit(unitToken, category)
	if r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		spells = Maybe.of(r1),
		result = r2,
	})
end

function Wrappers.GetTrackedSpellsByUnitInto(
	reuse: GetTrackedSpellsByUnitResults,
	unitToken: UnitToken,
	category: Enum_TrackedSpellCategory
): Maybe<GetTrackedSpellsByUnitResults>
	local r1, r2 = C_Commentator.GetTrackedSpellsByUnit(unitToken, category)
	if r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.spells = Reuse.maybe(fields.spells, r1)
	fields.result = r2
	return Reuse.just(reuse)
end

function Wrappers.GetUnitData(unitToken: UnitToken): Maybe<CommentatorUnitData>
	return Maybe.of(C_Commentator.GetUnitData(unitToken))
end

function Wrappers.GetUnitDataInto(reuse: Maybe<CommentatorUnitData>, unitToken: UnitToken): Maybe<CommentatorUnitData>
	return Reuse.maybe(reuse, C_Commentator.GetUnitData(unitToken))
end

function Wrappers.GetWargameInfo(listID: number): Maybe<GetWargameInfoResults>
	local r1, r2, r3, r4 = C_Commentator.GetWargameInfo(listID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		minPlayers = r2,
		maxPlayers = r3,
		isArena = r4,
	})
end

function Wrappers.GetWargameInfoInto(reuse: GetWargameInfoResults, listID: number): Maybe<GetWargameInfoResults>
	local r1, r2, r3, r4 = C_Commentator.GetWargameInfo(listID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.minPlayers = r2
	fields.maxPlayers = r3
	fields.isArena = r4
	return Reuse.just(reuse)
end

function Wrappers.HasTrackedAuras(token: UnitToken): Maybe<HasTrackedAurasResults>
	local r1, r2 = C_Commentator.HasTrackedAuras(token)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		hasOffensiveAura = r1,
		hasDefensiveAura = r2,
	})
end

function Wrappers.HasTrackedAurasInto(reuse: HasTrackedAurasResults, token: UnitToken): Maybe<HasTrackedAurasResults>
	local r1, r2 = C_Commentator.HasTrackedAuras(token)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.hasOffensiveAura = r1
	fields.hasDefensiveAura = r2
	return Reuse.just(reuse)
end

function Wrappers.IsTrackedDefensiveAura(spellID: number): Maybe<boolean>
	return Maybe.of(C_Commentator.IsTrackedDefensiveAura(spellID))
end

function Wrappers.IsTrackedDefensiveAuraInto(reuse: Maybe<boolean>, spellID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_Commentator.IsTrackedDefensiveAura(spellID))
end

function Wrappers.IsTrackedOffensiveAura(spellID: number): Maybe<boolean>
	return Maybe.of(C_Commentator.IsTrackedOffensiveAura(spellID))
end

function Wrappers.IsTrackedOffensiveAuraInto(reuse: Maybe<boolean>, spellID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_Commentator.IsTrackedOffensiveAura(spellID))
end

function Wrappers.IsTrackedSpell(
	teamIndex: number,
	playerIndex: number,
	spellID: number,
	category: Enum_TrackedSpellCategory
): Maybe<boolean>
	return Maybe.of(C_Commentator.IsTrackedSpell(teamIndex, playerIndex, spellID, category))
end

function Wrappers.IsTrackedSpellInto(
	reuse: Maybe<boolean>,
	teamIndex: number,
	playerIndex: number,
	spellID: number,
	category: Enum_TrackedSpellCategory
): Maybe<boolean>
	return Reuse.maybe(reuse, C_Commentator.IsTrackedSpell(teamIndex, playerIndex, spellID, category))
end

function Wrappers.IsTrackedSpellByUnit(
	unitToken: UnitToken,
	spellID: number,
	category: Enum_TrackedSpellCategory
): Maybe<boolean>
	return Maybe.of(C_Commentator.IsTrackedSpellByUnit(unitToken, spellID, category))
end

function Wrappers.IsTrackedSpellByUnitInto(
	reuse: Maybe<boolean>,
	unitToken: UnitToken,
	spellID: number,
	category: Enum_TrackedSpellCategory
): Maybe<boolean>
	return Reuse.maybe(reuse, C_Commentator.IsTrackedSpellByUnit(unitToken, spellID, category))
end

function Wrappers.SendAddonMessageLogged(
	prefix: string,
	message: string,
	chatType: string?,
	target: string?
): Maybe<Enum_SendAddonMessageResult>
	return Maybe.of(C_Commentator.SendAddonMessageLogged(prefix, message, chatType, target))
end

function Wrappers.SendAddonMessageLoggedInto(
	reuse: Maybe<Enum_SendAddonMessageResult>,
	prefix: string,
	message: string,
	chatType: string?,
	target: string?
): Maybe<Enum_SendAddonMessageResult>
	return Reuse.maybe(reuse, C_Commentator.SendAddonMessageLogged(prefix, message, chatType, target))
end

return Wrappers
