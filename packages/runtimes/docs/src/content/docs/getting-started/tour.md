---
title: Tour
description: Every kind of wrapper in five minutes.
---

A quick look at each kind of wrapper. Each has its own page under **Understanding** with the details.

The examples were type-checked against the library and the WoW: Forever definitions when this site was built. Hover a
name to see the type Luau inferred for it. Every example starts with these lines, hidden from now on:

```luau check
local ForeverMyth = require("./src/ForeverMyth")
local Api, Widgets = ForeverMyth.Api, ForeverMyth.Widgets
local Maybe, Result, Task = ForeverMyth.Maybe, ForeverMyth.Result, ForeverMyth.Task
```

## One result that may be missing: `Maybe`

`C_QuestLog.GetTitleForQuestID` returns nothing until the game has loaded the quest. The wrapper says so in its type:

```luau check
local title = Api.C_QuestLog.GetTitleForQuestID(176)

local shown = Maybe.unwrapOr(title, "Loading...")
local length = Maybe.mapOr(title, 0, function(text: string): number
	return #text
end)
```

Reading `title` as a string without handling "nothing" is a type error:

```luau check
local title = Api.C_QuestLog.GetTitleForQuestID(176)
local upper = string.upper(title) -- error
```

## Several results: a record

`UnitPosition` returns four values. The wrapper returns them as one read-only record with Blizzard's names:

```luau check
local position = Api.UnitPosition("player")
local where = string.format("%.1f, %.1f", position.positionX, position.positionY)
```

When the call may return nothing at all, the record comes wrapped in a `Maybe`:

```luau check
local ItemWrappers = require("./src/Api/C_Item")

local item = Api.C_Item.GetItemInfo(6948)
local level = Maybe.mapOr(item, 0, function(info: ItemWrappers.GetItemInfoResults): number
	return info.itemLevel
end)
```

## Success or failure: `Result`

`C_AddOns.LoadAddOn` returns a flag and a reason. The wrapper returns a `Result`, so failure cannot be ignored:

```luau check
local message = Result.match(Api.C_AddOns.LoadAddOn("MyAddon_Data"), {
	Ok = function(_loaded: true): string
		return "loaded"
	end,
	Err = function(reason: string): string
		return "could not load: " .. reason
	end,
})
```

## Later: `Task`

`GetItemInfoAsync` returns a `Task`. It resolves at once if the item is cached; otherwise it asks the game to load it
and resolves on `ITEM_DATA_LOAD_RESULT`:

```luau check
local ItemWrappers = require("./src/Api/C_Item")

local function announce(itemID: number)
	Task.inspect(Api.C_Item.GetItemInfoAsync(itemID), function(info: ItemWrappers.GetItemInfoResults)
		print(info.itemName .. " is level " .. info.itemLevel)
	end)
end
```

## Widget methods

Methods of widgets take the widget first:

```luau check
local frame = CreateFrame("Frame", nil, UIParent)
local anchor = Widgets.ScriptRegion.GetPoint(frame, 1)
local anchored = Maybe.isJust(anchor)
```

## Every frame: `Into`

Each wrapper has an `Into` variant that refills a value you already hold, so code that runs every frame allocates
nothing:

```luau check
local position = Api.UnitPosition("player")
local frame = CreateFrame("Frame")
frame:SetScript("OnUpdate", function()
	position = Api.UnitPositionInto(position, "player")
end)
```

Next: [Shapes](../../understanding/shapes/) explains which wrapper each function gets.
