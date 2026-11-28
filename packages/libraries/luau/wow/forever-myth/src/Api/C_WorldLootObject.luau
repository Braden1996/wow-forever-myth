--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetWorldLootObjectDistanceSquared(unitToken: UnitToken): Maybe<number>
	return Maybe.of(C_WorldLootObject.GetWorldLootObjectDistanceSquared(unitToken))
end

function Wrappers.GetWorldLootObjectDistanceSquaredInto(reuse: Maybe<number>, unitToken: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, C_WorldLootObject.GetWorldLootObjectDistanceSquared(unitToken))
end

function Wrappers.GetWorldLootObjectInfo(unitToken: UnitToken): Maybe<WorldLootObjectInfo>
	return Maybe.of(C_WorldLootObject.GetWorldLootObjectInfo(unitToken))
end

function Wrappers.GetWorldLootObjectInfoInto(
	reuse: Maybe<WorldLootObjectInfo>,
	unitToken: UnitToken
): Maybe<WorldLootObjectInfo>
	return Reuse.maybe(reuse, C_WorldLootObject.GetWorldLootObjectInfo(unitToken))
end

function Wrappers.GetWorldLootObjectInfoByGUID(objectGUID: WOWGUID): Maybe<WorldLootObjectInfo>
	return Maybe.of(C_WorldLootObject.GetWorldLootObjectInfoByGUID(objectGUID))
end

function Wrappers.GetWorldLootObjectInfoByGUIDInto(
	reuse: Maybe<WorldLootObjectInfo>,
	objectGUID: WOWGUID
): Maybe<WorldLootObjectInfo>
	return Reuse.maybe(reuse, C_WorldLootObject.GetWorldLootObjectInfoByGUID(objectGUID))
end

return Wrappers
