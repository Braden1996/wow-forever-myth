--!strict
local C_Item = require("../../packages/forever-myth/src/Api/C_Item")
local ForeverMyth = require("../../packages/forever-myth/src/ForeverMyth")
local Globals = require("../../packages/forever-myth/src/Api/Globals")
local ScriptRegionWrappers = require("../../packages/forever-myth/src/Widgets/ScriptRegion")

local Api = ForeverMyth.Api
local Maybe = ForeverMyth.Maybe
local Result = ForeverMyth.Result
local Task = ForeverMyth.Task

local function itemName(itemID: number): string
	return Maybe.mapOr(Api.C_Item.GetItemInfo(itemID), "an uncached item", function(item: C_Item.GetItemInfoResults)
		return item.itemName
	end)
end

local function questTitle(questID: number): string
	return Maybe.unwrapOr(Api.C_QuestLog.GetTitleForQuestID(questID), "an unknown quest")
end

local function loadAddOn(name: string): string
	return Result.match(Api.C_AddOns.LoadAddOn(name), {
		Ok = function(_loaded: true): string
			return name .. " loaded"
		end,
		Err = function(reason: string): string
			return name .. " did not load: " .. reason
		end,
	})
end

local function onItemLoaded(itemID: number, show: (name: string) -> ())
	local loaded = Api.C_Item.GetItemInfoAsync(itemID)
	Task.whenSettled(loaded, function(result: ForeverMyth.Result<C_Item.GetItemInfoResults, ForeverMyth.LoadFailed>)
		if result.kind == "Ok" then
			show(result.value.itemName)
		else
			show("item " .. tostring(result.error.key) .. " failed to load")
		end
	end)
end

local function afterTwoSeconds(): ForeverMyth.Task<nil, never>
	return Api.C_Timer.AfterAsync(2)
end

local position: Globals.UnitPositionResults = Api.UnitPosition("player")
local function trackPlayer(): number
	position = Api.UnitPositionInto(position, "player")
	return position.positionY
end

local anchor = ForeverMyth.Widgets.ScriptRegion.GetPoint(UIParent, 1)
local relativeTo: ForeverMyth.Maybe<ScriptRegion> = Maybe.map(
	anchor,
	function(point: ScriptRegionWrappers.GetPointResults): ScriptRegion
		return point.relativeTo
	end
)

return {
	itemName = itemName,
	questTitle = questTitle,
	loadAddOn = loadAddOn,
	onItemLoaded = onItemLoaded,
	afterTwoSeconds = afterTwoSeconds,
	trackPlayer = trackPlayer,
	relativeTo = relativeTo,
}
