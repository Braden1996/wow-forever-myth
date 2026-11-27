--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type EventGetInviteSortCriterionResults = {
	read criterion: string,
	read reverse: boolean,
}

local Wrappers = {}

function Wrappers.ContextMenuEventGetCalendarType(): Maybe<string>
	return Maybe.of(C_Calendar.ContextMenuEventGetCalendarType())
end

function Wrappers.ContextMenuEventGetCalendarTypeInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_Calendar.ContextMenuEventGetCalendarType())
end

function Wrappers.ContextMenuGetEventIndex(): Maybe<CalendarEventIndexInfo>
	return Maybe.of(C_Calendar.ContextMenuGetEventIndex())
end

function Wrappers.ContextMenuGetEventIndexInto(reuse: Maybe<CalendarEventIndexInfo>): Maybe<CalendarEventIndexInfo>
	return Reuse.maybe(reuse, C_Calendar.ContextMenuGetEventIndex())
end

function Wrappers.EventGetCalendarType(): Maybe<string>
	return Maybe.of(C_Calendar.EventGetCalendarType())
end

function Wrappers.EventGetCalendarTypeInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, C_Calendar.EventGetCalendarType())
end

function Wrappers.EventGetClubId(): Maybe<ClubId>
	return Maybe.of(C_Calendar.EventGetClubId())
end

function Wrappers.EventGetClubIdInto(reuse: Maybe<ClubId>): Maybe<ClubId>
	return Reuse.maybe(reuse, C_Calendar.EventGetClubId())
end

function Wrappers.EventGetInvite(eventIndex: number): Maybe<CalendarEventInviteInfo>
	return Maybe.of(C_Calendar.EventGetInvite(eventIndex))
end

function Wrappers.EventGetInviteInto(
	reuse: Maybe<CalendarEventInviteInfo>,
	eventIndex: number
): Maybe<CalendarEventInviteInfo>
	return Reuse.maybe(reuse, C_Calendar.EventGetInvite(eventIndex))
end

function Wrappers.EventGetInviteResponseTime(eventIndex: number): Maybe<CalendarTime>
	return Maybe.of(C_Calendar.EventGetInviteResponseTime(eventIndex))
end

function Wrappers.EventGetInviteResponseTimeInto(reuse: Maybe<CalendarTime>, eventIndex: number): Maybe<CalendarTime>
	return Reuse.maybe(reuse, C_Calendar.EventGetInviteResponseTime(eventIndex))
end

function Wrappers.EventGetInviteSortCriterion(): EventGetInviteSortCriterionResults
	local r1, r2 = C_Calendar.EventGetInviteSortCriterion()
	return {
		criterion = r1,
		reverse = r2,
	}
end

function Wrappers.EventGetInviteSortCriterionInto(
	reuse: EventGetInviteSortCriterionResults
): EventGetInviteSortCriterionResults
	local r1, r2 = C_Calendar.EventGetInviteSortCriterion()
	local fields = Reuse.fields(reuse)
	fields.criterion = r1
	fields.reverse = r2
	return reuse
end

function Wrappers.EventGetSelectedInvite(): Maybe<number>
	return Maybe.of(C_Calendar.EventGetSelectedInvite())
end

function Wrappers.EventGetSelectedInviteInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_Calendar.EventGetSelectedInvite())
end

function Wrappers.GetDayEvent(monthOffset: number, monthDay: number, index: number): Maybe<CalendarDayEvent>
	return Maybe.of(C_Calendar.GetDayEvent(monthOffset, monthDay, index))
end

function Wrappers.GetDayEventInto(
	reuse: Maybe<CalendarDayEvent>,
	monthOffset: number,
	monthDay: number,
	index: number
): Maybe<CalendarDayEvent>
	return Reuse.maybe(reuse, C_Calendar.GetDayEvent(monthOffset, monthDay, index))
end

function Wrappers.GetEventIndex(): Maybe<CalendarEventIndexInfo>
	return Maybe.of(C_Calendar.GetEventIndex())
end

function Wrappers.GetEventIndexInto(reuse: Maybe<CalendarEventIndexInfo>): Maybe<CalendarEventIndexInfo>
	return Reuse.maybe(reuse, C_Calendar.GetEventIndex())
end

function Wrappers.GetEventIndexInfo(
	eventID: CalendarEventID,
	monthOffset: number?,
	monthDay: number?
): Maybe<CalendarEventIndexInfo>
	return Maybe.of(C_Calendar.GetEventIndexInfo(eventID, monthOffset, monthDay))
end

function Wrappers.GetEventIndexInfoInto(
	reuse: Maybe<CalendarEventIndexInfo>,
	eventID: CalendarEventID,
	monthOffset: number?,
	monthDay: number?
): Maybe<CalendarEventIndexInfo>
	return Reuse.maybe(reuse, C_Calendar.GetEventIndexInfo(eventID, monthOffset, monthDay))
end

function Wrappers.GetEventInfo(): Maybe<CalendarEventInfo>
	return Maybe.of(C_Calendar.GetEventInfo())
end

function Wrappers.GetEventInfoInto(reuse: Maybe<CalendarEventInfo>): Maybe<CalendarEventInfo>
	return Reuse.maybe(reuse, C_Calendar.GetEventInfo())
end

function Wrappers.GetFirstPendingInvite(offsetMonths: number, monthDay: number): Maybe<number>
	return Maybe.of(C_Calendar.GetFirstPendingInvite(offsetMonths, monthDay))
end

function Wrappers.GetFirstPendingInviteInto(reuse: Maybe<number>, offsetMonths: number, monthDay: number): Maybe<number>
	return Reuse.maybe(reuse, C_Calendar.GetFirstPendingInvite(offsetMonths, monthDay))
end

function Wrappers.GetGuildEventInfo(index: number): Maybe<CalendarGuildEventInfo>
	return Maybe.of(C_Calendar.GetGuildEventInfo(index))
end

function Wrappers.GetGuildEventInfoInto(
	reuse: Maybe<CalendarGuildEventInfo>,
	index: number
): Maybe<CalendarGuildEventInfo>
	return Reuse.maybe(reuse, C_Calendar.GetGuildEventInfo(index))
end

function Wrappers.GetGuildEventSelectionInfo(index: number): Maybe<CalendarEventIndexInfo>
	return Maybe.of(C_Calendar.GetGuildEventSelectionInfo(index))
end

function Wrappers.GetGuildEventSelectionInfoInto(
	reuse: Maybe<CalendarEventIndexInfo>,
	index: number
): Maybe<CalendarEventIndexInfo>
	return Reuse.maybe(reuse, C_Calendar.GetGuildEventSelectionInfo(index))
end

function Wrappers.GetHolidayInfo(monthOffset: number, monthDay: number, index: number): Maybe<CalendarHolidayInfo>
	return Maybe.of(C_Calendar.GetHolidayInfo(monthOffset, monthDay, index))
end

function Wrappers.GetHolidayInfoInto(
	reuse: Maybe<CalendarHolidayInfo>,
	monthOffset: number,
	monthDay: number,
	index: number
): Maybe<CalendarHolidayInfo>
	return Reuse.maybe(reuse, C_Calendar.GetHolidayInfo(monthOffset, monthDay, index))
end

function Wrappers.GetNextClubId(): Maybe<ClubId>
	return Maybe.of(C_Calendar.GetNextClubId())
end

function Wrappers.GetNextClubIdInto(reuse: Maybe<ClubId>): Maybe<ClubId>
	return Reuse.maybe(reuse, C_Calendar.GetNextClubId())
end

function Wrappers.GetRaidInfo(offsetMonths: number, monthDay: number, eventIndex: number): Maybe<CalendarRaidInfo>
	return Maybe.of(C_Calendar.GetRaidInfo(offsetMonths, monthDay, eventIndex))
end

function Wrappers.GetRaidInfoInto(
	reuse: Maybe<CalendarRaidInfo>,
	offsetMonths: number,
	monthDay: number,
	eventIndex: number
): Maybe<CalendarRaidInfo>
	return Reuse.maybe(reuse, C_Calendar.GetRaidInfo(offsetMonths, monthDay, eventIndex))
end

return Wrappers
