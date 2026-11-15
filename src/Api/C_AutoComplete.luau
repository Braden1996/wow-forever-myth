--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAutoCompletePresenceID(name: string): Maybe<number>
	return Maybe.of(C_AutoComplete.GetAutoCompletePresenceID(name))
end

function Wrappers.GetAutoCompletePresenceIDInto(reuse: Maybe<number>, name: string): Maybe<number>
	return Reuse.maybe(reuse, C_AutoComplete.GetAutoCompletePresenceID(name))
end

return Wrappers
