--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetAzeriteItemXPInfoResults = {
	read xp: number,
	read totalLevelXP: number,
}

local Wrappers = {}

function Wrappers.FindActiveAzeriteItem(): Maybe<ItemLocationMixin>
	return Maybe.of(C_AzeriteItem.FindActiveAzeriteItem())
end

function Wrappers.FindActiveAzeriteItemInto(reuse: Maybe<ItemLocationMixin>): Maybe<ItemLocationMixin>
	return Reuse.maybe(reuse, C_AzeriteItem.FindActiveAzeriteItem())
end

function Wrappers.GetAzeriteItemXPInfo(azeriteItemLocation: ItemLocationMixin): Maybe<GetAzeriteItemXPInfoResults>
	local r1, r2 = C_AzeriteItem.GetAzeriteItemXPInfo(azeriteItemLocation)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		xp = r1,
		totalLevelXP = r2,
	})
end

function Wrappers.GetAzeriteItemXPInfoInto(
	reuse: GetAzeriteItemXPInfoResults,
	azeriteItemLocation: ItemLocationMixin
): Maybe<GetAzeriteItemXPInfoResults>
	local r1, r2 = C_AzeriteItem.GetAzeriteItemXPInfo(azeriteItemLocation)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.xp = r1
	fields.totalLevelXP = r2
	return Reuse.just(reuse)
end

return Wrappers
