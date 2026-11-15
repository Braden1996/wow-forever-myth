--!strict
local OverrideTypes = require("../generator/OverrideTypes")

local loads: { [string]: OverrideTypes.LoadOverride } = {
	["C_Item.GetItemInfo"] = {
		event = "ITEM_DATA_LOAD_RESULT",
		request = "C_Item.RequestLoadItemDataByID",
		key = "C_Item.GetItemIDForItemInfo",
		why = "nothing until the item is cached; RequestLoadItemDataByID fires ITEM_DATA_LOAD_RESULT(itemID, success)",
	},
	["C_Item.GetItemNameByID"] = {
		event = "ITEM_DATA_LOAD_RESULT",
		request = "C_Item.RequestLoadItemDataByID",
		key = "C_Item.GetItemIDForItemInfo",
		why = "nil until the item is cached; RequestLoadItemDataByID fires ITEM_DATA_LOAD_RESULT(itemID, success)",
	},
	["C_QuestLog.GetTitleForQuestID"] = {
		event = "QUEST_DATA_LOAD_RESULT",
		request = "C_QuestLog.RequestLoadQuestByID",
		why = "nil until the quest is cached; RequestLoadQuestByID fires QUEST_DATA_LOAD_RESULT(questID, success)",
	},
}

return loads
