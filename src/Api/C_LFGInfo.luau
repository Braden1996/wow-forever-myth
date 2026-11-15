--!strict
local Maybe = require("@truemyth/Maybe")
local Result = require("@truemyth/Result")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>
type Result<T, E> = Result.Result<T, E>

export type GetRoleCheckDifficultyDetailsResults = {
	read maxLevel: Maybe<number>,
	read isLevelReduced: boolean,
}

local Wrappers = {}

function Wrappers.CanPlayerUseGroupFinder(): Result<true, string>
	local r1, r2 = C_LFGInfo.CanPlayerUseGroupFinder()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.CanPlayerUseLFD(): Result<true, string>
	local r1, r2 = C_LFGInfo.CanPlayerUseLFD()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.CanPlayerUseLFR(): Result<true, string>
	local r1, r2 = C_LFGInfo.CanPlayerUseLFR()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.CanPlayerUsePVP(): Result<true, string>
	local r1, r2 = C_LFGInfo.CanPlayerUsePVP()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.CanPlayerUsePremadeGroup(): Result<true, string>
	local r1, r2 = C_LFGInfo.CanPlayerUsePremadeGroup()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.CanPlayerUseScenarioFinder(): Result<true, string>
	local r1, r2 = C_LFGInfo.CanPlayerUseScenarioFinder()
	if r1 then
		return Result.ok(true)
	end
	return Result.err(r2)
end

function Wrappers.GetDungeonInfo(lfgDungeonID: number): Maybe<LFGDungeonInfo>
	return Maybe.of(C_LFGInfo.GetDungeonInfo(lfgDungeonID))
end

function Wrappers.GetDungeonInfoInto(reuse: Maybe<LFGDungeonInfo>, lfgDungeonID: number): Maybe<LFGDungeonInfo>
	return Reuse.maybe(reuse, C_LFGInfo.GetDungeonInfo(lfgDungeonID))
end

function Wrappers.GetRoleCheckDifficultyDetails(): GetRoleCheckDifficultyDetailsResults
	local r1, r2 = C_LFGInfo.GetRoleCheckDifficultyDetails()
	return {
		maxLevel = Maybe.of(r1),
		isLevelReduced = r2,
	}
end

function Wrappers.GetRoleCheckDifficultyDetailsInto(
	reuse: GetRoleCheckDifficultyDetailsResults
): GetRoleCheckDifficultyDetailsResults
	local r1, r2 = C_LFGInfo.GetRoleCheckDifficultyDetails()
	local fields = Reuse.fields(reuse)
	fields.maxLevel = Reuse.maybe(fields.maxLevel, r1)
	fields.isLevelReduced = r2
	return reuse
end

return Wrappers
