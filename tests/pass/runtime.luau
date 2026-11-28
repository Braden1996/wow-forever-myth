--!strict
local ForeverMyth = require("../../packages/libraries/luau/wow/forever-myth/src/ForeverMyth")

local Combat = ForeverMyth.Combat
local Events = ForeverMyth.Events
local Task = ForeverMyth.Task
local Timing = ForeverMyth.Timing

local function showAfterCombat(frame: Frame): ForeverMyth.Task<boolean, never>
	return Combat.run(function(): boolean
		frame:Show()
		return frame:IsShown()
	end)
end

local function nextLevel(): ForeverMyth.Task<number, never>
	return Events.next("PLAYER_LEVEL_UP", function(level: number): number
		return level
	end)
end

local function changedBags(): ForeverMyth.Task<{ number }, never>
	return Events.nextBurst("BAG_UPDATE", 0.2, function(bagIndex: number): number
		return bagIndex
	end)
end

local saveFilter: (text: string) -> ForeverMyth.Task<number, never> = Timing.debounce(
	0.3,
	function(text: string): number
		return #text
	end
)

local refresh: (unit: string, full: boolean) -> ForeverMyth.Task<string, never> = Timing.throttle(
	0.5,
	function(unit: string, full: boolean): string
		return if full then unit else ""
	end
)

local onLevel: ForeverMyth.EventReader<"PLAYER_LEVEL_UP", string> = function(level)
	return tostring(level)
end
local checkedLevel: ForeverMyth.Task<string, never> = Events.next("PLAYER_LEVEL_UP", onLevel)

Task.inspect(Combat.outOfCombat(), function(_: nil) end)

return {
	showAfterCombat = showAfterCombat,
	nextLevel = nextLevel,
	changedBags = changedBags,
	saveFilter = saveFilter,
	refresh = refresh,
	checkedLevel = checkedLevel,
}
