--!strict
local Maybe = require("@truemyth/Maybe")

local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

local Wrappers = {}

function Wrappers.GetCurrentGameModeDisplayInfo(): Maybe<GameModeDisplayInfo>
	return Maybe.of(C_GameRules.GetCurrentGameModeDisplayInfo())
end

function Wrappers.GetCurrentGameModeDisplayInfoInto(reuse: Maybe<GameModeDisplayInfo>): Maybe<GameModeDisplayInfo>
	return Reuse.maybe(reuse, C_GameRules.GetCurrentGameModeDisplayInfo())
end

function Wrappers.GetForeverExperiencePreset(): Maybe<Enum_ForeverExperiencePreset>
	return Maybe.of(C_GameRules.GetForeverExperiencePreset())
end

function Wrappers.GetForeverExperiencePresetInto(
	reuse: Maybe<Enum_ForeverExperiencePreset>
): Maybe<Enum_ForeverExperiencePreset>
	return Reuse.maybe(reuse, C_GameRules.GetForeverExperiencePreset())
end

function Wrappers.GetGameModeDisplayInfoByRecordID(gameModeRecordID: number): Maybe<GameModeDisplayInfo>
	return Maybe.of(C_GameRules.GetGameModeDisplayInfoByRecordID(gameModeRecordID))
end

function Wrappers.GetGameModeDisplayInfoByRecordIDInto(
	reuse: Maybe<GameModeDisplayInfo>,
	gameModeRecordID: number
): Maybe<GameModeDisplayInfo>
	return Reuse.maybe(reuse, C_GameRules.GetGameModeDisplayInfoByRecordID(gameModeRecordID))
end

return Wrappers
