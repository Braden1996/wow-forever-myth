--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Result<T, E> = Result.Result<T, E>

export type GetDisplayedMountInfoResults = {
	read name: string,
	read spellID: number,
	read icon: fileID,
	read isActive: boolean,
	read isUsable: boolean,
	read sourceType: number,
	read isFavorite: boolean,
	read isFactionSpecific: boolean,
	read faction: Maybe<Enum_PvPFaction>,
	read shouldHideOnChar: boolean,
	read isCollected: boolean,
	read mountID: number,
	read isSteadyFlight: boolean,
}

export type GetDisplayedMountInfoExtraResults = {
	read creatureDisplayInfoID: Maybe<number>,
	read description: string,
	read source: string,
	read isSelfMount: boolean,
	read mountTypeID: number,
	read uiModelSceneID: number,
	read animID: number,
	read spellVisualKitID: number,
	read disablePlayerMountPreview: boolean,
}

export type GetIsFavoriteResults = {
	read isFavorite: boolean,
	read canSetFavorite: boolean,
}

export type GetMountInfoByIDResults = {
	read name: string,
	read spellID: number,
	read icon: fileID,
	read isActive: boolean,
	read isUsable: boolean,
	read sourceType: number,
	read isFavorite: boolean,
	read isFactionSpecific: boolean,
	read faction: Maybe<Enum_PvPFaction>,
	read shouldHideOnChar: boolean,
	read isCollected: boolean,
	read mountID: number,
	read isSteadyFlight: boolean,
}

export type GetMountInfoExtraByIDResults = {
	read creatureDisplayInfoID: Maybe<number>,
	read description: string,
	read source: string,
	read isSelfMount: boolean,
	read mountTypeID: number,
	read uiModelSceneID: number,
	read animID: number,
	read spellVisualKitID: number,
	read disablePlayerMountPreview: boolean,
}

local Wrappers = {}

function Wrappers.GetAppliedMountEquipmentID(): Maybe<number>
	return Maybe.of(C_MountJournal.GetAppliedMountEquipmentID())
end

function Wrappers.GetAppliedMountEquipmentIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_MountJournal.GetAppliedMountEquipmentID())
end

function Wrappers.GetDisplayedMountAllCreatureDisplayInfo(mountIndex: number): Maybe<{ MountCreatureDisplayInfo }>
	return Maybe.of(C_MountJournal.GetDisplayedMountAllCreatureDisplayInfo(mountIndex))
end

function Wrappers.GetDisplayedMountAllCreatureDisplayInfoInto(
	reuse: Maybe<{ MountCreatureDisplayInfo }>,
	mountIndex: number
): Maybe<{ MountCreatureDisplayInfo }>
	return Reuse.maybe(reuse, C_MountJournal.GetDisplayedMountAllCreatureDisplayInfo(mountIndex))
end

function Wrappers.GetDisplayedMountInfo(displayIndex: number): Maybe<GetDisplayedMountInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_MountJournal.GetDisplayedMountInfo(displayIndex)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		spellID = r2,
		icon = r3,
		isActive = r4,
		isUsable = r5,
		sourceType = r6,
		isFavorite = r7,
		isFactionSpecific = r8,
		faction = Maybe.of(r9),
		shouldHideOnChar = r10,
		isCollected = r11,
		mountID = r12,
		isSteadyFlight = r13,
	})
end

function Wrappers.GetDisplayedMountInfoInto(
	reuse: GetDisplayedMountInfoResults,
	displayIndex: number
): Maybe<GetDisplayedMountInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_MountJournal.GetDisplayedMountInfo(displayIndex)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.spellID = r2
	fields.icon = r3
	fields.isActive = r4
	fields.isUsable = r5
	fields.sourceType = r6
	fields.isFavorite = r7
	fields.isFactionSpecific = r8
	fields.faction = Reuse.maybe(fields.faction, r9)
	fields.shouldHideOnChar = r10
	fields.isCollected = r11
	fields.mountID = r12
	fields.isSteadyFlight = r13
	return Reuse.just(reuse)
end

function Wrappers.GetDisplayedMountInfoExtra(mountIndex: number): Maybe<GetDisplayedMountInfoExtraResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = C_MountJournal.GetDisplayedMountInfoExtra(mountIndex)
	if r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil or r9 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		creatureDisplayInfoID = Maybe.of(r1),
		description = r2,
		source = r3,
		isSelfMount = r4,
		mountTypeID = r5,
		uiModelSceneID = r6,
		animID = r7,
		spellVisualKitID = r8,
		disablePlayerMountPreview = r9,
	})
end

function Wrappers.GetDisplayedMountInfoExtraInto(
	reuse: GetDisplayedMountInfoExtraResults,
	mountIndex: number
): Maybe<GetDisplayedMountInfoExtraResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = C_MountJournal.GetDisplayedMountInfoExtra(mountIndex)
	if r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil or r9 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.creatureDisplayInfoID = Reuse.maybe(fields.creatureDisplayInfoID, r1)
	fields.description = r2
	fields.source = r3
	fields.isSelfMount = r4
	fields.mountTypeID = r5
	fields.uiModelSceneID = r6
	fields.animID = r7
	fields.spellVisualKitID = r8
	fields.disablePlayerMountPreview = r9
	return Reuse.just(reuse)
end

function Wrappers.GetIsFavorite(mountIndex: number): GetIsFavoriteResults
	local r1, r2 = C_MountJournal.GetIsFavorite(mountIndex)
	return {
		isFavorite = r1,
		canSetFavorite = r2,
	}
end

function Wrappers.GetIsFavoriteInto(reuse: GetIsFavoriteResults, mountIndex: number): GetIsFavoriteResults
	local r1, r2 = C_MountJournal.GetIsFavorite(mountIndex)
	local fields = Reuse.fields(reuse)
	fields.isFavorite = r1
	fields.canSetFavorite = r2
	return reuse
end

function Wrappers.GetMountAllCreatureDisplayInfoByID(mountID: number): Maybe<{ MountCreatureDisplayInfo }>
	return Maybe.of(C_MountJournal.GetMountAllCreatureDisplayInfoByID(mountID))
end

function Wrappers.GetMountAllCreatureDisplayInfoByIDInto(
	reuse: Maybe<{ MountCreatureDisplayInfo }>,
	mountID: number
): Maybe<{ MountCreatureDisplayInfo }>
	return Reuse.maybe(reuse, C_MountJournal.GetMountAllCreatureDisplayInfoByID(mountID))
end

function Wrappers.GetMountFromItem(itemID: number): Maybe<number>
	return Maybe.of(C_MountJournal.GetMountFromItem(itemID))
end

function Wrappers.GetMountFromItemInto(reuse: Maybe<number>, itemID: number): Maybe<number>
	return Reuse.maybe(reuse, C_MountJournal.GetMountFromItem(itemID))
end

function Wrappers.GetMountFromSpell(spellID: SpellIdentifier): Maybe<number>
	return Maybe.of(C_MountJournal.GetMountFromSpell(spellID))
end

function Wrappers.GetMountFromSpellInto(reuse: Maybe<number>, spellID: SpellIdentifier): Maybe<number>
	return Reuse.maybe(reuse, C_MountJournal.GetMountFromSpell(spellID))
end

function Wrappers.GetMountInfoByID(mountID: number): Maybe<GetMountInfoByIDResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_MountJournal.GetMountInfoByID(mountID)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		spellID = r2,
		icon = r3,
		isActive = r4,
		isUsable = r5,
		sourceType = r6,
		isFavorite = r7,
		isFactionSpecific = r8,
		faction = Maybe.of(r9),
		shouldHideOnChar = r10,
		isCollected = r11,
		mountID = r12,
		isSteadyFlight = r13,
	})
end

function Wrappers.GetMountInfoByIDInto(reuse: GetMountInfoByIDResults, mountID: number): Maybe<GetMountInfoByIDResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_MountJournal.GetMountInfoByID(mountID)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.spellID = r2
	fields.icon = r3
	fields.isActive = r4
	fields.isUsable = r5
	fields.sourceType = r6
	fields.isFavorite = r7
	fields.isFactionSpecific = r8
	fields.faction = Reuse.maybe(fields.faction, r9)
	fields.shouldHideOnChar = r10
	fields.isCollected = r11
	fields.mountID = r12
	fields.isSteadyFlight = r13
	return Reuse.just(reuse)
end

function Wrappers.GetMountInfoExtraByID(mountID: number): Maybe<GetMountInfoExtraByIDResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = C_MountJournal.GetMountInfoExtraByID(mountID)
	if r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil or r9 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		creatureDisplayInfoID = Maybe.of(r1),
		description = r2,
		source = r3,
		isSelfMount = r4,
		mountTypeID = r5,
		uiModelSceneID = r6,
		animID = r7,
		spellVisualKitID = r8,
		disablePlayerMountPreview = r9,
	})
end

function Wrappers.GetMountInfoExtraByIDInto(
	reuse: GetMountInfoExtraByIDResults,
	mountID: number
): Maybe<GetMountInfoExtraByIDResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = C_MountJournal.GetMountInfoExtraByID(mountID)
	if r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil or r8 == nil or r9 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.creatureDisplayInfoID = Reuse.maybe(fields.creatureDisplayInfoID, r1)
	fields.description = r2
	fields.source = r3
	fields.isSelfMount = r4
	fields.mountTypeID = r5
	fields.uiModelSceneID = r6
	fields.animID = r7
	fields.spellVisualKitID = r8
	fields.disablePlayerMountPreview = r9
	return Reuse.just(reuse)
end

function Wrappers.GetMountLink(spellID: number): Maybe<string>
	return Maybe.of(C_MountJournal.GetMountLink(spellID))
end

function Wrappers.GetMountLinkInto(reuse: Maybe<string>, spellID: number): Maybe<string>
	return Reuse.maybe(reuse, C_MountJournal.GetMountLink(spellID))
end

function Wrappers.GetMountUsabilityByID(mountID: number, checkIndoors: boolean): Result<true, string>
	local r1, r2 = C_MountJournal.GetMountUsabilityByID(mountID, checkIndoors)
	if r1 then
		return Result.ok(true)
	end
	return Result.err(if r2 == nil then "" else r2)
end

return Wrappers
