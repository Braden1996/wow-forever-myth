--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetMapHighlightInfoAtPositionResults = {
	read fileDataID: fileID,
	read atlasID: textureAtlas,
	read texturePercentageX: number,
	read texturePercentageY: number,
	read textureX: number,
	read textureY: number,
	read scrollChildX: number,
	read scrollChildY: number,
}

export type GetMapHighlightPulseInfoResults = {
	read fileDataID: fileID,
	read atlasID: textureAtlas,
	read texturePercentageX: number,
	read texturePercentageY: number,
	read textureX: number,
	read textureY: number,
	read scrollChildX: number,
	read scrollChildY: number,
}

export type GetMapLevelsResults = {
	read playerMinLevel: number,
	read playerMaxLevel: number,
	read petMinLevel: number,
	read petMaxLevel: number,
}

export type GetMapPosFromWorldPosResults = {
	read uiMapID: number,
	read mapPosition: Vector2DMixin,
}

export type GetMapRectOnMapResults = {
	read minX: number,
	read maxX: number,
	read minY: number,
	read maxY: number,
}

export type GetMapWorldSizeResults = {
	read width: number,
	read height: number,
}

export type GetWorldPosFromMapPosResults = {
	read continentID: number,
	read worldPosition: Vector2DMixin,
}

local Wrappers = {}

function Wrappers.GetBestMapForUnit(unitToken: UnitToken): Maybe<number>
	return Maybe.of(C_Map.GetBestMapForUnit(unitToken))
end

function Wrappers.GetBestMapForUnitInto(reuse: Maybe<number>, unitToken: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, C_Map.GetBestMapForUnit(unitToken))
end

function Wrappers.GetMapArtID(uiMapID: number): Maybe<number>
	return Maybe.of(C_Map.GetMapArtID(uiMapID))
end

function Wrappers.GetMapArtIDInto(reuse: Maybe<number>, uiMapID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Map.GetMapArtID(uiMapID))
end

function Wrappers.GetMapArtLayerTextures(uiMapID: number, layerIndex: number): Maybe<{ fileID }>
	return Maybe.of(C_Map.GetMapArtLayerTextures(uiMapID, layerIndex))
end

function Wrappers.GetMapArtLayerTexturesInto(
	reuse: Maybe<{ fileID }>,
	uiMapID: number,
	layerIndex: number
): Maybe<{ fileID }>
	return Reuse.maybe(reuse, C_Map.GetMapArtLayerTextures(uiMapID, layerIndex))
end

function Wrappers.GetMapArtLayers(uiMapID: number): Maybe<{ UiMapLayerInfo }>
	return Maybe.of(C_Map.GetMapArtLayers(uiMapID))
end

function Wrappers.GetMapArtLayersInto(reuse: Maybe<{ UiMapLayerInfo }>, uiMapID: number): Maybe<{ UiMapLayerInfo }>
	return Reuse.maybe(reuse, C_Map.GetMapArtLayers(uiMapID))
end

function Wrappers.GetMapChildrenInfo(
	uiMapID: number,
	mapType: Enum_UIMapType?,
	allDescendants: boolean?
): Maybe<{ UiMapDetails }>
	return Maybe.of(C_Map.GetMapChildrenInfo(uiMapID, mapType, allDescendants))
end

function Wrappers.GetMapChildrenInfoInto(
	reuse: Maybe<{ UiMapDetails }>,
	uiMapID: number,
	mapType: Enum_UIMapType?,
	allDescendants: boolean?
): Maybe<{ UiMapDetails }>
	return Reuse.maybe(reuse, C_Map.GetMapChildrenInfo(uiMapID, mapType, allDescendants))
end

function Wrappers.GetMapDisplayInfo(uiMapID: number): Maybe<boolean>
	return Maybe.of(C_Map.GetMapDisplayInfo(uiMapID))
end

function Wrappers.GetMapDisplayInfoInto(reuse: Maybe<boolean>, uiMapID: number): Maybe<boolean>
	return Reuse.maybe(reuse, C_Map.GetMapDisplayInfo(uiMapID))
end

function Wrappers.GetMapGroupID(uiMapID: number): Maybe<number>
	return Maybe.of(C_Map.GetMapGroupID(uiMapID))
end

function Wrappers.GetMapGroupIDInto(reuse: Maybe<number>, uiMapID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Map.GetMapGroupID(uiMapID))
end

function Wrappers.GetMapGroupMembersInfo(uiMapGroupID: number): Maybe<{ UiMapGroupMemberInfo }>
	return Maybe.of(C_Map.GetMapGroupMembersInfo(uiMapGroupID))
end

function Wrappers.GetMapGroupMembersInfoInto(
	reuse: Maybe<{ UiMapGroupMemberInfo }>,
	uiMapGroupID: number
): Maybe<{ UiMapGroupMemberInfo }>
	return Reuse.maybe(reuse, C_Map.GetMapGroupMembersInfo(uiMapGroupID))
end

function Wrappers.GetMapHighlightInfoAtPosition(
	uiMapID: number,
	x: number,
	y: number
): Maybe<GetMapHighlightInfoAtPositionResults>
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_Map.GetMapHighlightInfoAtPosition(uiMapID, x, y)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		fileDataID = r1,
		atlasID = r2,
		texturePercentageX = r3,
		texturePercentageY = r4,
		textureX = r5,
		textureY = r6,
		scrollChildX = r7,
		scrollChildY = r8,
	})
end

function Wrappers.GetMapHighlightInfoAtPositionInto(
	reuse: GetMapHighlightInfoAtPositionResults,
	uiMapID: number,
	x: number,
	y: number
): Maybe<GetMapHighlightInfoAtPositionResults>
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_Map.GetMapHighlightInfoAtPosition(uiMapID, x, y)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.fileDataID = r1
	fields.atlasID = r2
	fields.texturePercentageX = r3
	fields.texturePercentageY = r4
	fields.textureX = r5
	fields.textureY = r6
	fields.scrollChildX = r7
	fields.scrollChildY = r8
	return Reuse.just(reuse)
end

function Wrappers.GetMapHighlightPulseInfo(uiMapID: number): Maybe<GetMapHighlightPulseInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_Map.GetMapHighlightPulseInfo(uiMapID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		fileDataID = r1,
		atlasID = r2,
		texturePercentageX = r3,
		texturePercentageY = r4,
		textureX = r5,
		textureY = r6,
		scrollChildX = r7,
		scrollChildY = r8,
	})
end

function Wrappers.GetMapHighlightPulseInfoInto(
	reuse: GetMapHighlightPulseInfoResults,
	uiMapID: number
): Maybe<GetMapHighlightPulseInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8 = C_Map.GetMapHighlightPulseInfo(uiMapID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.fileDataID = r1
	fields.atlasID = r2
	fields.texturePercentageX = r3
	fields.texturePercentageY = r4
	fields.textureX = r5
	fields.textureY = r6
	fields.scrollChildX = r7
	fields.scrollChildY = r8
	return Reuse.just(reuse)
end

function Wrappers.GetMapInfo(uiMapID: number): Maybe<UiMapDetails>
	return Maybe.of(C_Map.GetMapInfo(uiMapID))
end

function Wrappers.GetMapInfoInto(reuse: Maybe<UiMapDetails>, uiMapID: number): Maybe<UiMapDetails>
	return Reuse.maybe(reuse, C_Map.GetMapInfo(uiMapID))
end

function Wrappers.GetMapInfoAtPosition(
	uiMapID: number,
	x: number,
	y: number,
	ignoreZoneMapPositionData: boolean?
): Maybe<UiMapDetails>
	return Maybe.of(C_Map.GetMapInfoAtPosition(uiMapID, x, y, ignoreZoneMapPositionData))
end

function Wrappers.GetMapInfoAtPositionInto(
	reuse: Maybe<UiMapDetails>,
	uiMapID: number,
	x: number,
	y: number,
	ignoreZoneMapPositionData: boolean?
): Maybe<UiMapDetails>
	return Reuse.maybe(reuse, C_Map.GetMapInfoAtPosition(uiMapID, x, y, ignoreZoneMapPositionData))
end

function Wrappers.GetMapLevels(uiMapID: number): Maybe<GetMapLevelsResults>
	local r1, r2, r3, r4 = C_Map.GetMapLevels(uiMapID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		playerMinLevel = r1,
		playerMaxLevel = r2,
		petMinLevel = r3,
		petMaxLevel = r4,
	})
end

function Wrappers.GetMapLevelsInto(reuse: GetMapLevelsResults, uiMapID: number): Maybe<GetMapLevelsResults>
	local r1, r2, r3, r4 = C_Map.GetMapLevels(uiMapID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.playerMinLevel = r1
	fields.playerMaxLevel = r2
	fields.petMinLevel = r3
	fields.petMaxLevel = r4
	return Reuse.just(reuse)
end

function Wrappers.GetMapPosFromWorldPos(
	continentID: number,
	worldPosition: Vector2DMixin,
	overrideUiMapID: number?
): Maybe<GetMapPosFromWorldPosResults>
	local r1, r2 = C_Map.GetMapPosFromWorldPos(continentID, worldPosition, overrideUiMapID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		uiMapID = r1,
		mapPosition = r2,
	})
end

function Wrappers.GetMapPosFromWorldPosInto(
	reuse: GetMapPosFromWorldPosResults,
	continentID: number,
	worldPosition: Vector2DMixin,
	overrideUiMapID: number?
): Maybe<GetMapPosFromWorldPosResults>
	local r1, r2 = C_Map.GetMapPosFromWorldPos(continentID, worldPosition, overrideUiMapID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.uiMapID = r1
	fields.mapPosition = r2
	return Reuse.just(reuse)
end

function Wrappers.GetMapRectOnMap(uiMapID: number, topUiMapID: number): Maybe<GetMapRectOnMapResults>
	local r1, r2, r3, r4 = C_Map.GetMapRectOnMap(uiMapID, topUiMapID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		minX = r1,
		maxX = r2,
		minY = r3,
		maxY = r4,
	})
end

function Wrappers.GetMapRectOnMapInto(
	reuse: GetMapRectOnMapResults,
	uiMapID: number,
	topUiMapID: number
): Maybe<GetMapRectOnMapResults>
	local r1, r2, r3, r4 = C_Map.GetMapRectOnMap(uiMapID, topUiMapID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.minX = r1
	fields.maxX = r2
	fields.minY = r3
	fields.maxY = r4
	return Reuse.just(reuse)
end

function Wrappers.GetMapWorldSize(uiMapID: number): GetMapWorldSizeResults
	local r1, r2 = C_Map.GetMapWorldSize(uiMapID)
	return {
		width = r1,
		height = r2,
	}
end

function Wrappers.GetMapWorldSizeInto(reuse: GetMapWorldSizeResults, uiMapID: number): GetMapWorldSizeResults
	local r1, r2 = C_Map.GetMapWorldSize(uiMapID)
	local fields = Reuse.fields(reuse)
	fields.width = r1
	fields.height = r2
	return reuse
end

function Wrappers.GetPlayerMapPosition(uiMapID: number, unitToken: UnitToken): Maybe<Vector2DMixin>
	return Maybe.of(C_Map.GetPlayerMapPosition(uiMapID, unitToken))
end

function Wrappers.GetPlayerMapPositionInto(
	reuse: Maybe<Vector2DMixin>,
	uiMapID: number,
	unitToken: UnitToken
): Maybe<Vector2DMixin>
	return Reuse.maybe(reuse, C_Map.GetPlayerMapPosition(uiMapID, unitToken))
end

function Wrappers.GetUserWaypoint(): Maybe<UiMapPoint>
	return Maybe.of(C_Map.GetUserWaypoint())
end

function Wrappers.GetUserWaypointInto(reuse: Maybe<UiMapPoint>): Maybe<UiMapPoint>
	return Reuse.maybe(reuse, C_Map.GetUserWaypoint())
end

function Wrappers.GetUserWaypointFromHyperlink(hyperlink: string): Maybe<UiMapPoint>
	return Maybe.of(C_Map.GetUserWaypointFromHyperlink(hyperlink))
end

function Wrappers.GetUserWaypointFromHyperlinkInto(reuse: Maybe<UiMapPoint>, hyperlink: string): Maybe<UiMapPoint>
	return Reuse.maybe(reuse, C_Map.GetUserWaypointFromHyperlink(hyperlink))
end

function Wrappers.GetUserWaypointHyperlink(): Maybe<string>
	return Maybe.of(C_Map.GetUserWaypointHyperlink())
end

function Wrappers.GetUserWaypointHyperlinkInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_Map.GetUserWaypointHyperlink())
end

function Wrappers.GetUserWaypointPositionForMap(uiMapID: number): Maybe<Vector2DMixin>
	return Maybe.of(C_Map.GetUserWaypointPositionForMap(uiMapID))
end

function Wrappers.GetUserWaypointPositionForMapInto(reuse: Maybe<Vector2DMixin>, uiMapID: number): Maybe<Vector2DMixin>
	return Reuse.maybe(reuse, C_Map.GetUserWaypointPositionForMap(uiMapID))
end

function Wrappers.GetWorldPosFromMapPos(
	uiMapID: number,
	mapPosition: Vector2DMixin
): Maybe<GetWorldPosFromMapPosResults>
	local r1, r2 = C_Map.GetWorldPosFromMapPos(uiMapID, mapPosition)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		continentID = r1,
		worldPosition = r2,
	})
end

function Wrappers.GetWorldPosFromMapPosInto(
	reuse: GetWorldPosFromMapPosResults,
	uiMapID: number,
	mapPosition: Vector2DMixin
): Maybe<GetWorldPosFromMapPosResults>
	local r1, r2 = C_Map.GetWorldPosFromMapPos(uiMapID, mapPosition)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.continentID = r1
	fields.worldPosition = r2
	return Reuse.just(reuse)
end

return Wrappers
