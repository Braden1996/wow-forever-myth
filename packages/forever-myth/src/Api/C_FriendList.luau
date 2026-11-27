--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type GetNumWhoResultsResults = {
	read numWhos: number,
	read totalNumWhos: number,
}

local Wrappers = {}

function Wrappers.AddIgnore(name: string): Maybe<boolean>
	return Maybe.of(C_FriendList.AddIgnore(name))
end

function Wrappers.AddIgnoreInto(reuse: Maybe<boolean>, name: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.AddIgnore(name))
end

function Wrappers.DelIgnore(name: string): Maybe<boolean>
	return Maybe.of(C_FriendList.DelIgnore(name))
end

function Wrappers.DelIgnoreInto(reuse: Maybe<boolean>, name: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.DelIgnore(name))
end

function Wrappers.GetFriendInfo(name: string): Maybe<FriendInfo>
	return Maybe.of(C_FriendList.GetFriendInfo(name))
end

function Wrappers.GetFriendInfoInto(reuse: Maybe<FriendInfo>, name: string): Maybe<FriendInfo>
	return Reuse.maybe(reuse, C_FriendList.GetFriendInfo(name))
end

function Wrappers.GetFriendInfoByIndex(index: number): Maybe<FriendInfo>
	return Maybe.of(C_FriendList.GetFriendInfoByIndex(index))
end

function Wrappers.GetFriendInfoByIndexInto(reuse: Maybe<FriendInfo>, index: number): Maybe<FriendInfo>
	return Reuse.maybe(reuse, C_FriendList.GetFriendInfoByIndex(index))
end

function Wrappers.GetIgnoreName(index: number): Maybe<string>
	return Maybe.of(C_FriendList.GetIgnoreName(index))
end

function Wrappers.GetIgnoreNameInto(reuse: Maybe<string>, index: number): Maybe<string>
	return Reuse.maybe(reuse, C_FriendList.GetIgnoreName(index))
end

function Wrappers.GetNumFriends(): Maybe<number>
	return Maybe.of(C_FriendList.GetNumFriends())
end

function Wrappers.GetNumFriendsInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_FriendList.GetNumFriends())
end

function Wrappers.GetNumIgnores(): Maybe<number>
	return Maybe.of(C_FriendList.GetNumIgnores())
end

function Wrappers.GetNumIgnoresInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_FriendList.GetNumIgnores())
end

function Wrappers.GetNumOnlineFriends(): Maybe<number>
	return Maybe.of(C_FriendList.GetNumOnlineFriends())
end

function Wrappers.GetNumOnlineFriendsInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_FriendList.GetNumOnlineFriends())
end

function Wrappers.GetNumWhoResults(): Maybe<GetNumWhoResultsResults>
	local r1, r2 = C_FriendList.GetNumWhoResults()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		numWhos = r1,
		totalNumWhos = r2,
	})
end

function Wrappers.GetNumWhoResultsInto(reuse: GetNumWhoResultsResults): Maybe<GetNumWhoResultsResults>
	local r1, r2 = C_FriendList.GetNumWhoResults()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.numWhos = r1
	fields.totalNumWhos = r2
	return Reuse.just(reuse)
end

function Wrappers.GetSelectedFriend(): Maybe<number>
	return Maybe.of(C_FriendList.GetSelectedFriend())
end

function Wrappers.GetSelectedFriendInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_FriendList.GetSelectedFriend())
end

function Wrappers.GetSelectedIgnore(): Maybe<number>
	return Maybe.of(C_FriendList.GetSelectedIgnore())
end

function Wrappers.GetSelectedIgnoreInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, C_FriendList.GetSelectedIgnore())
end

function Wrappers.GetWhoInfo(index: number): Maybe<WhoInfo>
	return Maybe.of(C_FriendList.GetWhoInfo(index))
end

function Wrappers.GetWhoInfoInto(reuse: Maybe<WhoInfo>, index: number): Maybe<WhoInfo>
	return Reuse.maybe(reuse, C_FriendList.GetWhoInfo(index))
end

function Wrappers.GetWhoRaceFilters(): Maybe<{ WhoFilter }>
	return Maybe.of(C_FriendList.GetWhoRaceFilters())
end

function Wrappers.GetWhoRaceFiltersInto(reuse: Maybe<{ WhoFilter }>): Maybe<{ WhoFilter }>
	return Reuse.maybe(reuse, C_FriendList.GetWhoRaceFilters())
end

function Wrappers.IsFriend(guid: WOWGUID): Maybe<boolean>
	return Maybe.of(C_FriendList.IsFriend(guid))
end

function Wrappers.IsFriendInto(reuse: Maybe<boolean>, guid: WOWGUID): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.IsFriend(guid))
end

function Wrappers.IsIgnored(token: string): Maybe<boolean>
	return Maybe.of(C_FriendList.IsIgnored(token))
end

function Wrappers.IsIgnoredInto(reuse: Maybe<boolean>, token: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.IsIgnored(token))
end

function Wrappers.IsIgnoredByGuid(guid: WOWGUID): Maybe<boolean>
	return Maybe.of(C_FriendList.IsIgnoredByGuid(guid))
end

function Wrappers.IsIgnoredByGuidInto(reuse: Maybe<boolean>, guid: WOWGUID): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.IsIgnoredByGuid(guid))
end

function Wrappers.IsLegacyFriendSystemEnabled(): Maybe<boolean>
	return Maybe.of(C_FriendList.IsLegacyFriendSystemEnabled())
end

function Wrappers.IsLegacyFriendSystemEnabledInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.IsLegacyFriendSystemEnabled())
end

function Wrappers.IsOnIgnoredList(token: string): Maybe<boolean>
	return Maybe.of(C_FriendList.IsOnIgnoredList(token))
end

function Wrappers.IsOnIgnoredListInto(reuse: Maybe<boolean>, token: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.IsOnIgnoredList(token))
end

function Wrappers.RemoveFriend(name: string): Maybe<boolean>
	return Maybe.of(C_FriendList.RemoveFriend(name))
end

function Wrappers.RemoveFriendInto(reuse: Maybe<boolean>, name: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.RemoveFriend(name))
end

function Wrappers.SetFriendNotes(name: string, notes: string): Maybe<boolean>
	return Maybe.of(C_FriendList.SetFriendNotes(name, notes))
end

function Wrappers.SetFriendNotesInto(reuse: Maybe<boolean>, name: string, notes: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_FriendList.SetFriendNotes(name, notes))
end

return Wrappers
