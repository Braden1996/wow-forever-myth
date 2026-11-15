--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCovenantInfoForPlayerChoiceResponseID(playerChoiceResponseID: number): Maybe<CovenantPreviewInfo>
	return Maybe.of(C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID(playerChoiceResponseID))
end

function Wrappers.GetCovenantInfoForPlayerChoiceResponseIDInto(
	reuse: Maybe<CovenantPreviewInfo>,
	playerChoiceResponseID: number
): Maybe<CovenantPreviewInfo>
	return Reuse.maybe(reuse, C_CovenantPreview.GetCovenantInfoForPlayerChoiceResponseID(playerChoiceResponseID))
end

return Wrappers
