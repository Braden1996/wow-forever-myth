--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCurrentHouseInfo(): Maybe<HouseInfo>
	return Maybe.of(C_Housing.GetCurrentHouseInfo())
end

function Wrappers.GetCurrentHouseInfoInto(reuse: Maybe<HouseInfo>): Maybe<HouseInfo>
	return Reuse.maybe(reuse, C_Housing.GetCurrentHouseInfo())
end

function Wrappers.GetCurrentNeighborhoodGUID(): Maybe<WOWGUID>
	return Maybe.of(C_Housing.GetCurrentNeighborhoodGUID())
end

function Wrappers.GetCurrentNeighborhoodGUIDInto(reuse: Maybe<WOWGUID>): Maybe<WOWGUID>
	return Reuse.maybe(reuse, C_Housing.GetCurrentNeighborhoodGUID())
end

function Wrappers.GetTrackedHouseGuid(): Maybe<WOWGUID>
	return Maybe.of(C_Housing.GetTrackedHouseGuid())
end

function Wrappers.GetTrackedHouseGuidInto(reuse: Maybe<WOWGUID>): Maybe<WOWGUID>
	return Reuse.maybe(reuse, C_Housing.GetTrackedHouseGuid())
end

function Wrappers.GetUIMapIDForNeighborhood(neighborhoodGuid: WOWGUID): Maybe<number>
	return Maybe.of(C_Housing.GetUIMapIDForNeighborhood(neighborhoodGuid))
end

function Wrappers.GetUIMapIDForNeighborhoodInto(reuse: Maybe<number>, neighborhoodGuid: WOWGUID): Maybe<number>
	return Reuse.maybe(reuse, C_Housing.GetUIMapIDForNeighborhood(neighborhoodGuid))
end

function Wrappers.GetVisitCooldownInfo(): Maybe<SpellCooldownInfo>
	return Maybe.of(C_Housing.GetVisitCooldownInfo())
end

function Wrappers.GetVisitCooldownInfoInto(reuse: Maybe<SpellCooldownInfo>): Maybe<SpellCooldownInfo>
	return Reuse.maybe(reuse, C_Housing.GetVisitCooldownInfo())
end

return Wrappers
