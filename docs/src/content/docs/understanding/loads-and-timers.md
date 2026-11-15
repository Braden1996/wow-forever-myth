---
title: Loads and timers
description: Async wrappers that return a Task, resolved when the game has loaded the data or when a timer fires.
---

## Data the game has not loaded yet

The client does not keep every item and quest in memory. `C_Item.GetItemInfo` returns nothing for an item it has not
seen yet, and starts no load by itself. The usual Lua fix is a frame, an event handler, a request and a table of
callers waiting for each item.

The `Async` wrappers do that for you and return a [`Task`](https://braden1996.github.io/luau-true-myth/understanding/task/):

```luau check
local ItemWrappers = require("./src/Api/C_Item")

local function itemLevel(itemID: number)
	return Task.map(Api.C_Item.GetItemInfoAsync(itemID), function(info: ItemWrappers.GetItemInfoResults): number
		return info.itemLevel
	end)
end
```

What happens when you call it:

1. It calls the plain wrapper. If the data is there, the task resolves at once, with no event and no request.
2. Otherwise it registers for the load event once (one shared frame for all of them), queues the caller, and calls the
   request function, such as `C_Item.RequestLoadItemDataByID`.
3. When the event arrives for that ID with success, it reads the data again and resolves every task waiting on it.
4. If the load fails, or the argument does not name an item, the task is rejected with a `LoadFailed`
   (`{ kind = "LoadFailed", api, key }`).

| Wrapper                              | Event                    | Request                           |
| ------------------------------------ | ------------------------ | --------------------------------- |
| `C_Item.GetItemInfoAsync`            | `ITEM_DATA_LOAD_RESULT`  | `C_Item.RequestLoadItemDataByID`  |
| `C_Item.GetItemNameByIDAsync`        | `ITEM_DATA_LOAD_RESULT`  | `C_Item.RequestLoadItemDataByID`  |
| `C_QuestLog.GetTitleForQuestIDAsync` | `QUEST_DATA_LOAD_RESULT` | `C_QuestLog.RequestLoadQuestByID` |

Handle both outcomes with `Task.whenSettled`:

```luau check
local ItemWrappers = require("./src/Api/C_Item")

local function announce(itemID: number)
	Task.whenSettled(
		Api.C_Item.GetItemInfoAsync(itemID),
		function(result: ForeverMyth.Result<ItemWrappers.GetItemInfoResults, ForeverMyth.LoadFailed>)
			if result.kind == "Ok" then
				print(result.value.itemName)
			else
				print("no item " .. tostring(result.error.key))
			end
		end
	)
end
```

## Timers

`C_Timer.AfterAsync` is `C_Timer.After` as a task:

```luau check
local function remindLater()
	Task.inspect(Api.C_Timer.AfterAsync(5), function(_: nil)
		print("Five seconds later")
	end)
end
```
