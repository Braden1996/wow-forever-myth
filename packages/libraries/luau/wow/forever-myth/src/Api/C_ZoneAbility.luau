--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetZoneAbilityIcon(zoneAbilitySpellID: number): Maybe<number>
	return Maybe.of(C_ZoneAbility.GetZoneAbilityIcon(zoneAbilitySpellID))
end

function Wrappers.GetZoneAbilityIconInto(reuse: Maybe<number>, zoneAbilitySpellID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ZoneAbility.GetZoneAbilityIcon(zoneAbilitySpellID))
end

return Wrappers
