--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetClassInfo(classID: number): Maybe<ClassInfo>
	return Maybe.of(C_CreatureInfo.GetClassInfo(classID))
end

function Wrappers.GetClassInfoInto(reuse: Maybe<ClassInfo>, classID: number): Maybe<ClassInfo>
	return Reuse.maybe(reuse, C_CreatureInfo.GetClassInfo(classID))
end

function Wrappers.GetCreatureFamilyInfo(creatureFamilyID: number): Maybe<CreatureFamilyInfo>
	return Maybe.of(C_CreatureInfo.GetCreatureFamilyInfo(creatureFamilyID))
end

function Wrappers.GetCreatureFamilyInfoInto(
	reuse: Maybe<CreatureFamilyInfo>,
	creatureFamilyID: number
): Maybe<CreatureFamilyInfo>
	return Reuse.maybe(reuse, C_CreatureInfo.GetCreatureFamilyInfo(creatureFamilyID))
end

function Wrappers.GetCreatureID(creatureGUID: WOWGUID): Maybe<number>
	return Maybe.of(C_CreatureInfo.GetCreatureID(creatureGUID))
end

function Wrappers.GetCreatureIDInto(reuse: Maybe<number>, creatureGUID: WOWGUID): Maybe<number>
	return Reuse.maybe(reuse, C_CreatureInfo.GetCreatureID(creatureGUID))
end

function Wrappers.GetCreatureTypeInfo(creatureTypeID: number): Maybe<CreatureTypeInfo>
	return Maybe.of(C_CreatureInfo.GetCreatureTypeInfo(creatureTypeID))
end

function Wrappers.GetCreatureTypeInfoInto(
	reuse: Maybe<CreatureTypeInfo>,
	creatureTypeID: number
): Maybe<CreatureTypeInfo>
	return Reuse.maybe(reuse, C_CreatureInfo.GetCreatureTypeInfo(creatureTypeID))
end

function Wrappers.GetFactionInfo(raceID: number): Maybe<FactionInfo>
	return Maybe.of(C_CreatureInfo.GetFactionInfo(raceID))
end

function Wrappers.GetFactionInfoInto(reuse: Maybe<FactionInfo>, raceID: number): Maybe<FactionInfo>
	return Reuse.maybe(reuse, C_CreatureInfo.GetFactionInfo(raceID))
end

function Wrappers.GetRaceInfo(raceID: number): Maybe<RaceInfo>
	return Maybe.of(C_CreatureInfo.GetRaceInfo(raceID))
end

function Wrappers.GetRaceInfoInto(reuse: Maybe<RaceInfo>, raceID: number): Maybe<RaceInfo>
	return Reuse.maybe(reuse, C_CreatureInfo.GetRaceInfo(raceID))
end

return Wrappers
