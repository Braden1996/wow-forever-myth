--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetRoles(): Maybe<LFGRoles>
	return Maybe.of(C_LFGListRoles.GetRoles())
end

function Wrappers.GetRolesInto(reuse: Maybe<LFGRoles>): Maybe<LFGRoles>
	return Reuse.maybe(reuse, C_LFGListRoles.GetRoles())
end

function Wrappers.GetSavedRoles(): Maybe<LFGRoles>
	return Maybe.of(C_LFGListRoles.GetSavedRoles())
end

function Wrappers.GetSavedRolesInto(reuse: Maybe<LFGRoles>): Maybe<LFGRoles>
	return Reuse.maybe(reuse, C_LFGListRoles.GetSavedRoles())
end

return Wrappers
