--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCursorItem(): Maybe<ItemLocationMixin>
	return Maybe.of(C_Cursor.GetCursorItem())
end

function Wrappers.GetCursorItemInto(reuse: Maybe<ItemLocationMixin>): Maybe<ItemLocationMixin>
	return Reuse.maybe(reuse, C_Cursor.GetCursorItem())
end

return Wrappers
