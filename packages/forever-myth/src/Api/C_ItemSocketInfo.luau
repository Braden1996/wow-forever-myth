--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetExistingSocketInfoResults = {
	read name: Maybe<string>,
	read icon: Maybe<fileID>,
	read gemMatchesSocket: boolean,
}

export type GetNewSocketInfoResults = {
	read name: Maybe<string>,
	read icon: Maybe<fileID>,
	read gemMatchesSocket: boolean,
}

export type GetSocketItemInfoResults = {
	read name: Maybe<string>,
	read icon: Maybe<fileID>,
	read quality: Enum_ItemQuality,
}

local Wrappers = {}

function Wrappers.GetExistingSocketInfo(index: number): GetExistingSocketInfoResults
	local r1, r2, r3 = C_ItemSocketInfo.GetExistingSocketInfo(index)
	return {
		name = Maybe.of(r1),
		icon = Maybe.of(r2),
		gemMatchesSocket = r3,
	}
end

function Wrappers.GetExistingSocketInfoInto(
	reuse: GetExistingSocketInfoResults,
	index: number
): GetExistingSocketInfoResults
	local r1, r2, r3 = C_ItemSocketInfo.GetExistingSocketInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = Reuse.maybe(fields.name, r1)
	fields.icon = Reuse.maybe(fields.icon, r2)
	fields.gemMatchesSocket = r3
	return reuse
end

function Wrappers.GetExistingSocketLink(index: number): Maybe<string>
	return Maybe.of(C_ItemSocketInfo.GetExistingSocketLink(index))
end

function Wrappers.GetExistingSocketLinkInto(reuse: Maybe<string>, index: number): Maybe<string>
	return Reuse.maybe(reuse, C_ItemSocketInfo.GetExistingSocketLink(index))
end

function Wrappers.GetNewSocketInfo(index: number): GetNewSocketInfoResults
	local r1, r2, r3 = C_ItemSocketInfo.GetNewSocketInfo(index)
	return {
		name = Maybe.of(r1),
		icon = Maybe.of(r2),
		gemMatchesSocket = r3,
	}
end

function Wrappers.GetNewSocketInfoInto(reuse: GetNewSocketInfoResults, index: number): GetNewSocketInfoResults
	local r1, r2, r3 = C_ItemSocketInfo.GetNewSocketInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = Reuse.maybe(fields.name, r1)
	fields.icon = Reuse.maybe(fields.icon, r2)
	fields.gemMatchesSocket = r3
	return reuse
end

function Wrappers.GetNewSocketLink(index: number): Maybe<string>
	return Maybe.of(C_ItemSocketInfo.GetNewSocketLink(index))
end

function Wrappers.GetNewSocketLinkInto(reuse: Maybe<string>, index: number): Maybe<string>
	return Reuse.maybe(reuse, C_ItemSocketInfo.GetNewSocketLink(index))
end

function Wrappers.GetSocketItemInfo(): GetSocketItemInfoResults
	local r1, r2, r3 = C_ItemSocketInfo.GetSocketItemInfo()
	return {
		name = Maybe.of(r1),
		icon = Maybe.of(r2),
		quality = r3,
	}
end

function Wrappers.GetSocketItemInfoInto(reuse: GetSocketItemInfoResults): GetSocketItemInfoResults
	local r1, r2, r3 = C_ItemSocketInfo.GetSocketItemInfo()
	local fields = Reuse.fields(reuse)
	fields.name = Reuse.maybe(fields.name, r1)
	fields.icon = Reuse.maybe(fields.icon, r2)
	fields.quality = r3
	return reuse
end

function Wrappers.GetSocketTypes(index: number): Maybe<string>
	return Maybe.of(C_ItemSocketInfo.GetSocketTypes(index))
end

function Wrappers.GetSocketTypesInto(reuse: Maybe<string>, index: number): Maybe<string>
	return Reuse.maybe(reuse, C_ItemSocketInfo.GetSocketTypes(index))
end

return Wrappers
