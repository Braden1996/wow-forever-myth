---
title: Results
description: Functions whose first result means success or failure return a Result, with the failure reason as its error.
---

Some WoW functions report failure with a flag. `C_AddOns.LoadAddOn` returns `true` when the addon loaded, and `false`
with a reason such as `"DISABLED"` when it did not. In plain Lua, nothing makes you look at the flag.

For a reviewed list of such functions, the wrapper returns a `Result` instead. The success case carries the other
results (or `true` when there are none), and the failure case carries the reason:

```luau check
local function loadData(): string
	return Result.match(Api.C_AddOns.LoadAddOn("Speedline_Data"), {
		Ok = function(_loaded: true): string
			return "ready"
		end,
		Err = function(reason: string): string
			return "unavailable: " .. reason
		end,
	})
end
```

A `Result` cannot be used as a success by accident:

```luau check
local loaded: boolean = Api.C_AddOns.LoadAddOn("Speedline_Data") -- error
```

## When the reason is missing

Some functions return `false` without a reason. Their override names a fallback, so the error is never `nil`:
`LoadAddOn` uses `"UNKNOWN"`.

## Which functions

The documentation does not say which boolean-first results mean success: `C_Item.IsUsableItem` returns two booleans
that are both facts, not a success and a reason. So the list is reviewed by hand. It is in
[overrides/Results.luau](https://github.com/Braden1996/wow-forever-myth/blob/main/overrides/Results.luau), and
[Overrides](../../project/overrides/) explains how entries are added.
