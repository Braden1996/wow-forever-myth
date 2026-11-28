--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetAccountInfoByGUID(guid: WOWGUID): Maybe<BNetAccountInfo>
	return Maybe.of(C_BattleNet.GetAccountInfoByGUID(guid))
end

function Wrappers.GetAccountInfoByGUIDInto(reuse: Maybe<BNetAccountInfo>, guid: WOWGUID): Maybe<BNetAccountInfo>
	return Reuse.maybe(reuse, C_BattleNet.GetAccountInfoByGUID(guid))
end

function Wrappers.GetAccountInfoByID(id: number, wowAccountGUID: WOWGUID?): Maybe<BNetAccountInfo>
	return Maybe.of(C_BattleNet.GetAccountInfoByID(id, wowAccountGUID))
end

function Wrappers.GetAccountInfoByIDInto(
	reuse: Maybe<BNetAccountInfo>,
	id: number,
	wowAccountGUID: WOWGUID?
): Maybe<BNetAccountInfo>
	return Reuse.maybe(reuse, C_BattleNet.GetAccountInfoByID(id, wowAccountGUID))
end

function Wrappers.GetCustomTitleFriendName(id: number): Maybe<string>
	return Maybe.of(C_BattleNet.GetCustomTitleFriendName(id))
end

function Wrappers.GetCustomTitleFriendNameInto(reuse: Maybe<string>, id: number): Maybe<string>
	return Reuse.maybe(reuse, C_BattleNet.GetCustomTitleFriendName(id))
end

function Wrappers.GetDefaultTitleWhisperTarget(id: number): Maybe<string>
	return Maybe.of(C_BattleNet.GetDefaultTitleWhisperTarget(id))
end

function Wrappers.GetDefaultTitleWhisperTargetInto(reuse: Maybe<string>, id: number): Maybe<string>
	return Reuse.maybe(reuse, C_BattleNet.GetDefaultTitleWhisperTarget(id))
end

function Wrappers.GetFriendAccountInfo(friendIndex: number, wowAccountGUID: WOWGUID?): Maybe<BNetAccountInfo>
	return Maybe.of(C_BattleNet.GetFriendAccountInfo(friendIndex, wowAccountGUID))
end

function Wrappers.GetFriendAccountInfoInto(
	reuse: Maybe<BNetAccountInfo>,
	friendIndex: number,
	wowAccountGUID: WOWGUID?
): Maybe<BNetAccountInfo>
	return Reuse.maybe(reuse, C_BattleNet.GetFriendAccountInfo(friendIndex, wowAccountGUID))
end

function Wrappers.GetFriendGameAccountInfo(friendIndex: number, accountIndex: number): Maybe<BNetGameAccountInfo>
	return Maybe.of(C_BattleNet.GetFriendGameAccountInfo(friendIndex, accountIndex))
end

function Wrappers.GetFriendGameAccountInfoInto(
	reuse: Maybe<BNetGameAccountInfo>,
	friendIndex: number,
	accountIndex: number
): Maybe<BNetGameAccountInfo>
	return Reuse.maybe(reuse, C_BattleNet.GetFriendGameAccountInfo(friendIndex, accountIndex))
end

function Wrappers.GetFriendInviteInfo(inviteIndex: number): Maybe<BNetFriendInviteInfo>
	return Maybe.of(C_BattleNet.GetFriendInviteInfo(inviteIndex))
end

function Wrappers.GetFriendInviteInfoInto(
	reuse: Maybe<BNetFriendInviteInfo>,
	inviteIndex: number
): Maybe<BNetFriendInviteInfo>
	return Reuse.maybe(reuse, C_BattleNet.GetFriendInviteInfo(inviteIndex))
end

function Wrappers.GetGameAccountInfoByGUID(guid: WOWGUID): Maybe<BNetGameAccountInfo>
	return Maybe.of(C_BattleNet.GetGameAccountInfoByGUID(guid))
end

function Wrappers.GetGameAccountInfoByGUIDInto(
	reuse: Maybe<BNetGameAccountInfo>,
	guid: WOWGUID
): Maybe<BNetGameAccountInfo>
	return Reuse.maybe(reuse, C_BattleNet.GetGameAccountInfoByGUID(guid))
end

function Wrappers.GetGameAccountInfoByID(id: number): Maybe<BNetGameAccountInfo>
	return Maybe.of(C_BattleNet.GetGameAccountInfoByID(id))
end

function Wrappers.GetGameAccountInfoByIDInto(reuse: Maybe<BNetGameAccountInfo>, id: number): Maybe<BNetGameAccountInfo>
	return Reuse.maybe(reuse, C_BattleNet.GetGameAccountInfoByID(id))
end

function Wrappers.SearchFriends(searchInfo: AuroraFriendsSearchInfo): Maybe<{ number }>
	return Maybe.of(C_BattleNet.SearchFriends(searchInfo))
end

function Wrappers.SearchFriendsInto(reuse: Maybe<{ number }>, searchInfo: AuroraFriendsSearchInfo): Maybe<{ number }>
	return Reuse.maybe(reuse, C_BattleNet.SearchFriends(searchInfo))
end

function Wrappers.SendWhisper(bnetAccountID: number, text: stringView): Maybe<boolean>
	return Maybe.of(C_BattleNet.SendWhisper(bnetAccountID, text))
end

function Wrappers.SendWhisperInto(reuse: Maybe<boolean>, bnetAccountID: number, text: stringView): Maybe<boolean>
	return Reuse.maybe(reuse, C_BattleNet.SendWhisper(bnetAccountID, text))
end

function Wrappers.SetCustomMessage(text: string): Maybe<boolean>
	return Maybe.of(C_BattleNet.SetCustomMessage(text))
end

function Wrappers.SetCustomMessageInto(reuse: Maybe<boolean>, text: string): Maybe<boolean>
	return Reuse.maybe(reuse, C_BattleNet.SetCustomMessage(text))
end

return Wrappers
