--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type IsAreaPOITimedResults = {
	read isTimed: boolean,
	read hideTimerInTooltip: Maybe<boolean>,
}

local Wrappers = {}

function Wrappers.GetAreaPOIInfo(uiMapID: number?, areaPoiID: number): Maybe<AreaPOIInfo>
	return Maybe.of(C_AreaPoiInfo.GetAreaPOIInfo(uiMapID, areaPoiID))
end

function Wrappers.GetAreaPOIInfoInto(reuse: Maybe<AreaPOIInfo>, uiMapID: number?, areaPoiID: number): Maybe<AreaPOIInfo>
	return Reuse.maybe(reuse, C_AreaPoiInfo.GetAreaPOIInfo(uiMapID, areaPoiID))
end

function Wrappers.GetAreaPOISecondsLeft(areaPoiID: number): Maybe<number>
	return Maybe.of(C_AreaPoiInfo.GetAreaPOISecondsLeft(areaPoiID))
end

function Wrappers.GetAreaPOISecondsLeftInto(reuse: Maybe<number>, areaPoiID: number): Maybe<number>
	return Reuse.maybe(reuse, C_AreaPoiInfo.GetAreaPOISecondsLeft(areaPoiID))
end

function Wrappers.IsAreaPOITimed(areaPoiID: number): IsAreaPOITimedResults
	local r1, r2 = C_AreaPoiInfo.IsAreaPOITimed(areaPoiID)
	return {
		isTimed = r1,
		hideTimerInTooltip = Maybe.of(r2),
	}
end

function Wrappers.IsAreaPOITimedInto(reuse: IsAreaPOITimedResults, areaPoiID: number): IsAreaPOITimedResults
	local r1, r2 = C_AreaPoiInfo.IsAreaPOITimed(areaPoiID)
	local fields = Reuse.fields(reuse)
	fields.isTimed = r1
	fields.hideTimerInTooltip = Reuse.maybe(fields.hideTimerInTooltip, r2)
	return reuse
end

return Wrappers
