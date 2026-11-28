--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetEquipmentSetInfoResults = {
	read name: string,
	read iconFileID: number,
	read setID: number,
	read isEquipped: boolean,
	read numItems: number,
	read numEquipped: number,
	read numInInventory: number,
	read numLost: number,
	read numIgnored: number,
}

local Wrappers = {}

function Wrappers.GetEquipmentSetAssignedSpec(equipmentSetID: number): Maybe<number>
	return Maybe.of(C_EquipmentSet.GetEquipmentSetAssignedSpec(equipmentSetID))
end

function Wrappers.GetEquipmentSetAssignedSpecInto(reuse: Maybe<number>, equipmentSetID: number): Maybe<number>
	return Reuse.maybe(reuse, C_EquipmentSet.GetEquipmentSetAssignedSpec(equipmentSetID))
end

function Wrappers.GetEquipmentSetForSpec(specIndex: number): Maybe<number>
	return Maybe.of(C_EquipmentSet.GetEquipmentSetForSpec(specIndex))
end

function Wrappers.GetEquipmentSetForSpecInto(reuse: Maybe<number>, specIndex: number): Maybe<number>
	return Reuse.maybe(reuse, C_EquipmentSet.GetEquipmentSetForSpec(specIndex))
end

function Wrappers.GetEquipmentSetID(equipmentSetName: string): Maybe<number>
	return Maybe.of(C_EquipmentSet.GetEquipmentSetID(equipmentSetName))
end

function Wrappers.GetEquipmentSetIDInto(reuse: Maybe<number>, equipmentSetName: string): Maybe<number>
	return Reuse.maybe(reuse, C_EquipmentSet.GetEquipmentSetID(equipmentSetName))
end

function Wrappers.GetEquipmentSetInfo(equipmentSetID: number): Maybe<GetEquipmentSetInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
	then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		iconFileID = r2,
		setID = r3,
		isEquipped = r4,
		numItems = r5,
		numEquipped = r6,
		numInInventory = r7,
		numLost = r8,
		numIgnored = r9,
	})
end

function Wrappers.GetEquipmentSetInfoInto(
	reuse: GetEquipmentSetInfoResults,
	equipmentSetID: number
): Maybe<GetEquipmentSetInfoResults>
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = C_EquipmentSet.GetEquipmentSetInfo(equipmentSetID)
	if
		r1 == nil
		or r2 == nil
		or r3 == nil
		or r4 == nil
		or r5 == nil
		or r6 == nil
		or r7 == nil
		or r8 == nil
		or r9 == nil
	then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.iconFileID = r2
	fields.setID = r3
	fields.isEquipped = r4
	fields.numItems = r5
	fields.numEquipped = r6
	fields.numInInventory = r7
	fields.numLost = r8
	fields.numIgnored = r9
	return Reuse.just(reuse)
end

function Wrappers.GetIgnoredSlots(equipmentSetID: number): Maybe<{ boolean? }>
	return Maybe.of(C_EquipmentSet.GetIgnoredSlots(equipmentSetID))
end

function Wrappers.GetIgnoredSlotsInto(reuse: Maybe<{ boolean? }>, equipmentSetID: number): Maybe<{ boolean? }>
	return Reuse.maybe(reuse, C_EquipmentSet.GetIgnoredSlots(equipmentSetID))
end

function Wrappers.GetItemIDs(equipmentSetID: number): Maybe<{ number? }>
	return Maybe.of(C_EquipmentSet.GetItemIDs(equipmentSetID))
end

function Wrappers.GetItemIDsInto(reuse: Maybe<{ number? }>, equipmentSetID: number): Maybe<{ number? }>
	return Reuse.maybe(reuse, C_EquipmentSet.GetItemIDs(equipmentSetID))
end

function Wrappers.GetItemLocations(equipmentSetID: number): Maybe<{ number? }>
	return Maybe.of(C_EquipmentSet.GetItemLocations(equipmentSetID))
end

function Wrappers.GetItemLocationsInto(reuse: Maybe<{ number? }>, equipmentSetID: number): Maybe<{ number? }>
	return Reuse.maybe(reuse, C_EquipmentSet.GetItemLocations(equipmentSetID))
end

return Wrappers
