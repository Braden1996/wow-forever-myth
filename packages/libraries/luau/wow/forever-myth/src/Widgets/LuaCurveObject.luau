--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetPoint(object: LuaCurveObject, index: number): Maybe<Vector2DMixin>
	return Maybe.of(object:GetPoint(index))
end

function Wrappers.GetPointInto(reuse: Maybe<Vector2DMixin>, object: LuaCurveObject, index: number): Maybe<Vector2DMixin>
	return Reuse.maybe(reuse, object:GetPoint(index))
end

return Wrappers
