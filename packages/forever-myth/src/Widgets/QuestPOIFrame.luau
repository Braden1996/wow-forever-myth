--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type UpdateMouseOverTooltipResults = {
	read questID: Maybe<number>,
	read numObjectives: Maybe<number>,
}

local Wrappers = {}

function Wrappers.UpdateMouseOverTooltip(object: QuestPOIFrame, x: number, y: number): UpdateMouseOverTooltipResults
	local r1, r2 = object:UpdateMouseOverTooltip(x, y)
	return {
		questID = Maybe.of(r1),
		numObjectives = Maybe.of(r2),
	}
end

function Wrappers.UpdateMouseOverTooltipInto(
	reuse: UpdateMouseOverTooltipResults,
	object: QuestPOIFrame,
	x: number,
	y: number
): UpdateMouseOverTooltipResults
	local r1, r2 = object:UpdateMouseOverTooltip(x, y)
	local fields = Reuse.fields(reuse)
	fields.questID = Reuse.maybe(fields.questID, r1)
	fields.numObjectives = Reuse.maybe(fields.numObjectives, r2)
	return reuse
end

return Wrappers
