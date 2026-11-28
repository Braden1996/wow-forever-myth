--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetEventTrackResults = {
	read track: Enum_EncounterTimelineTrack,
	read trackSortIndex: Maybe<number>,
}

local Wrappers = {}

function Wrappers.GetEventColor(
	eventID: EncounterTimelineEventID,
	overrideTrigger: Enum_EncounterEventColorTrigger?
): Maybe<ColorMixin>
	return Maybe.of(C_EncounterTimeline.GetEventColor(eventID, overrideTrigger))
end

function Wrappers.GetEventColorInto(
	reuse: Maybe<ColorMixin>,
	eventID: EncounterTimelineEventID,
	overrideTrigger: Enum_EncounterEventColorTrigger?
): Maybe<ColorMixin>
	return Reuse.maybe(reuse, C_EncounterTimeline.GetEventColor(eventID, overrideTrigger))
end

function Wrappers.GetEventInfo(eventID: EncounterTimelineEventID): Maybe<EncounterTimelineEventInfo>
	return Maybe.of(C_EncounterTimeline.GetEventInfo(eventID))
end

function Wrappers.GetEventInfoInto(
	reuse: Maybe<EncounterTimelineEventInfo>,
	eventID: EncounterTimelineEventID
): Maybe<EncounterTimelineEventInfo>
	return Reuse.maybe(reuse, C_EncounterTimeline.GetEventInfo(eventID))
end

function Wrappers.GetEventState(eventID: EncounterTimelineEventID): Maybe<Enum_EncounterTimelineEventState>
	return Maybe.of(C_EncounterTimeline.GetEventState(eventID))
end

function Wrappers.GetEventStateInto(
	reuse: Maybe<Enum_EncounterTimelineEventState>,
	eventID: EncounterTimelineEventID
): Maybe<Enum_EncounterTimelineEventState>
	return Reuse.maybe(reuse, C_EncounterTimeline.GetEventState(eventID))
end

function Wrappers.GetEventTimeElapsed(eventID: EncounterTimelineEventID): Maybe<number>
	return Maybe.of(C_EncounterTimeline.GetEventTimeElapsed(eventID))
end

function Wrappers.GetEventTimeElapsedInto(reuse: Maybe<number>, eventID: EncounterTimelineEventID): Maybe<number>
	return Reuse.maybe(reuse, C_EncounterTimeline.GetEventTimeElapsed(eventID))
end

function Wrappers.GetEventTimeRemaining(eventID: EncounterTimelineEventID): Maybe<number>
	return Maybe.of(C_EncounterTimeline.GetEventTimeRemaining(eventID))
end

function Wrappers.GetEventTimeRemainingInto(reuse: Maybe<number>, eventID: EncounterTimelineEventID): Maybe<number>
	return Reuse.maybe(reuse, C_EncounterTimeline.GetEventTimeRemaining(eventID))
end

function Wrappers.GetEventTimer(eventID: EncounterTimelineEventID): Maybe<LuaDurationObject>
	return Maybe.of(C_EncounterTimeline.GetEventTimer(eventID))
end

function Wrappers.GetEventTimerInto(
	reuse: Maybe<LuaDurationObject>,
	eventID: EncounterTimelineEventID
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, C_EncounterTimeline.GetEventTimer(eventID))
end

function Wrappers.GetEventTrack(eventID: EncounterTimelineEventID): Maybe<GetEventTrackResults>
	local r1, r2 = C_EncounterTimeline.GetEventTrack(eventID)
	if r1 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		track = r1,
		trackSortIndex = Maybe.of(r2),
	})
end

function Wrappers.GetEventTrackInto(
	reuse: GetEventTrackResults,
	eventID: EncounterTimelineEventID
): Maybe<GetEventTrackResults>
	local r1, r2 = C_EncounterTimeline.GetEventTrack(eventID)
	if r1 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.track = r1
	fields.trackSortIndex = Reuse.maybe(fields.trackSortIndex, r2)
	return Reuse.just(reuse)
end

function Wrappers.IsEventBlocked(eventID: EncounterTimelineEventID): Maybe<boolean>
	return Maybe.of(C_EncounterTimeline.IsEventBlocked(eventID))
end

function Wrappers.IsEventBlockedInto(reuse: Maybe<boolean>, eventID: EncounterTimelineEventID): Maybe<boolean>
	return Reuse.maybe(reuse, C_EncounterTimeline.IsEventBlocked(eventID))
end

return Wrappers
