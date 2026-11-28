--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetSelectedBlueprintFloorplanResults = {
	read roomID: number,
	read shareCode: string,
}

export type GetSelectedDoorResults = {
	read selectedDoorComponentID: number,
	read roomGUID: WOWGUID,
}

export type IsDraggingRoomResults = {
	read isDragging: boolean,
	read isAccessibleDrag: boolean,
}

local Wrappers = {}

function Wrappers.GetRoomPlacementBudget(): Maybe<number>
	return Maybe.of(C_HousingLayout.GetRoomPlacementBudget())
end

function Wrappers.GetRoomPlacementBudgetInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_HousingLayout.GetRoomPlacementBudget())
end

function Wrappers.GetRoomPlayerIsIn(): Maybe<WOWGUID>
	return Maybe.of(C_HousingLayout.GetRoomPlayerIsIn())
end

function Wrappers.GetRoomPlayerIsInInto(reuse: Maybe<WOWGUID>): Maybe<WOWGUID>
	return Reuse.maybe(reuse, C_HousingLayout.GetRoomPlayerIsIn())
end

function Wrappers.GetSelectedBlueprintFloorplan(): Maybe<GetSelectedBlueprintFloorplanResults>
	local r1, r2 = C_HousingLayout.GetSelectedBlueprintFloorplan()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		roomID = r1,
		shareCode = r2,
	})
end

function Wrappers.GetSelectedBlueprintFloorplanInto(
	reuse: GetSelectedBlueprintFloorplanResults
): Maybe<GetSelectedBlueprintFloorplanResults>
	local r1, r2 = C_HousingLayout.GetSelectedBlueprintFloorplan()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.roomID = r1
	fields.shareCode = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSelectedDoor(): Maybe<GetSelectedDoorResults>
	local r1, r2 = C_HousingLayout.GetSelectedDoor()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		selectedDoorComponentID = r1,
		roomGUID = r2,
	})
end

function Wrappers.GetSelectedDoorInto(reuse: GetSelectedDoorResults): Maybe<GetSelectedDoorResults>
	local r1, r2 = C_HousingLayout.GetSelectedDoor()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.selectedDoorComponentID = r1
	fields.roomGUID = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSelectedFloorplan(): Maybe<number>
	return Maybe.of(C_HousingLayout.GetSelectedFloorplan())
end

function Wrappers.GetSelectedFloorplanInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_HousingLayout.GetSelectedFloorplan())
end

function Wrappers.GetSelectedRoom(): Maybe<WOWGUID>
	return Maybe.of(C_HousingLayout.GetSelectedRoom())
end

function Wrappers.GetSelectedRoomInto(reuse: Maybe<WOWGUID>): Maybe<WOWGUID>
	return Reuse.maybe(reuse, C_HousingLayout.GetSelectedRoom())
end

function Wrappers.GetSpentPlacementBudget(): Maybe<number>
	return Maybe.of(C_HousingLayout.GetSpentPlacementBudget())
end

function Wrappers.GetSpentPlacementBudgetInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_HousingLayout.GetSpentPlacementBudget())
end

function Wrappers.IsDraggingRoom(): IsDraggingRoomResults
	local r1, r2 = C_HousingLayout.IsDraggingRoom()
	return {
		isDragging = r1,
		isAccessibleDrag = r2,
	}
end

function Wrappers.IsDraggingRoomInto(reuse: IsDraggingRoomResults): IsDraggingRoomResults
	local r1, r2 = C_HousingLayout.IsDraggingRoom()
	local fields = Reuse.fields(reuse)
	fields.isDragging = r1
	fields.isAccessibleDrag = r2
	return reuse
end

return Wrappers
