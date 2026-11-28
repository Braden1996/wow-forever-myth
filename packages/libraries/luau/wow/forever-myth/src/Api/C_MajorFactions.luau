--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetMajorFactionData(majorFactionID: number): Maybe<MajorFactionData>
	return Maybe.of(C_MajorFactions.GetMajorFactionData(majorFactionID))
end

function Wrappers.GetMajorFactionDataInto(
	reuse: Maybe<MajorFactionData>,
	majorFactionID: number
): Maybe<MajorFactionData>
	return Reuse.maybe(reuse, C_MajorFactions.GetMajorFactionData(majorFactionID))
end

function Wrappers.GetMajorFactionProgressionInfo(majorFactionID: number): Maybe<MajorFactionProgressionInfo>
	return Maybe.of(C_MajorFactions.GetMajorFactionProgressionInfo(majorFactionID))
end

function Wrappers.GetMajorFactionProgressionInfoInto(
	reuse: Maybe<MajorFactionProgressionInfo>,
	majorFactionID: number
): Maybe<MajorFactionProgressionInfo>
	return Reuse.maybe(reuse, C_MajorFactions.GetMajorFactionProgressionInfo(majorFactionID))
end

function Wrappers.GetMajorFactionRenownInfo(majorFactionID: number): Maybe<MajorFactionRenownInfo>
	return Maybe.of(C_MajorFactions.GetMajorFactionRenownInfo(majorFactionID))
end

function Wrappers.GetMajorFactionRenownInfoInto(
	reuse: Maybe<MajorFactionRenownInfo>,
	majorFactionID: number
): Maybe<MajorFactionRenownInfo>
	return Reuse.maybe(reuse, C_MajorFactions.GetMajorFactionRenownInfo(majorFactionID))
end

return Wrappers
