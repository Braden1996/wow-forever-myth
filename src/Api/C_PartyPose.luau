--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetPartyPoseInfoByID(mapID: number): Maybe<PartyPoseInfo>
	return Maybe.of(C_PartyPose.GetPartyPoseInfoByID(mapID))
end

function Wrappers.GetPartyPoseInfoByIDInto(reuse: Maybe<PartyPoseInfo>, mapID: number): Maybe<PartyPoseInfo>
	return Reuse.maybe(reuse, C_PartyPose.GetPartyPoseInfoByID(mapID))
end

function Wrappers.GetPartyPoseInfoByMapID(mapID: number): Maybe<PartyPoseInfo>
	return Maybe.of(C_PartyPose.GetPartyPoseInfoByMapID(mapID))
end

function Wrappers.GetPartyPoseInfoByMapIDInto(reuse: Maybe<PartyPoseInfo>, mapID: number): Maybe<PartyPoseInfo>
	return Reuse.maybe(reuse, C_PartyPose.GetPartyPoseInfoByMapID(mapID))
end

return Wrappers
