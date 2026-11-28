--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCovenantData(covenantID: number): Maybe<CovenantData>
	return Maybe.of(C_Covenants.GetCovenantData(covenantID))
end

function Wrappers.GetCovenantDataInto(reuse: Maybe<CovenantData>, covenantID: number): Maybe<CovenantData>
	return Reuse.maybe(reuse, C_Covenants.GetCovenantData(covenantID))
end

return Wrappers
