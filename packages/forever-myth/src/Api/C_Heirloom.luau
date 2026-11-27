--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetHeirloomInfoResults = {
	read name: string,
	read itemEquipLoc: string,
	read isPvP: boolean,
	read itemTexture: string,
	read upgradeLevel: number,
	read source: number,
	read searchFiltered: boolean,
	read effectiveLevel: number,
	read minLevel: number,
	read maxLevel: number,
}

local Wrappers = {}

function Wrappers.GetHeirloomInfo(itemID: number): GetHeirloomInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = C_Heirloom.GetHeirloomInfo(itemID)
	return {
		name = r1,
		itemEquipLoc = r2,
		isPvP = r3,
		itemTexture = r4,
		upgradeLevel = r5,
		source = r6,
		searchFiltered = r7,
		effectiveLevel = r8,
		minLevel = r9,
		maxLevel = r10,
	}
end

function Wrappers.GetHeirloomInfoInto(reuse: GetHeirloomInfoResults, itemID: number): GetHeirloomInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = C_Heirloom.GetHeirloomInfo(itemID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.itemEquipLoc = r2
	fields.isPvP = r3
	fields.itemTexture = r4
	fields.upgradeLevel = r5
	fields.source = r6
	fields.searchFiltered = r7
	fields.effectiveLevel = r8
	fields.minLevel = r9
	fields.maxLevel = r10
	return reuse
end

return Wrappers
