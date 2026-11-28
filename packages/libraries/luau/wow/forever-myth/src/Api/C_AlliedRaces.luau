--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAllRacialAbilitiesFromID(raceID: number): Maybe<{ AlliedRaceRacialAbility }>
	return Maybe.of(C_AlliedRaces.GetAllRacialAbilitiesFromID(raceID))
end

function Wrappers.GetAllRacialAbilitiesFromIDInto(
	reuse: Maybe<{ AlliedRaceRacialAbility }>,
	raceID: number
): Maybe<{ AlliedRaceRacialAbility }>
	return Reuse.maybe(reuse, C_AlliedRaces.GetAllRacialAbilitiesFromID(raceID))
end

function Wrappers.GetRaceInfoByID(raceID: number): Maybe<AlliedRaceInfo>
	return Maybe.of(C_AlliedRaces.GetRaceInfoByID(raceID))
end

function Wrappers.GetRaceInfoByIDInto(reuse: Maybe<AlliedRaceInfo>, raceID: number): Maybe<AlliedRaceInfo>
	return Reuse.maybe(reuse, C_AlliedRaces.GetRaceInfoByID(raceID))
end

return Wrappers
