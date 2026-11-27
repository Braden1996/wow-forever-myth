--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetActiveContinentName(): Maybe<string>
	return Maybe.of(C_EventScheduler.GetActiveContinentName())
end

function Wrappers.GetActiveContinentNameInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_EventScheduler.GetActiveContinentName())
end

function Wrappers.GetEventUiMapID(areaPoiID: number): Maybe<number>
	return Maybe.of(C_EventScheduler.GetEventUiMapID(areaPoiID))
end

function Wrappers.GetEventUiMapIDInto(reuse: Maybe<number>, areaPoiID: number): Maybe<number>
	return Reuse.maybe(reuse, C_EventScheduler.GetEventUiMapID(areaPoiID))
end

function Wrappers.GetEventZoneName(areaPoiID: number): Maybe<string>
	return Maybe.of(C_EventScheduler.GetEventZoneName(areaPoiID))
end

function Wrappers.GetEventZoneNameInto(reuse: Maybe<string>, areaPoiID: number): Maybe<string>
	return Reuse.maybe(reuse, C_EventScheduler.GetEventZoneName(areaPoiID))
end

function Wrappers.GetOngoingEvents(): Maybe<{ OngoingEventInfo }>
	return Maybe.of(C_EventScheduler.GetOngoingEvents())
end

function Wrappers.GetOngoingEventsInto(reuse: Maybe<{ OngoingEventInfo }>): Maybe<{ OngoingEventInfo }>
	return Reuse.maybe(reuse, C_EventScheduler.GetOngoingEvents())
end

function Wrappers.GetScheduledEvents(): Maybe<{ ScheduledEventInfo }>
	return Maybe.of(C_EventScheduler.GetScheduledEvents())
end

function Wrappers.GetScheduledEventsInto(reuse: Maybe<{ ScheduledEventInfo }>): Maybe<{ ScheduledEventInfo }>
	return Reuse.maybe(reuse, C_EventScheduler.GetScheduledEvents())
end

return Wrappers
