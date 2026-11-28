--!strict
local C_Item = require("../../packages/libraries/luau/wow/forever-myth/src/Api/C_Item")
local ForeverMyth = require("../../packages/libraries/luau/wow/forever-myth/src/ForeverMyth")

local Api, Maybe, Result, Task = ForeverMyth.Api, ForeverMyth.Maybe, ForeverMyth.Result, ForeverMyth.Task

local function readme(questID: number, frame: Frame)
	local title = Maybe.unwrapOr(Api.C_QuestLog.GetTitleForQuestID(questID), "an unknown quest")
	print(title)

	local message = Result.match(Api.C_AddOns.LoadAddOn("MyAddon_Data"), {
		Ok = function(_loaded: true): string
			return "loaded"
		end,
		Err = function(reason: string): string
			return "not loaded: " .. reason
		end,
	})
	print(message)

	Task.inspect(Api.C_Item.GetItemInfoAsync(6948), function(item: C_Item.GetItemInfoResults)
		print(item.itemName, item.itemLevel)
	end)

	local position = Api.UnitPosition("player")
	frame:SetScript("OnUpdate", function()
		position = Api.UnitPositionInto(position, "player")
	end)
end

return readme
