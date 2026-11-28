--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Result<T, E> = Result.Result<T, E>

export type CanChangeTalentsResults = {
	read canChange: boolean,
	read canAdd: boolean,
	read changeError: Maybe<string>,
}

export type GetHeroTalentSpecsForClassSpecResults = {
	read subTreeIDs: Maybe<{ number }>,
	read requiredPlayerLevel: Maybe<number>,
}

export type GetNextStarterBuildPurchaseResults = {
	read nodeID: Maybe<number>,
	read entryID: Maybe<number>,
}

export type HasUnspentHeroTalentPointsResults = {
	read hasUnspentPoints: boolean,
	read numHeroPoints: number,
}

export type HasUnspentTalentPointsResults = {
	read hasUnspentPoints: boolean,
	read numClassPoints: number,
	read numSpecPoints: number,
}

export type LoadConfigResults = {
	read result: Enum_LoadConfigResult,
	read changeError: Maybe<string>,
	read newLearnedNodeIDs: { number },
}

local Wrappers = {}

function Wrappers.CanChangeTalents(): CanChangeTalentsResults
	local r1, r2, r3 = C_ClassTalents.CanChangeTalents()
	return {
		canChange = r1,
		canAdd = r2,
		changeError = Maybe.of(r3),
	}
end

function Wrappers.CanChangeTalentsInto(reuse: CanChangeTalentsResults): CanChangeTalentsResults
	local r1, r2, r3 = C_ClassTalents.CanChangeTalents()
	local fields = Reuse.fields(reuse)
	fields.canChange = r1
	fields.canAdd = r2
	fields.changeError = Reuse.maybe(fields.changeError, r3)
	return reuse
end

function Wrappers.CanEditTalents(): Result<true, string>
	local r1, r2 = C_ClassTalents.CanEditTalents()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.GetActiveConfigID(): Maybe<number>
	return Maybe.of(C_ClassTalents.GetActiveConfigID())
end

function Wrappers.GetActiveConfigIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_ClassTalents.GetActiveConfigID())
end

function Wrappers.GetActiveHeroTalentSpec(): Maybe<number>
	return Maybe.of(C_ClassTalents.GetActiveHeroTalentSpec())
end

function Wrappers.GetActiveHeroTalentSpecInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_ClassTalents.GetActiveHeroTalentSpec())
end

function Wrappers.GetHeroTalentSpecsForClassSpec(
	configID: number?,
	classSpecID: number?
): Maybe<GetHeroTalentSpecsForClassSpecResults>
	local r1, r2 = C_ClassTalents.GetHeroTalentSpecsForClassSpec(configID, classSpecID)
	if r1 == nil and r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		subTreeIDs = Maybe.of(r1),
		requiredPlayerLevel = Maybe.of(r2),
	})
end

function Wrappers.GetHeroTalentSpecsForClassSpecInto(
	reuse: GetHeroTalentSpecsForClassSpecResults,
	configID: number?,
	classSpecID: number?
): Maybe<GetHeroTalentSpecsForClassSpecResults>
	local r1, r2 = C_ClassTalents.GetHeroTalentSpecsForClassSpec(configID, classSpecID)
	if r1 == nil and r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.subTreeIDs = Reuse.maybe(fields.subTreeIDs, r1)
	fields.requiredPlayerLevel = Reuse.maybe(fields.requiredPlayerLevel, r2)
	return Reuse.just(reuse)
end

function Wrappers.GetLastSelectedSavedConfigID(specID: number): Maybe<number>
	return Maybe.of(C_ClassTalents.GetLastSelectedSavedConfigID(specID))
end

function Wrappers.GetLastSelectedSavedConfigIDInto(reuse: Maybe<number>, specID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ClassTalents.GetLastSelectedSavedConfigID(specID))
end

function Wrappers.GetNextStarterBuildPurchase(): GetNextStarterBuildPurchaseResults
	local r1, r2 = C_ClassTalents.GetNextStarterBuildPurchase()
	return {
		nodeID = Maybe.of(r1),
		entryID = Maybe.of(r2),
	}
end

function Wrappers.GetNextStarterBuildPurchaseInto(
	reuse: GetNextStarterBuildPurchaseResults
): GetNextStarterBuildPurchaseResults
	local r1, r2 = C_ClassTalents.GetNextStarterBuildPurchase()
	local fields = Reuse.fields(reuse)
	fields.nodeID = Reuse.maybe(fields.nodeID, r1)
	fields.entryID = Reuse.maybe(fields.entryID, r2)
	return reuse
end

function Wrappers.GetTraitTreeForSpec(specID: number): Maybe<number>
	return Maybe.of(C_ClassTalents.GetTraitTreeForSpec(specID))
end

function Wrappers.GetTraitTreeForSpecInto(reuse: Maybe<number>, specID: number): Maybe<number>
	return Reuse.maybe(reuse, C_ClassTalents.GetTraitTreeForSpec(specID))
end

function Wrappers.HasUnspentHeroTalentPoints(): HasUnspentHeroTalentPointsResults
	local r1, r2 = C_ClassTalents.HasUnspentHeroTalentPoints()
	return {
		hasUnspentPoints = r1,
		numHeroPoints = r2,
	}
end

function Wrappers.HasUnspentHeroTalentPointsInto(
	reuse: HasUnspentHeroTalentPointsResults
): HasUnspentHeroTalentPointsResults
	local r1, r2 = C_ClassTalents.HasUnspentHeroTalentPoints()
	local fields = Reuse.fields(reuse)
	fields.hasUnspentPoints = r1
	fields.numHeroPoints = r2
	return reuse
end

function Wrappers.HasUnspentTalentPoints(): HasUnspentTalentPointsResults
	local r1, r2, r3 = C_ClassTalents.HasUnspentTalentPoints()
	return {
		hasUnspentPoints = r1,
		numClassPoints = r2,
		numSpecPoints = r3,
	}
end

function Wrappers.HasUnspentTalentPointsInto(reuse: HasUnspentTalentPointsResults): HasUnspentTalentPointsResults
	local r1, r2, r3 = C_ClassTalents.HasUnspentTalentPoints()
	local fields = Reuse.fields(reuse)
	fields.hasUnspentPoints = r1
	fields.numClassPoints = r2
	fields.numSpecPoints = r3
	return reuse
end

function Wrappers.ImportLoadout(
	configID: number,
	entries: { ImportLoadoutEntryInfo },
	name: string,
	importString: string?
): Result<true, string>
	local r1, r2 = C_ClassTalents.ImportLoadout(configID, entries, name, importString)
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.LoadConfig(configID: number, autoApply: boolean): LoadConfigResults
	local r1, r2, r3 = C_ClassTalents.LoadConfig(configID, autoApply)
	return {
		result = r1,
		changeError = Maybe.of(r2),
		newLearnedNodeIDs = r3,
	}
end

function Wrappers.LoadConfigInto(reuse: LoadConfigResults, configID: number, autoApply: boolean): LoadConfigResults
	local r1, r2, r3 = C_ClassTalents.LoadConfig(configID, autoApply)
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.changeError = Reuse.maybe(fields.changeError, r2)
	fields.newLearnedNodeIDs = r3
	return reuse
end

return Wrappers
