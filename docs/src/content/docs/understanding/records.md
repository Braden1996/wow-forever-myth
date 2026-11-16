---
title: Records
description: Several results become one read-only record named after Blizzard's documentation, with Maybe for the nilable parts.
---

Many WoW functions return several values. In plain Lua you take them by position:

```lua
local _, _, _, itemLevel = C_Item.GetItemInfo(6948)
```

The wrapper returns one record instead. Its fields are named the way Blizzard's documentation names the results, so
the code says what it means and survives a reordering:

```luau check
local cooldown = Api.C_Item.GetItemCooldown(6948)
local ready = cooldown.durationSeconds == 0
```

## Read-only

Record fields are declared `read`. The record describes what the game said; changing it would only lie to the rest of
your code, so the type checker refuses:

```luau check
local position = Api.UnitPosition("player")
position.positionX = 0 -- error
```

## Nilable fields are `Maybe`

When the documentation says one of the results may be nil, that field is a `Maybe`. `GetItemInfo`'s `setID` is
missing for items outside a set:

```luau check
local ItemWrappers = require("./src/Api/C_Item")

local function setOf(itemID: number): number
	local item = Api.C_Item.GetItemInfo(itemID)
	return Maybe.mapOr(item, 0, function(info: ItemWrappers.GetItemInfoResults): number
		return Maybe.unwrapOr(info.setID, 0)
	end)
end
```

## Records that may be absent

When the whole call may return nothing, as `GetItemInfo` does for an item the client has not cached, the record comes
wrapped in a `Maybe`. The wrapper checks every result the documentation promises is present; if any is missing, you
get `Nothing` rather than a half-filled record.

## The record types

Each module exports its record types, named after the function: `GetItemInfoResults`, `UnitPositionResults`. Require
the module to name them in your own signatures:

```luau check
local ItemWrappers = require("./src/Api/C_Item")

local function describe(info: ItemWrappers.GetItemInfoResults): string
	return info.itemName .. " (" .. info.itemType .. ")"
end
```

The [API reference](../../reference/) lists every record with its fields.
