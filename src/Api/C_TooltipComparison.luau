--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetItemComparisonDelta(
	comparisonItem: TooltipComparisonItem,
	equippedItem: TooltipComparisonItem,
	pairedItem: TooltipComparisonItem?,
	addPairedStats: boolean?
): Maybe<{ string }>
	return Maybe.of(
		C_TooltipComparison.GetItemComparisonDelta(comparisonItem, equippedItem, pairedItem, addPairedStats)
	)
end

function Wrappers.GetItemComparisonDeltaInto(
	reuse: Maybe<{ string }>,
	comparisonItem: TooltipComparisonItem,
	equippedItem: TooltipComparisonItem,
	pairedItem: TooltipComparisonItem?,
	addPairedStats: boolean?
): Maybe<{ string }>
	return Reuse.maybe(
		reuse,
		C_TooltipComparison.GetItemComparisonDelta(comparisonItem, equippedItem, pairedItem, addPairedStats)
	)
end

function Wrappers.GetItemComparisonInfo(comparisonItem: TooltipComparisonItem): Maybe<TooltipItemComparisonInfo>
	return Maybe.of(C_TooltipComparison.GetItemComparisonInfo(comparisonItem))
end

function Wrappers.GetItemComparisonInfoInto(
	reuse: Maybe<TooltipItemComparisonInfo>,
	comparisonItem: TooltipComparisonItem
): Maybe<TooltipItemComparisonInfo>
	return Reuse.maybe(reuse, C_TooltipComparison.GetItemComparisonInfo(comparisonItem))
end

return Wrappers
