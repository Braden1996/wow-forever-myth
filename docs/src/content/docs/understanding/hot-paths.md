---
title: Hot paths
description: What each wrapper allocates, and the Into variants that allocate nothing in code that runs every frame.
---

Wrapping a result means building a table for it. For most calls that cost is nothing to worry about. For code that
runs every frame, such as an `OnUpdate` arrow that reads the player's position, garbage adds up and the Lua collector
eventually pauses the game to clean it.

## What a call allocates

Wrappers are plain functions made once when the library loads. A call creates no closures and packs no arguments. What
it does allocate:

| Call                                 | Allocates per call                                                            |
| ------------------------------------ | ----------------------------------------------------------------------------- |
| `Fn` returning `Maybe`, value absent | nothing: `Nothing` is one shared value                                        |
| `Fn` returning `Maybe`, value there  | one `Just` table                                                              |
| `Fn` returning a record              | the record, one `Just` per present nilable field, and one for `Maybe<record>` |
| `FnInto(reuse, ...)`                 | nothing once warm                                                             |
| a `Result` override                  | one `Ok` or `Err` table, and the success record if there is one               |
| an `Async` wrapper                   | a `Task`, its resolvers and a closure; cached data resolves without waiting   |

## `Into`: refill what you already hold

Every `maybe` and `record` wrapper has an `Into` variant. It takes a value you got from an earlier call and refills it
instead of building a new one:

```luau check
local position = Api.UnitPosition("player")
local arrow = CreateFrame("Frame")
arrow:SetScript("OnUpdate", function()
	position = Api.UnitPositionInto(position, "player")
end)
```

For a `Maybe`, pass the previous `Maybe`. The first call builds a cell; every later one reuses it:

```luau check
local mapPosition = Api.C_Map.GetPlayerMapPosition(1429, "player")
local function onUpdate()
	mapPosition = Api.C_Map.GetPlayerMapPositionInto(mapPosition, 1429, "player")
end
```

## The rule that comes with it

`Into` **overwrites** what you give it. Anything else that kept a reference to the old record sees the new values. Use
`Into` for values that live in one place, such as the state of one frame, and plain calls everywhere else.
