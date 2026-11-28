--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetBestMapForTrackableResults = {
	read result: Enum_ContentTrackingResult,
	read mapID: Maybe<number>,
}

export type GetCurrentTrackingTargetResults = {
	read targetType: Enum_ContentTrackingTargetType,
	read targetID: number,
}

export type GetNextWaypointForTrackableResults = {
	read result: Enum_ContentTrackingResult,
	read mapInfo: Maybe<ContentTrackingMapInfo>,
}

export type GetTrackablesOnMapResults = {
	read result: Enum_ContentTrackingResult,
	read trackableMapInfos: { ContentTrackingMapInfo },
}

export type IsNavigableResults = {
	read result: Enum_ContentTrackingResult,
	read isNavigable: boolean,
}

local Wrappers = {}

function Wrappers.GetBestMapForTrackable(
	trackableType: Enum_ContentTrackingType,
	trackableID: number,
	ignoreWaypoint: boolean?
): GetBestMapForTrackableResults
	local r1, r2 = C_ContentTracking.GetBestMapForTrackable(trackableType, trackableID, ignoreWaypoint)
	return {
		result = r1,
		mapID = Maybe.of(r2),
	}
end

function Wrappers.GetBestMapForTrackableInto(
	reuse: GetBestMapForTrackableResults,
	trackableType: Enum_ContentTrackingType,
	trackableID: number,
	ignoreWaypoint: boolean?
): GetBestMapForTrackableResults
	local r1, r2 = C_ContentTracking.GetBestMapForTrackable(trackableType, trackableID, ignoreWaypoint)
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.mapID = Reuse.maybe(fields.mapID, r2)
	return reuse
end

function Wrappers.GetCurrentTrackingTarget(
	type: Enum_ContentTrackingType,
	id: number
): Maybe<GetCurrentTrackingTargetResults>
	local r1, r2 = C_ContentTracking.GetCurrentTrackingTarget(type, id)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		targetType = r1,
		targetID = r2,
	})
end

function Wrappers.GetCurrentTrackingTargetInto(
	reuse: GetCurrentTrackingTargetResults,
	type: Enum_ContentTrackingType,
	id: number
): Maybe<GetCurrentTrackingTargetResults>
	local r1, r2 = C_ContentTracking.GetCurrentTrackingTarget(type, id)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.targetType = r1
	fields.targetID = r2
	return Reuse.just(reuse)
end

function Wrappers.GetEncounterTrackingInfo(journalEncounterID: number): Maybe<EncounterTrackingInfo>
	return Maybe.of(C_ContentTracking.GetEncounterTrackingInfo(journalEncounterID))
end

function Wrappers.GetEncounterTrackingInfoInto(
	reuse: Maybe<EncounterTrackingInfo>,
	journalEncounterID: number
): Maybe<EncounterTrackingInfo>
	return Reuse.maybe(reuse, C_ContentTracking.GetEncounterTrackingInfo(journalEncounterID))
end

function Wrappers.GetNextWaypointForTrackable(
	trackableType: Enum_ContentTrackingType,
	trackableID: number,
	uiMapID: number
): GetNextWaypointForTrackableResults
	local r1, r2 = C_ContentTracking.GetNextWaypointForTrackable(trackableType, trackableID, uiMapID)
	return {
		result = r1,
		mapInfo = Maybe.of(r2),
	}
end

function Wrappers.GetNextWaypointForTrackableInto(
	reuse: GetNextWaypointForTrackableResults,
	trackableType: Enum_ContentTrackingType,
	trackableID: number,
	uiMapID: number
): GetNextWaypointForTrackableResults
	local r1, r2 = C_ContentTracking.GetNextWaypointForTrackable(trackableType, trackableID, uiMapID)
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.mapInfo = Reuse.maybe(fields.mapInfo, r2)
	return reuse
end

function Wrappers.GetObjectiveText(
	targetType: Enum_ContentTrackingTargetType,
	targetID: number,
	includeHyperlinks: boolean?
): Maybe<string>
	return Maybe.of(C_ContentTracking.GetObjectiveText(targetType, targetID, includeHyperlinks))
end

function Wrappers.GetObjectiveTextInto(
	reuse: Maybe<string>,
	targetType: Enum_ContentTrackingTargetType,
	targetID: number,
	includeHyperlinks: boolean?
): Maybe<string>
	return Reuse.maybe(reuse, C_ContentTracking.GetObjectiveText(targetType, targetID, includeHyperlinks))
end

function Wrappers.GetTitle(trackableType: Enum_ContentTrackingType, trackableID: number): Maybe<string>
	return Maybe.of(C_ContentTracking.GetTitle(trackableType, trackableID))
end

function Wrappers.GetTitleInto(
	reuse: Maybe<string>,
	trackableType: Enum_ContentTrackingType,
	trackableID: number
): Maybe<string>
	return Reuse.maybe(reuse, C_ContentTracking.GetTitle(trackableType, trackableID))
end

function Wrappers.GetTrackablesOnMap(
	trackableType: Enum_ContentTrackingType,
	uiMapID: number
): GetTrackablesOnMapResults
	local r1, r2 = C_ContentTracking.GetTrackablesOnMap(trackableType, uiMapID)
	return {
		result = r1,
		trackableMapInfos = r2,
	}
end

function Wrappers.GetTrackablesOnMapInto(
	reuse: GetTrackablesOnMapResults,
	trackableType: Enum_ContentTrackingType,
	uiMapID: number
): GetTrackablesOnMapResults
	local r1, r2 = C_ContentTracking.GetTrackablesOnMap(trackableType, uiMapID)
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.trackableMapInfos = r2
	return reuse
end

function Wrappers.GetVendorTrackingInfo(collectableEntryID: number): Maybe<VendorTrackingInfo>
	return Maybe.of(C_ContentTracking.GetVendorTrackingInfo(collectableEntryID))
end

function Wrappers.GetVendorTrackingInfoInto(
	reuse: Maybe<VendorTrackingInfo>,
	collectableEntryID: number
): Maybe<VendorTrackingInfo>
	return Reuse.maybe(reuse, C_ContentTracking.GetVendorTrackingInfo(collectableEntryID))
end

function Wrappers.GetWaypointText(trackableType: Enum_ContentTrackingType, trackableID: number): Maybe<string>
	return Maybe.of(C_ContentTracking.GetWaypointText(trackableType, trackableID))
end

function Wrappers.GetWaypointTextInto(
	reuse: Maybe<string>,
	trackableType: Enum_ContentTrackingType,
	trackableID: number
): Maybe<string>
	return Reuse.maybe(reuse, C_ContentTracking.GetWaypointText(trackableType, trackableID))
end

function Wrappers.IsNavigable(trackableType: Enum_ContentTrackingType, trackableID: number): IsNavigableResults
	local r1, r2 = C_ContentTracking.IsNavigable(trackableType, trackableID)
	return {
		result = r1,
		isNavigable = r2,
	}
end

function Wrappers.IsNavigableInto(
	reuse: IsNavigableResults,
	trackableType: Enum_ContentTrackingType,
	trackableID: number
): IsNavigableResults
	local r1, r2 = C_ContentTracking.IsNavigable(trackableType, trackableID)
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.isNavigable = r2
	return reuse
end

function Wrappers.StartTracking(type: Enum_ContentTrackingType, id: number): Maybe<Enum_ContentTrackingError>
	return Maybe.of(C_ContentTracking.StartTracking(type, id))
end

function Wrappers.StartTrackingInto(
	reuse: Maybe<Enum_ContentTrackingError>,
	type: Enum_ContentTrackingType,
	id: number
): Maybe<Enum_ContentTrackingError>
	return Reuse.maybe(reuse, C_ContentTracking.StartTracking(type, id))
end

function Wrappers.ToggleTracking(
	type: Enum_ContentTrackingType,
	id: number,
	stopType: Enum_ContentTrackingStopType
): Maybe<Enum_ContentTrackingError>
	return Maybe.of(C_ContentTracking.ToggleTracking(type, id, stopType))
end

function Wrappers.ToggleTrackingInto(
	reuse: Maybe<Enum_ContentTrackingError>,
	type: Enum_ContentTrackingType,
	id: number,
	stopType: Enum_ContentTrackingStopType
): Maybe<Enum_ContentTrackingError>
	return Reuse.maybe(reuse, C_ContentTracking.ToggleTracking(type, id, stopType))
end

return Wrappers
