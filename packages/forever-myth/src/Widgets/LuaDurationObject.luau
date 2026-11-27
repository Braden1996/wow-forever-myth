--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetClock(object: LuaDurationObject): Maybe<unknown>
	return Maybe.of(object:GetClock())
end

function Wrappers.GetClockInto(reuse: Maybe<unknown>, object: LuaDurationObject): Maybe<unknown>
	return Reuse.maybe(reuse, object:GetClock())
end

return Wrappers
