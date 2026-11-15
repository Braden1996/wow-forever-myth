--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetChromieTimeExpansionOption(expansionRecID: number): Maybe<ChromieTimeExpansionInfo>
	return Maybe.of(C_ChromieTime.GetChromieTimeExpansionOption(expansionRecID))
end

function Wrappers.GetChromieTimeExpansionOptionInto(
	reuse: Maybe<ChromieTimeExpansionInfo>,
	expansionRecID: number
): Maybe<ChromieTimeExpansionInfo>
	return Reuse.maybe(reuse, C_ChromieTime.GetChromieTimeExpansionOption(expansionRecID))
end

return Wrappers
