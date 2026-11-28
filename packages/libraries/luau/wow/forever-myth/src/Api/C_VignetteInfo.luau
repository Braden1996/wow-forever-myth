--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetRecommendedGroupSizeResults = {
	read minGroupSize: number,
	read maxGroupSize: number,
}

export type GetVignettePositionResults = {
	read vignettePosition: Vector2DMixin,
	read vignetteFacing: Maybe<number>,
}

local Wrappers = {}

function Wrappers.FindBestUniqueVignette(vignetteGUIDs: { WOWGUID }): Maybe<number>
	return Maybe.of(C_VignetteInfo.FindBestUniqueVignette(vignetteGUIDs))
end

function Wrappers.FindBestUniqueVignetteInto(reuse: Maybe<number>, vignetteGUIDs: { WOWGUID }): Maybe<number>
	return Reuse.maybe(reuse, C_VignetteInfo.FindBestUniqueVignette(vignetteGUIDs))
end

function Wrappers.GetHealthPercent(vignetteGUID: WOWGUID): Maybe<number>
	return Maybe.of(C_VignetteInfo.GetHealthPercent(vignetteGUID))
end

function Wrappers.GetHealthPercentInto(reuse: Maybe<number>, vignetteGUID: WOWGUID): Maybe<number>
	return Reuse.maybe(reuse, C_VignetteInfo.GetHealthPercent(vignetteGUID))
end

function Wrappers.GetRecommendedGroupSize(vignetteGUID: WOWGUID): Maybe<GetRecommendedGroupSizeResults>
	local r1, r2 = C_VignetteInfo.GetRecommendedGroupSize(vignetteGUID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		minGroupSize = r1,
		maxGroupSize = r2,
	})
end

function Wrappers.GetRecommendedGroupSizeInto(
	reuse: GetRecommendedGroupSizeResults,
	vignetteGUID: WOWGUID
): Maybe<GetRecommendedGroupSizeResults>
	local r1, r2 = C_VignetteInfo.GetRecommendedGroupSize(vignetteGUID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.minGroupSize = r1
	fields.maxGroupSize = r2
	return Reuse.just(reuse)
end

function Wrappers.GetVignetteInfo(vignetteGUID: WOWGUID): Maybe<VignetteInfo>
	return Maybe.of(C_VignetteInfo.GetVignetteInfo(vignetteGUID))
end

function Wrappers.GetVignetteInfoInto(reuse: Maybe<VignetteInfo>, vignetteGUID: WOWGUID): Maybe<VignetteInfo>
	return Reuse.maybe(reuse, C_VignetteInfo.GetVignetteInfo(vignetteGUID))
end

function Wrappers.GetVignettePosition(vignetteGUID: WOWGUID, uiMapID: number): Maybe<GetVignettePositionResults>
	local r1, r2 = C_VignetteInfo.GetVignettePosition(vignetteGUID, uiMapID)
	if r1 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		vignettePosition = r1,
		vignetteFacing = Maybe.of(r2),
	})
end

function Wrappers.GetVignettePositionInto(
	reuse: GetVignettePositionResults,
	vignetteGUID: WOWGUID,
	uiMapID: number
): Maybe<GetVignettePositionResults>
	local r1, r2 = C_VignetteInfo.GetVignettePosition(vignetteGUID, uiMapID)
	if r1 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.vignettePosition = r1
	fields.vignetteFacing = Reuse.maybe(fields.vignetteFacing, r2)
	return Reuse.just(reuse)
end

return Wrappers
