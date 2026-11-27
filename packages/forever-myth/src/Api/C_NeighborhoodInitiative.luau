--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetInitiativeActivityLogInfo(): Maybe<InitiativeActivityLogInfo>
	return Maybe.of(C_NeighborhoodInitiative.GetInitiativeActivityLogInfo())
end

function Wrappers.GetInitiativeActivityLogInfoInto(
	reuse: Maybe<InitiativeActivityLogInfo>
): Maybe<InitiativeActivityLogInfo>
	return Reuse.maybe(reuse, C_NeighborhoodInitiative.GetInitiativeActivityLogInfo())
end

function Wrappers.GetInitiativeTaskInfo(initiativeTaskID: number): Maybe<InitiativeTaskInfo>
	return Maybe.of(C_NeighborhoodInitiative.GetInitiativeTaskInfo(initiativeTaskID))
end

function Wrappers.GetInitiativeTaskInfoInto(
	reuse: Maybe<InitiativeTaskInfo>,
	initiativeTaskID: number
): Maybe<InitiativeTaskInfo>
	return Reuse.maybe(reuse, C_NeighborhoodInitiative.GetInitiativeTaskInfo(initiativeTaskID))
end

function Wrappers.GetNeighborhoodInitiativeInfo(): Maybe<NeighborhoodInitiativeInfo>
	return Maybe.of(C_NeighborhoodInitiative.GetNeighborhoodInitiativeInfo())
end

function Wrappers.GetNeighborhoodInitiativeInfoInto(
	reuse: Maybe<NeighborhoodInitiativeInfo>
): Maybe<NeighborhoodInitiativeInfo>
	return Reuse.maybe(reuse, C_NeighborhoodInitiative.GetNeighborhoodInitiativeInfo())
end

return Wrappers
