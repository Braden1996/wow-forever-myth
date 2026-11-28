--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetToyInfoResults = {
	read itemID: number,
	read toyName: string,
	read icon: number,
	read isFavorite: boolean,
	read hasFanfare: boolean,
	read itemQuality: Enum_ItemQuality,
}

local Wrappers = {}

function Wrappers.GetToyInfo(itemID: number): GetToyInfoResults
	local r1, r2, r3, r4, r5, r6 = C_ToyBox.GetToyInfo(itemID)
	return {
		itemID = r1,
		toyName = r2,
		icon = r3,
		isFavorite = r4,
		hasFanfare = r5,
		itemQuality = r6,
	}
end

function Wrappers.GetToyInfoInto(reuse: GetToyInfoResults, itemID: number): GetToyInfoResults
	local r1, r2, r3, r4, r5, r6 = C_ToyBox.GetToyInfo(itemID)
	local fields = Reuse.fields(reuse)
	fields.itemID = r1
	fields.toyName = r2
	fields.icon = r3
	fields.isFavorite = r4
	fields.hasFanfare = r5
	fields.itemQuality = r6
	return reuse
end

function Wrappers.GetToyLink(itemID: number): Maybe<string>
	return Maybe.of(C_ToyBox.GetToyLink(itemID))
end

function Wrappers.GetToyLinkInto(reuse: Maybe<string>, itemID: number): Maybe<string>
	return Reuse.maybe(reuse, C_ToyBox.GetToyLink(itemID))
end

return Wrappers
