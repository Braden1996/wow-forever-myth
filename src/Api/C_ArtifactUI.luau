--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetAppearanceInfoResults = {
	read artifactAppearanceID: number,
	read appearanceName: string,
	read displayIndex: number,
	read unlocked: boolean,
	read failureDescription: Maybe<string>,
	read uiCameraID: number,
	read altHandCameraID: Maybe<number>,
	read swatchColorR: number,
	read swatchColorG: number,
	read swatchColorB: number,
	read modelOpacity: number,
	read modelSaturation: number,
	read obtainable: boolean,
}

export type GetAppearanceInfoByIDResults = {
	read artifactAppearanceSetID: number,
	read artifactAppearanceID: number,
	read appearanceName: string,
	read displayIndex: number,
	read unlocked: boolean,
	read failureDescription: Maybe<string>,
	read uiCameraID: number,
	read altHandCameraID: Maybe<number>,
	read swatchColorR: number,
	read swatchColorG: number,
	read swatchColorB: number,
	read modelOpacity: number,
	read modelSaturation: number,
	read obtainable: boolean,
}

export type GetAppearanceSetInfoResults = {
	read artifactAppearanceSetID: number,
	read appearanceSetName: string,
	read appearanceSetDescription: string,
	read numAppearances: number,
}

export type GetArtifactInfoResults = {
	read itemID: number,
	read altItemID: Maybe<number>,
	read name: string,
	read icon: fileID,
	read xp: number,
	read pointsSpent: number,
	read quality: Enum_ItemQuality,
	read artifactAppearanceID: number,
	read appearanceModID: number,
	read itemAppearanceID: Maybe<number>,
	read altItemAppearanceID: Maybe<number>,
	read altOnTop: boolean,
	read tier: ArtifactTiers,
}

export type GetArtifactXPRewardTargetInfoResults = {
	read name: string,
	read icon: fileID,
}

export type GetEquippedArtifactInfoResults = {
	read itemID: number,
	read altItemID: Maybe<number>,
	read name: string,
	read icon: fileID,
	read xp: number,
	read pointsSpent: number,
	read quality: Enum_ItemQuality,
	read artifactAppearanceID: number,
	read appearanceModID: number,
	read itemAppearanceID: Maybe<number>,
	read altItemAppearanceID: Maybe<number>,
	read altOnTop: boolean,
	read tier: ArtifactTiers,
}

export type GetEquippedArtifactRelicInfoResults = {
	read name: string,
	read icon: fileID,
	read slotTypeName: string,
	read link: string,
}

export type GetForgeRotationResults = {
	read forgeRotationX: number,
	read forgeRotationY: number,
	read forgeRotationZ: number,
}

export type GetRelicInfoResults = {
	read name: string,
	read icon: fileID,
	read slotTypeName: string,
	read link: string,
}

export type GetRelicInfoByItemIDResults = {
	read name: string,
	read icon: fileID,
	read slotTypeName: string,
	read link: string,
}

export type GetRespecArtifactInfoResults = {
	read itemID: number,
	read altItemID: Maybe<number>,
	read name: string,
	read icon: fileID,
	read xp: number,
	read pointsSpent: number,
	read quality: Enum_ItemQuality,
	read artifactAppearanceID: number,
	read appearanceModID: number,
	read itemAppearanceID: Maybe<number>,
	read altItemAppearanceID: Maybe<number>,
	read altOnTop: boolean,
	read tier: ArtifactTiers,
}

local Wrappers = {}

function Wrappers.GetAppearanceInfo(
	appearanceSetIndex: number,
	appearanceIndex: number
): Maybe<GetAppearanceInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 =
		C_ArtifactUI.GetAppearanceInfo(appearanceSetIndex, appearanceIndex)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r6 == nil
		or r8 == nil
		or r9 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		artifactAppearanceID = r1,
		appearanceName = r2,
		displayIndex = r3,
		unlocked = r4,
		failureDescription = Maybe.of(r5),
		uiCameraID = r6,
		altHandCameraID = Maybe.of(r7),
		swatchColorR = r8,
		swatchColorG = r9,
		swatchColorB = r10,
		modelOpacity = r11,
		modelSaturation = r12,
		obtainable = r13,
	})
end

function Wrappers.GetAppearanceInfoInto(
	reuse: GetAppearanceInfoResults,
	appearanceSetIndex: number,
	appearanceIndex: number
): Maybe<GetAppearanceInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 =
		C_ArtifactUI.GetAppearanceInfo(appearanceSetIndex, appearanceIndex)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r6 == nil
		or r8 == nil
		or r9 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.artifactAppearanceID = r1
	fields.appearanceName = r2
	fields.displayIndex = r3
	fields.unlocked = r4
	fields.failureDescription = Reuse.maybe(fields.failureDescription, r5)
	fields.uiCameraID = r6
	fields.altHandCameraID = Reuse.maybe(fields.altHandCameraID, r7)
	fields.swatchColorR = r8
	fields.swatchColorG = r9
	fields.swatchColorB = r10
	fields.modelOpacity = r11
	fields.modelSaturation = r12
	fields.obtainable = r13
	return Reuse.just(reuse)
end

function Wrappers.GetAppearanceInfoByID(artifactAppearanceID: number): Maybe<GetAppearanceInfoByIDResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14 =
		C_ArtifactUI.GetAppearanceInfoByID(artifactAppearanceID)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r7 == nil
		or r9 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
		or r14 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		artifactAppearanceSetID = r1,
		artifactAppearanceID = r2,
		appearanceName = r3,
		displayIndex = r4,
		unlocked = r5,
		failureDescription = Maybe.of(r6),
		uiCameraID = r7,
		altHandCameraID = Maybe.of(r8),
		swatchColorR = r9,
		swatchColorG = r10,
		swatchColorB = r11,
		modelOpacity = r12,
		modelSaturation = r13,
		obtainable = r14,
	})
end

function Wrappers.GetAppearanceInfoByIDInto(
	reuse: GetAppearanceInfoByIDResults,
	artifactAppearanceID: number
): Maybe<GetAppearanceInfoByIDResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14 =
		C_ArtifactUI.GetAppearanceInfoByID(artifactAppearanceID)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r7 == nil
		or r9 == nil
		or r10 == nil
		or r11 == nil
		or r12 == nil
		or r13 == nil
		or r14 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.artifactAppearanceSetID = r1
	fields.artifactAppearanceID = r2
	fields.appearanceName = r3
	fields.displayIndex = r4
	fields.unlocked = r5
	fields.failureDescription = Reuse.maybe(fields.failureDescription, r6)
	fields.uiCameraID = r7
	fields.altHandCameraID = Reuse.maybe(fields.altHandCameraID, r8)
	fields.swatchColorR = r9
	fields.swatchColorG = r10
	fields.swatchColorB = r11
	fields.modelOpacity = r12
	fields.modelSaturation = r13
	fields.obtainable = r14
	return Reuse.just(reuse)
end

function Wrappers.GetAppearanceSetInfo(appearanceSetIndex: number): Maybe<GetAppearanceSetInfoResults>
	local r1, r2, r3, r4 = C_ArtifactUI.GetAppearanceSetInfo(appearanceSetIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		artifactAppearanceSetID = r1,
		appearanceSetName = r2,
		appearanceSetDescription = r3,
		numAppearances = r4,
	})
end

function Wrappers.GetAppearanceSetInfoInto(
	reuse: GetAppearanceSetInfoResults,
	appearanceSetIndex: number
): Maybe<GetAppearanceSetInfoResults>
	local r1, r2, r3, r4 = C_ArtifactUI.GetAppearanceSetInfo(appearanceSetIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.artifactAppearanceSetID = r1
	fields.appearanceSetName = r2
	fields.appearanceSetDescription = r3
	fields.numAppearances = r4
	return Reuse.just(reuse)
end

function Wrappers.GetArtifactArtInfo(): Maybe<ArtifactArtInfo>
	return Maybe.of(C_ArtifactUI.GetArtifactArtInfo())
end

function Wrappers.GetArtifactArtInfoInto(reuse: Maybe<ArtifactArtInfo>): Maybe<ArtifactArtInfo>
	return Reuse.maybe(reuse, C_ArtifactUI.GetArtifactArtInfo())
end

function Wrappers.GetArtifactInfo(): Maybe<GetArtifactInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_ArtifactUI.GetArtifactInfo()
	if
		r1 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemID = r1,
		altItemID = Maybe.of(r2),
		name = r3,
		icon = r4,
		xp = r5,
		pointsSpent = r6,
		quality = r7,
		artifactAppearanceID = r8,
		appearanceModID = r9,
		itemAppearanceID = Maybe.of(r10),
		altItemAppearanceID = Maybe.of(r11),
		altOnTop = r12,
		tier = r13,
	})
end

function Wrappers.GetArtifactInfoInto(reuse: GetArtifactInfoResults): Maybe<GetArtifactInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_ArtifactUI.GetArtifactInfo()
	if
		r1 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemID = r1
	fields.altItemID = Reuse.maybe(fields.altItemID, r2)
	fields.name = r3
	fields.icon = r4
	fields.xp = r5
	fields.pointsSpent = r6
	fields.quality = r7
	fields.artifactAppearanceID = r8
	fields.appearanceModID = r9
	fields.itemAppearanceID = Reuse.maybe(fields.itemAppearanceID, r10)
	fields.altItemAppearanceID = Reuse.maybe(fields.altItemAppearanceID, r11)
	fields.altOnTop = r12
	fields.tier = r13
	return Reuse.just(reuse)
end

function Wrappers.GetArtifactItemID(): Maybe<number>
	return Maybe.of(C_ArtifactUI.GetArtifactItemID())
end

function Wrappers.GetArtifactItemIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_ArtifactUI.GetArtifactItemID())
end

function Wrappers.GetArtifactTier(): Maybe<ArtifactTiers>
	return Maybe.of(C_ArtifactUI.GetArtifactTier())
end

function Wrappers.GetArtifactTierInto(reuse: Maybe<ArtifactTiers>): Maybe<ArtifactTiers>
	return Reuse.maybe(reuse, C_ArtifactUI.GetArtifactTier())
end

function Wrappers.GetArtifactXPRewardTargetInfo(artifactCategoryID: number): Maybe<GetArtifactXPRewardTargetInfoResults>
	local r1, r2 = C_ArtifactUI.GetArtifactXPRewardTargetInfo(artifactCategoryID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		icon = r2,
	})
end

function Wrappers.GetArtifactXPRewardTargetInfoInto(
	reuse: GetArtifactXPRewardTargetInfoResults,
	artifactCategoryID: number
): Maybe<GetArtifactXPRewardTargetInfoResults>
	local r1, r2 = C_ArtifactUI.GetArtifactXPRewardTargetInfo(artifactCategoryID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	return Reuse.just(reuse)
end

function Wrappers.GetEquippedArtifactArtInfo(): Maybe<ArtifactArtInfo>
	return Maybe.of(C_ArtifactUI.GetEquippedArtifactArtInfo())
end

function Wrappers.GetEquippedArtifactArtInfoInto(reuse: Maybe<ArtifactArtInfo>): Maybe<ArtifactArtInfo>
	return Reuse.maybe(reuse, C_ArtifactUI.GetEquippedArtifactArtInfo())
end

function Wrappers.GetEquippedArtifactInfo(): Maybe<GetEquippedArtifactInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_ArtifactUI.GetEquippedArtifactInfo()
	if
		r1 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemID = r1,
		altItemID = Maybe.of(r2),
		name = r3,
		icon = r4,
		xp = r5,
		pointsSpent = r6,
		quality = r7,
		artifactAppearanceID = r8,
		appearanceModID = r9,
		itemAppearanceID = Maybe.of(r10),
		altItemAppearanceID = Maybe.of(r11),
		altOnTop = r12,
		tier = r13,
	})
end

function Wrappers.GetEquippedArtifactInfoInto(
	reuse: GetEquippedArtifactInfoResults
): Maybe<GetEquippedArtifactInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_ArtifactUI.GetEquippedArtifactInfo()
	if
		r1 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemID = r1
	fields.altItemID = Reuse.maybe(fields.altItemID, r2)
	fields.name = r3
	fields.icon = r4
	fields.xp = r5
	fields.pointsSpent = r6
	fields.quality = r7
	fields.artifactAppearanceID = r8
	fields.appearanceModID = r9
	fields.itemAppearanceID = Reuse.maybe(fields.itemAppearanceID, r10)
	fields.altItemAppearanceID = Reuse.maybe(fields.altItemAppearanceID, r11)
	fields.altOnTop = r12
	fields.tier = r13
	return Reuse.just(reuse)
end

function Wrappers.GetEquippedArtifactItemID(): Maybe<number>
	return Maybe.of(C_ArtifactUI.GetEquippedArtifactItemID())
end

function Wrappers.GetEquippedArtifactItemIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_ArtifactUI.GetEquippedArtifactItemID())
end

function Wrappers.GetEquippedArtifactRelicInfo(relicSlotIndex: number): Maybe<GetEquippedArtifactRelicInfoResults>
	local r1, r2, r3, r4 = C_ArtifactUI.GetEquippedArtifactRelicInfo(relicSlotIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		icon = r2,
		slotTypeName = r3,
		link = r4,
	})
end

function Wrappers.GetEquippedArtifactRelicInfoInto(
	reuse: GetEquippedArtifactRelicInfoResults,
	relicSlotIndex: number
): Maybe<GetEquippedArtifactRelicInfoResults>
	local r1, r2, r3, r4 = C_ArtifactUI.GetEquippedArtifactRelicInfo(relicSlotIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.slotTypeName = r3
	fields.link = r4
	return Reuse.just(reuse)
end

function Wrappers.GetEquippedRelicLockedReason(relicSlotIndex: number): Maybe<string>
	return Maybe.of(C_ArtifactUI.GetEquippedRelicLockedReason(relicSlotIndex))
end

function Wrappers.GetEquippedRelicLockedReasonInto(reuse: Maybe<string>, relicSlotIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_ArtifactUI.GetEquippedRelicLockedReason(relicSlotIndex))
end

function Wrappers.GetForgeRotation(): GetForgeRotationResults
	local r1, r2, r3 = C_ArtifactUI.GetForgeRotation()
	return {
		forgeRotationX = r1,
		forgeRotationY = r2,
		forgeRotationZ = r3,
	}
end

function Wrappers.GetForgeRotationInto(reuse: GetForgeRotationResults): GetForgeRotationResults
	local r1, r2, r3 = C_ArtifactUI.GetForgeRotation()
	local fields = Reuse.fields(reuse)
	fields.forgeRotationX = r1
	fields.forgeRotationY = r2
	fields.forgeRotationZ = r3
	return reuse
end

function Wrappers.GetItemLevelIncreaseProvidedByRelic(itemLinkOrID: ItemInfo): Maybe<number>
	return Maybe.of(C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic(itemLinkOrID))
end

function Wrappers.GetItemLevelIncreaseProvidedByRelicInto(reuse: Maybe<number>, itemLinkOrID: ItemInfo): Maybe<number>
	return Reuse.maybe(reuse, C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic(itemLinkOrID))
end

function Wrappers.GetPowerInfo(powerID: number): Maybe<ArtifactPowerInfo>
	return Maybe.of(C_ArtifactUI.GetPowerInfo(powerID))
end

function Wrappers.GetPowerInfoInto(reuse: Maybe<ArtifactPowerInfo>, powerID: number): Maybe<ArtifactPowerInfo>
	return Reuse.maybe(reuse, C_ArtifactUI.GetPowerInfo(powerID))
end

function Wrappers.GetPowers(): Maybe<{ number }>
	return Maybe.of(C_ArtifactUI.GetPowers())
end

function Wrappers.GetPowersInto(reuse: Maybe<{ number }>): Maybe<{ number }>
	return Reuse.maybe(reuse, C_ArtifactUI.GetPowers())
end

function Wrappers.GetPreviewAppearance(): Maybe<number>
	return Maybe.of(C_ArtifactUI.GetPreviewAppearance())
end

function Wrappers.GetPreviewAppearanceInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_ArtifactUI.GetPreviewAppearance())
end

function Wrappers.GetRelicInfo(relicSlotIndex: number): Maybe<GetRelicInfoResults>
	local r1, r2, r3, r4 = C_ArtifactUI.GetRelicInfo(relicSlotIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		icon = r2,
		slotTypeName = r3,
		link = r4,
	})
end

function Wrappers.GetRelicInfoInto(reuse: GetRelicInfoResults, relicSlotIndex: number): Maybe<GetRelicInfoResults>
	local r1, r2, r3, r4 = C_ArtifactUI.GetRelicInfo(relicSlotIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.slotTypeName = r3
	fields.link = r4
	return Reuse.just(reuse)
end

function Wrappers.GetRelicInfoByItemID(itemID: number): Maybe<GetRelicInfoByItemIDResults>
	local r1, r2, r3, r4 = C_ArtifactUI.GetRelicInfoByItemID(itemID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		icon = r2,
		slotTypeName = r3,
		link = r4,
	})
end

function Wrappers.GetRelicInfoByItemIDInto(
	reuse: GetRelicInfoByItemIDResults,
	itemID: number
): Maybe<GetRelicInfoByItemIDResults>
	local r1, r2, r3, r4 = C_ArtifactUI.GetRelicInfoByItemID(itemID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.slotTypeName = r3
	fields.link = r4
	return Reuse.just(reuse)
end

function Wrappers.GetRelicLockedReason(relicSlotIndex: number): Maybe<string>
	return Maybe.of(C_ArtifactUI.GetRelicLockedReason(relicSlotIndex))
end

function Wrappers.GetRelicLockedReasonInto(reuse: Maybe<string>, relicSlotIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_ArtifactUI.GetRelicLockedReason(relicSlotIndex))
end

function Wrappers.GetRelicSlotType(relicSlotIndex: number): Maybe<string>
	return Maybe.of(C_ArtifactUI.GetRelicSlotType(relicSlotIndex))
end

function Wrappers.GetRelicSlotTypeInto(reuse: Maybe<string>, relicSlotIndex: number): Maybe<string>
	return Reuse.maybe(reuse, C_ArtifactUI.GetRelicSlotType(relicSlotIndex))
end

function Wrappers.GetRespecArtifactArtInfo(): Maybe<ArtifactArtInfo>
	return Maybe.of(C_ArtifactUI.GetRespecArtifactArtInfo())
end

function Wrappers.GetRespecArtifactArtInfoInto(reuse: Maybe<ArtifactArtInfo>): Maybe<ArtifactArtInfo>
	return Reuse.maybe(reuse, C_ArtifactUI.GetRespecArtifactArtInfo())
end

function Wrappers.GetRespecArtifactInfo(): Maybe<GetRespecArtifactInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_ArtifactUI.GetRespecArtifactInfo()
	if
		r1 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		itemID = r1,
		altItemID = Maybe.of(r2),
		name = r3,
		icon = r4,
		xp = r5,
		pointsSpent = r6,
		quality = r7,
		artifactAppearanceID = r8,
		appearanceModID = r9,
		itemAppearanceID = Maybe.of(r10),
		altItemAppearanceID = Maybe.of(r11),
		altOnTop = r12,
		tier = r13,
	})
end

function Wrappers.GetRespecArtifactInfoInto(reuse: GetRespecArtifactInfoResults): Maybe<GetRespecArtifactInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = C_ArtifactUI.GetRespecArtifactInfo()
	if
		r1 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
		or r12 == nil
		or r13 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.itemID = r1
	fields.altItemID = Reuse.maybe(fields.altItemID, r2)
	fields.name = r3
	fields.icon = r4
	fields.xp = r5
	fields.pointsSpent = r6
	fields.quality = r7
	fields.artifactAppearanceID = r8
	fields.appearanceModID = r9
	fields.itemAppearanceID = Reuse.maybe(fields.itemAppearanceID, r10)
	fields.altItemAppearanceID = Reuse.maybe(fields.altItemAppearanceID, r11)
	fields.altOnTop = r12
	fields.tier = r13
	return Reuse.just(reuse)
end

function Wrappers.GetTotalPowerCost(
	startingTrait: number,
	numTraits: number,
	artifactTier: ArtifactTiers
): Maybe<number>
	return Maybe.of(C_ArtifactUI.GetTotalPowerCost(startingTrait, numTraits, artifactTier))
end

function Wrappers.GetTotalPowerCostInto(
	reuse: Maybe<number>,
	startingTrait: number,
	numTraits: number,
	artifactTier: ArtifactTiers
): Maybe<number>
	return Reuse.maybe(reuse, C_ArtifactUI.GetTotalPowerCost(startingTrait, numTraits, artifactTier))
end

return Wrappers
