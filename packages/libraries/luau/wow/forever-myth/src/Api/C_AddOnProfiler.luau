--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.CheckForPerformanceMessage(): Maybe<AddOnPerformanceMessage>
	return Maybe.of(C_AddOnProfiler.CheckForPerformanceMessage())
end

function Wrappers.CheckForPerformanceMessageInto(reuse: Maybe<AddOnPerformanceMessage>): Maybe<AddOnPerformanceMessage>
	return Reuse.maybe(reuse, C_AddOnProfiler.CheckForPerformanceMessage())
end

return Wrappers
