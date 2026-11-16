---
title: Combat, timing and events
description: Tasks for work that must wait for combat to end, for throttled and debounced calls, and for bursts of an event.
---

Three small runtime modules cover the frame-and-timer code most addons write by hand. Each one returns a
[`Task`](https://braden1996.github.io/luau-true-myth/understanding/task/), so the result composes with `Task.map`,
`Task.all` and `Task.async` like any other.

## After combat

Protected frames cannot be shown, moved or re-anchored while `InCombatLockdown()` is true. `Combat.run` runs the work at
once outside combat, and otherwise when `PLAYER_REGEN_ENABLED` fires. Work queued during the same combat runs in the
order it was queued.

```luau check
local function showWhenSafe(frame: Frame)
	return ForeverMyth.Combat.run(function(): boolean
		frame:Show()
		return frame:IsShown()
	end)
end
```

`Combat.outOfCombat()` is the same wait without the work: a `Task<nil, never>` that is already resolved outside combat.

## Debounce and throttle

Both wrap a function and give back one with the same parameters that returns a task.

- `Timing.debounce(seconds, run)` waits until the calls stop for `seconds`, then runs once with the last arguments.
- `Timing.throttle(seconds, run)` runs the first call at once, then at most once per `seconds`, with the last arguments
  of the calls in between.

Every call's task resolves with the value of the run that covered it, so a caller whose arguments were dropped still
learns when the work happened.

```luau check
local searchBox = ForeverMyth.Timing.debounce(0.3, function(text: string): number
	return #text
end)

Task.inspect(searchBox("hogger"), function(length: number)
	print("searched for " .. length .. " characters")
end)
```

## Bursts of an event

`Events.next(event, read)` resolves with the next firing of `event`: `read` receives the event's payload and returns
the task's value. Give `read` the type `ForeverMyth.EventReader<E, T>` and its parameters are checked against that
event's payload in the WoW: Forever definitions, without annotating them.

```luau check
local onLevel: ForeverMyth.EventReader<"PLAYER_LEVEL_UP", number> = function(level)
	return level
end

Task.inspect(ForeverMyth.Events.next("PLAYER_LEVEL_UP", onLevel), function(level: number)
	print("reached level " .. level)
end)
```

`Events.nextBurst(event, seconds, read)` starts a window at the next firing and resolves, `seconds` later, with every
payload read in that window. Events like `BAG_UPDATE` fire many times in one frame; this turns them into one refresh.

```luau check
local function refreshBags()
	Task.whenSettled(
		ForeverMyth.Events.nextBurst("BAG_UPDATE", 0.2, function(bagIndex: number): number
			return bagIndex
		end),
		function(result: ForeverMyth.Result<{ number }, never>)
			if result.kind == "Ok" then
				print(#result.value .. " bag updates")
			end
			refreshBags()
		end
	)
end
```

Calling again from the callback misses nothing: the window closes on a timer, not inside an event. The shared frame
listens to an event only while a task waits for it.
