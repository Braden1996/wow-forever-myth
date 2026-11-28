--!strict
local ForeverMyth = require("../../packages/libraries/luau/wow/forever-myth/src/ForeverMyth")

type LevelReader = ForeverMyth.EventReader<"PLAYER_LEVEL_UP", string>
type Bags = ForeverMyth.Task<{ string }, never>

local Events = ForeverMyth.Events
local Timing = ForeverMyth.Timing

local function bagIndexOf(bagIndex: number): number
	return bagIndex
end

local function shout(text: string): string
	return string.upper(text)
end

local onLevel: LevelReader = shout -- expect-error: string
local bags: Bags = Events.nextBurst("BAG_UPDATE", 1, bagIndexOf) -- expect-error: string
local debounced = Timing.debounce(1, shout)
debounced(42) -- expect-error: number

return { onLevel, bags }
