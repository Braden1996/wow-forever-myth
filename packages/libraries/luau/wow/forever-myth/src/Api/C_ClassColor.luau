--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetClassColor(className: string, tintColor: ColorMixin?): Maybe<ColorMixin>
	return Maybe.of(C_ClassColor.GetClassColor(className, tintColor))
end

function Wrappers.GetClassColorInto(
	reuse: Maybe<ColorMixin>,
	className: string,
	tintColor: ColorMixin?
): Maybe<ColorMixin>
	return Reuse.maybe(reuse, C_ClassColor.GetClassColor(className, tintColor))
end

return Wrappers
