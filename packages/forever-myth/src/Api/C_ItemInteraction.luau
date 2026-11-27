--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetItemInteractionInfo(): Maybe<ItemInteractionFrameInfo>
	return Maybe.of(C_ItemInteraction.GetItemInteractionInfo())
end

function Wrappers.GetItemInteractionInfoInto(reuse: Maybe<ItemInteractionFrameInfo>): Maybe<ItemInteractionFrameInfo>
	return Reuse.maybe(reuse, C_ItemInteraction.GetItemInteractionInfo())
end

return Wrappers
