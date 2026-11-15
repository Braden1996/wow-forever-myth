--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCompletedOptionDescriptionString(): Maybe<string>
	return Maybe.of(C_GossipInfo.GetCompletedOptionDescriptionString())
end

function Wrappers.GetCompletedOptionDescriptionStringInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_GossipInfo.GetCompletedOptionDescriptionString())
end

function Wrappers.GetCustomGossipDescriptionString(): Maybe<string>
	return Maybe.of(C_GossipInfo.GetCustomGossipDescriptionString())
end

function Wrappers.GetCustomGossipDescriptionStringInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_GossipInfo.GetCustomGossipDescriptionString())
end

function Wrappers.GetFriendshipReputation(friendshipFactionID: number): Maybe<FriendshipReputationInfo>
	return Maybe.of(C_GossipInfo.GetFriendshipReputation(friendshipFactionID))
end

function Wrappers.GetFriendshipReputationInto(
	reuse: Maybe<FriendshipReputationInfo>,
	friendshipFactionID: number
): Maybe<FriendshipReputationInfo>
	return Reuse.maybe(reuse, C_GossipInfo.GetFriendshipReputation(friendshipFactionID))
end

function Wrappers.GetOptionUIWidgetSetsAndTypesByOptionID(
	gossipOptionID: number
): Maybe<{ GossipOptionUIWidgetSetAndType }>
	return Maybe.of(C_GossipInfo.GetOptionUIWidgetSetsAndTypesByOptionID(gossipOptionID))
end

function Wrappers.GetOptionUIWidgetSetsAndTypesByOptionIDInto(
	reuse: Maybe<{ GossipOptionUIWidgetSetAndType }>,
	gossipOptionID: number
): Maybe<{ GossipOptionUIWidgetSetAndType }>
	return Reuse.maybe(reuse, C_GossipInfo.GetOptionUIWidgetSetsAndTypesByOptionID(gossipOptionID))
end

function Wrappers.GetPoiForUiMapID(uiMapID: number): Maybe<number>
	return Maybe.of(C_GossipInfo.GetPoiForUiMapID(uiMapID))
end

function Wrappers.GetPoiForUiMapIDInto(reuse: Maybe<number>, uiMapID: number): Maybe<number>
	return Reuse.maybe(reuse, C_GossipInfo.GetPoiForUiMapID(uiMapID))
end

function Wrappers.GetPoiInfo(uiMapID: number, gossipPoiID: number): Maybe<GossipPoiInfo>
	return Maybe.of(C_GossipInfo.GetPoiInfo(uiMapID, gossipPoiID))
end

function Wrappers.GetPoiInfoInto(
	reuse: Maybe<GossipPoiInfo>,
	uiMapID: number,
	gossipPoiID: number
): Maybe<GossipPoiInfo>
	return Reuse.maybe(reuse, C_GossipInfo.GetPoiInfo(uiMapID, gossipPoiID))
end

return Wrappers
