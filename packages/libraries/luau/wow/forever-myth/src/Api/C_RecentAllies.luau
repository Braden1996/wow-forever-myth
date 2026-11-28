--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.CanSetRecentAllyNote(characterGUID: WOWGUID): Maybe<boolean>
	return Maybe.of(C_RecentAllies.CanSetRecentAllyNote(characterGUID))
end

function Wrappers.CanSetRecentAllyNoteInto(reuse: Maybe<boolean>, characterGUID: WOWGUID): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecentAllies.CanSetRecentAllyNote(characterGUID))
end

function Wrappers.GetRecentAllies(): Maybe<{ RecentAllyData }>
	return Maybe.of(C_RecentAllies.GetRecentAllies())
end

function Wrappers.GetRecentAlliesInto(reuse: Maybe<{ RecentAllyData }>): Maybe<{ RecentAllyData }>
	return Reuse.maybe(reuse, C_RecentAllies.GetRecentAllies())
end

function Wrappers.GetRecentAllyByFullName(fullCharacterName: string): Maybe<RecentAllyData>
	return Maybe.of(C_RecentAllies.GetRecentAllyByFullName(fullCharacterName))
end

function Wrappers.GetRecentAllyByFullNameInto(
	reuse: Maybe<RecentAllyData>,
	fullCharacterName: string
): Maybe<RecentAllyData>
	return Reuse.maybe(reuse, C_RecentAllies.GetRecentAllyByFullName(fullCharacterName))
end

function Wrappers.GetRecentAllyByGUID(characterGUID: WOWGUID): Maybe<RecentAllyData>
	return Maybe.of(C_RecentAllies.GetRecentAllyByGUID(characterGUID))
end

function Wrappers.GetRecentAllyByGUIDInto(reuse: Maybe<RecentAllyData>, characterGUID: WOWGUID): Maybe<RecentAllyData>
	return Reuse.maybe(reuse, C_RecentAllies.GetRecentAllyByGUID(characterGUID))
end

function Wrappers.IsRecentAllyByFullName(fullCharacterName: string): Maybe<boolean>
	return Maybe.of(C_RecentAllies.IsRecentAllyByFullName(fullCharacterName))
end

function Wrappers.IsRecentAllyByFullNameInto(reuse: Maybe<boolean>, fullCharacterName: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecentAllies.IsRecentAllyByFullName(fullCharacterName))
end

function Wrappers.IsRecentAllyByGUID(characterGUID: WOWGUID): Maybe<boolean>
	return Maybe.of(C_RecentAllies.IsRecentAllyByGUID(characterGUID))
end

function Wrappers.IsRecentAllyByGUIDInto(reuse: Maybe<boolean>, characterGUID: WOWGUID): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecentAllies.IsRecentAllyByGUID(characterGUID))
end

function Wrappers.IsRecentAllyDataReady(): Maybe<boolean>
	return Maybe.of(C_RecentAllies.IsRecentAllyDataReady())
end

function Wrappers.IsRecentAllyDataReadyInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecentAllies.IsRecentAllyDataReady())
end

function Wrappers.IsRecentAllyPinned(characterGUID: WOWGUID): Maybe<boolean>
	return Maybe.of(C_RecentAllies.IsRecentAllyPinned(characterGUID))
end

function Wrappers.IsRecentAllyPinnedInto(reuse: Maybe<boolean>, characterGUID: WOWGUID): Maybe<boolean>
	return Reuse.maybe(reuse, C_RecentAllies.IsRecentAllyPinned(characterGUID))
end

function Wrappers.SearchRecentAllies(searchInfo: RecentAlliesSearchInfo): Maybe<{ RecentAllyData }>
	return Maybe.of(C_RecentAllies.SearchRecentAllies(searchInfo))
end

function Wrappers.SearchRecentAlliesInto(
	reuse: Maybe<{ RecentAllyData }>,
	searchInfo: RecentAlliesSearchInfo
): Maybe<{ RecentAllyData }>
	return Reuse.maybe(reuse, C_RecentAllies.SearchRecentAllies(searchInfo))
end

return Wrappers
