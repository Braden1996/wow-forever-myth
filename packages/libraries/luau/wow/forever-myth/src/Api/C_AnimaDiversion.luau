--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAnimaDiversionNodes(): Maybe<{ AnimaDiversionNodeInfo }>
	return Maybe.of(C_AnimaDiversion.GetAnimaDiversionNodes())
end

function Wrappers.GetAnimaDiversionNodesInto(
	reuse: Maybe<{ AnimaDiversionNodeInfo }>
): Maybe<{ AnimaDiversionNodeInfo }>
	return Reuse.maybe(reuse, C_AnimaDiversion.GetAnimaDiversionNodes())
end

function Wrappers.GetOriginPosition(): Maybe<Vector2DMixin>
	return Maybe.of(C_AnimaDiversion.GetOriginPosition())
end

function Wrappers.GetOriginPositionInto(reuse: Maybe<Vector2DMixin>): Maybe<Vector2DMixin>
	return Reuse.maybe(reuse, C_AnimaDiversion.GetOriginPosition())
end

return Wrappers
