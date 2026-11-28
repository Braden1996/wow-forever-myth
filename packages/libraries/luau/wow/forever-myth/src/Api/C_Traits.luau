--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Result<T, E> = Result.Result<T, E>

export type GetStagedChangesResults = {
	read nodeIDsWithPurchases: { number },
	read nodeIDsWithRefunds: { number },
	read nodeIDsWithSelectionSwaps: { number },
}

export type GetTraitCurrencyInfoResults = {
	read flags: number,
	read type: number,
	read currencyTypesID: Maybe<number>,
	read icon: Maybe<number>,
}

local Wrappers = {}

function Wrappers.CanEditConfig(configID: number): Result<true, string>
	local r1, r2 = C_Traits.CanEditConfig(configID)
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.GetConditionInfo(configID: number, condID: number): Maybe<TraitCondInfo>
	return Maybe.of(C_Traits.GetConditionInfo(configID, condID))
end

function Wrappers.GetConditionInfoInto(
	reuse: Maybe<TraitCondInfo>,
	configID: number,
	condID: number
): Maybe<TraitCondInfo>
	return Reuse.maybe(reuse, C_Traits.GetConditionInfo(configID, condID))
end

function Wrappers.GetConfigIDBySystemID(systemID: number): Maybe<number>
	return Maybe.of(C_Traits.GetConfigIDBySystemID(systemID))
end

function Wrappers.GetConfigIDBySystemIDInto(reuse: Maybe<number>, systemID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Traits.GetConfigIDBySystemID(systemID))
end

function Wrappers.GetConfigIDByTreeID(treeID: number): Maybe<number>
	return Maybe.of(C_Traits.GetConfigIDByTreeID(treeID))
end

function Wrappers.GetConfigIDByTreeIDInto(reuse: Maybe<number>, treeID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Traits.GetConfigIDByTreeID(treeID))
end

function Wrappers.GetConfigInfo(configID: number): Maybe<TraitConfigInfo>
	return Maybe.of(C_Traits.GetConfigInfo(configID))
end

function Wrappers.GetConfigInfoInto(reuse: Maybe<TraitConfigInfo>, configID: number): Maybe<TraitConfigInfo>
	return Reuse.maybe(reuse, C_Traits.GetConfigInfo(configID))
end

function Wrappers.GetConfigVariationID(systemID: number): Maybe<number>
	return Maybe.of(C_Traits.GetConfigVariationID(systemID))
end

function Wrappers.GetConfigVariationIDInto(reuse: Maybe<number>, systemID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Traits.GetConfigVariationID(systemID))
end

function Wrappers.GetDefinitionInfo(definitionID: number): Maybe<TraitDefinitionInfo>
	return Maybe.of(C_Traits.GetDefinitionInfo(definitionID))
end

function Wrappers.GetDefinitionInfoInto(
	reuse: Maybe<TraitDefinitionInfo>,
	definitionID: number
): Maybe<TraitDefinitionInfo>
	return Reuse.maybe(reuse, C_Traits.GetDefinitionInfo(definitionID))
end

function Wrappers.GetEntryInfo(configID: number, entryID: number): Maybe<TraitEntryInfo>
	return Maybe.of(C_Traits.GetEntryInfo(configID, entryID))
end

function Wrappers.GetEntryInfoInto(
	reuse: Maybe<TraitEntryInfo>,
	configID: number,
	entryID: number
): Maybe<TraitEntryInfo>
	return Reuse.maybe(reuse, C_Traits.GetEntryInfo(configID, entryID))
end

function Wrappers.GetIncreasedTraitData(nodeID: number, entryID: number): Maybe<{ IncreasedTraitData }>
	return Maybe.of(C_Traits.GetIncreasedTraitData(nodeID, entryID))
end

function Wrappers.GetIncreasedTraitDataInto(
	reuse: Maybe<{ IncreasedTraitData }>,
	nodeID: number,
	entryID: number
): Maybe<{ IncreasedTraitData }>
	return Reuse.maybe(reuse, C_Traits.GetIncreasedTraitData(nodeID, entryID))
end

function Wrappers.GetNodeInfo(configID: number, nodeID: number): Maybe<TraitNodeInfo>
	return Maybe.of(C_Traits.GetNodeInfo(configID, nodeID))
end

function Wrappers.GetNodeInfoInto(reuse: Maybe<TraitNodeInfo>, configID: number, nodeID: number): Maybe<TraitNodeInfo>
	return Reuse.maybe(reuse, C_Traits.GetNodeInfo(configID, nodeID))
end

function Wrappers.GetStagedChanges(configID: number): Maybe<GetStagedChangesResults>
	local r1, r2, r3 = C_Traits.GetStagedChanges(configID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		nodeIDsWithPurchases = r1,
		nodeIDsWithRefunds = r2,
		nodeIDsWithSelectionSwaps = r3,
	})
end

function Wrappers.GetStagedChangesInto(reuse: GetStagedChangesResults, configID: number): Maybe<GetStagedChangesResults>
	local r1, r2, r3 = C_Traits.GetStagedChanges(configID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.nodeIDsWithPurchases = r1
	fields.nodeIDsWithRefunds = r2
	fields.nodeIDsWithSelectionSwaps = r3
	return Reuse.just(reuse)
end

function Wrappers.GetSubTreeInfo(configID: number, subTreeID: number): Maybe<TraitSubTreeInfo>
	return Maybe.of(C_Traits.GetSubTreeInfo(configID, subTreeID))
end

function Wrappers.GetSubTreeInfoInto(
	reuse: Maybe<TraitSubTreeInfo>,
	configID: number,
	subTreeID: number
): Maybe<TraitSubTreeInfo>
	return Reuse.maybe(reuse, C_Traits.GetSubTreeInfo(configID, subTreeID))
end

function Wrappers.GetSystemIDByTreeID(treeID: number): Maybe<number>
	return Maybe.of(C_Traits.GetSystemIDByTreeID(treeID))
end

function Wrappers.GetSystemIDByTreeIDInto(reuse: Maybe<number>, treeID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Traits.GetSystemIDByTreeID(treeID))
end

function Wrappers.GetTraitCurrencyInfo(traitCurrencyID: number): GetTraitCurrencyInfoResults
	local r1, r2, r3, r4 = C_Traits.GetTraitCurrencyInfo(traitCurrencyID)
	return {
		flags = r1,
		type = r2,
		currencyTypesID = Maybe.of(r3),
		icon = Maybe.of(r4),
	}
end

function Wrappers.GetTraitCurrencyInfoInto(
	reuse: GetTraitCurrencyInfoResults,
	traitCurrencyID: number
): GetTraitCurrencyInfoResults
	local r1, r2, r3, r4 = C_Traits.GetTraitCurrencyInfo(traitCurrencyID)
	local fields = Reuse.fields(reuse)
	fields.flags = r1
	fields.type = r2
	fields.currencyTypesID = Reuse.maybe(fields.currencyTypesID, r3)
	fields.icon = Reuse.maybe(fields.icon, r4)
	return reuse
end

function Wrappers.GetTraitDescription(entryID: number, rank: number): Maybe<string>
	return Maybe.of(C_Traits.GetTraitDescription(entryID, rank))
end

function Wrappers.GetTraitDescriptionInto(reuse: Maybe<string>, entryID: number, rank: number): Maybe<string>
	return Reuse.maybe(reuse, C_Traits.GetTraitDescription(entryID, rank))
end

function Wrappers.GetTraitSystemFlags(configID: number): Maybe<number>
	return Maybe.of(C_Traits.GetTraitSystemFlags(configID))
end

function Wrappers.GetTraitSystemFlagsInto(reuse: Maybe<number>, configID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Traits.GetTraitSystemFlags(configID))
end

function Wrappers.GetTraitSystemWidgetSetID(configID: number): Maybe<number>
	return Maybe.of(C_Traits.GetTraitSystemWidgetSetID(configID))
end

function Wrappers.GetTraitSystemWidgetSetIDInto(reuse: Maybe<number>, configID: number): Maybe<number>
	return Reuse.maybe(reuse, C_Traits.GetTraitSystemWidgetSetID(configID))
end

function Wrappers.GetTreeInfo(configID: number, treeID: number): Maybe<TraitTreeInfo>
	return Maybe.of(C_Traits.GetTreeInfo(configID, treeID))
end

function Wrappers.GetTreeInfoInto(reuse: Maybe<TraitTreeInfo>, configID: number, treeID: number): Maybe<TraitTreeInfo>
	return Reuse.maybe(reuse, C_Traits.GetTreeInfo(configID, treeID))
end

function Wrappers.GetTreeNodes(treeID: number): Maybe<{ number }>
	return Maybe.of(C_Traits.GetTreeNodes(treeID))
end

function Wrappers.GetTreeNodesInto(reuse: Maybe<{ number }>, treeID: number): Maybe<{ number }>
	return Reuse.maybe(reuse, C_Traits.GetTreeNodes(treeID))
end

return Wrappers
