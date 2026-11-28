--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetNextWaypointForMapResults = {
	read x: number,
	read y: number,
	read waypointDescription: string,
}

local Wrappers = {}

function Wrappers.GetFrame(): Maybe<ScriptRegion>
	return Maybe.of(C_Navigation.GetFrame())
end

function Wrappers.GetFrameInto(reuse: Maybe<ScriptRegion>): Maybe<ScriptRegion>
	return Reuse.maybe(reuse, C_Navigation.GetFrame())
end

function Wrappers.GetNearestPartyMemberToken(): Maybe<string>
	return Maybe.of(C_Navigation.GetNearestPartyMemberToken())
end

function Wrappers.GetNearestPartyMemberTokenInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_Navigation.GetNearestPartyMemberToken())
end

function Wrappers.GetNextWaypointForMap(uiMapID: number): Maybe<GetNextWaypointForMapResults>
	local r1, r2, r3 = C_Navigation.GetNextWaypointForMap(uiMapID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		x = r1,
		y = r2,
		waypointDescription = r3,
	})
end

function Wrappers.GetNextWaypointForMapInto(
	reuse: GetNextWaypointForMapResults,
	uiMapID: number
): Maybe<GetNextWaypointForMapResults>
	local r1, r2, r3 = C_Navigation.GetNextWaypointForMap(uiMapID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.x = r1
	fields.y = r2
	fields.waypointDescription = r3
	return Reuse.just(reuse)
end

return Wrappers
