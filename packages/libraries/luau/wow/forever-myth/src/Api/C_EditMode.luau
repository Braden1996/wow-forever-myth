--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.ConvertStringToLayoutInfo(layoutInfoAsString: string): Maybe<EditModeLayoutInfo>
	return Maybe.of(C_EditMode.ConvertStringToLayoutInfo(layoutInfoAsString))
end

function Wrappers.ConvertStringToLayoutInfoInto(
	reuse: Maybe<EditModeLayoutInfo>,
	layoutInfoAsString: string
): Maybe<EditModeLayoutInfo>
	return Reuse.maybe(reuse, C_EditMode.ConvertStringToLayoutInfo(layoutInfoAsString))
end

return Wrappers
