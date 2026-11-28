---
title: Introduction
description: What wow-forever-myth is, the everyday problems it solves in a World of Warcraft addon, and how it is made.
---

If you just want to use it, jump to [Install](../getting-started/install/) or take the [Tour](../getting-started/tour/).

## What is it?

The World of Warcraft API is a few thousand Lua functions, and most of them were designed long before anyone
type-checked an addon. Three habits of that API cause most addon bugs:

- **A result that is sometimes `nil`.** `C_QuestLog.GetTitleForQuestID` returns nothing until the game has loaded
  the quest. Nothing in Lua stops you from using that `nil` as a string, and you find out with an error in the
  middle of play.
- **A pile of return values.** `C_Item.GetItemInfo` returns eighteen values. Code that wants the item level counts
  to the fourth and hopes nobody reorders them.
- **Success hidden in a flag.** `C_AddOns.LoadAddOn` returns `false` and a reason when it fails. Forget to look at
  the first value and the failure goes unnoticed.

wow-forever-myth wraps the API so these habits show up in the types. It uses the three types of
[luau-true-myth](https://braden1996.github.io/luau-true-myth/):

- **`Maybe`** for a result that may be missing. You cannot read the value without first handling "nothing".
- **Records** for several results, with Blizzard's own names: `info.itemLevel`.
- **`Result`** for calls that succeed or fail, and **`Task`** for results that arrive later, such as item data the
  game has to fetch first.

The raw API is still there. You choose, call by call, whether to use `C_Item.GetItemInfo` or the wrapped
`Api.C_Item.GetItemInfo`.

## Why generate it?

Writing a wrapper by hand for every function would take months, and the wrappers would drift from the game. Instead,
[wow-forever-luau-types](https://braden1996.github.io/wow-forever-luau-types/) reads Blizzard's own API documentation
for the Forever client and records the _shape_ of every function's results: one value that may be nil, several named
values, nothing at all. This library turns each shape into a wrapper. When the game changes, the wrappers are
regenerated, not rewritten.

Some meaning cannot be read from the documentation. It does not say that `LoadAddOn`'s first result means "it
worked", or that `GetItemInfo` returns nothing because the item is not cached yet. Those facts live in a short,
reviewed list of [overrides](../project/overrides/), each with its reason and its own tests.

## What it is careful about

- **Protected functions are never wrapped.** Blizzard marks some functions as protected. Calling them from the wrong
  code path breaks your addon, so the generator refuses to touch them.
- **Every-frame code allocates nothing.** Each wrapper has an `Into` variant that refills a value you already hold.
  See [Hot paths](../understanding/hot-paths/).
- **It runs as plain Lua 5.1.** The library is written in strict Luau and compiled with darklua. Its tests run against
  the compiled file, in an environment with only Lua 5.1 and a fake game API.

## Using these docs

- [Install](../getting-started/install/) and [Editor setup](../getting-started/editor-setup/) get you running.
- The [Tour](../getting-started/tour/) shows each kind of wrapper in a few minutes.
- **Understanding** explains [shapes](../understanding/shapes/), [records](../understanding/records/),
  [hot paths](../understanding/hot-paths/), [results](../understanding/results/) and
  [loads and timers](../understanding/loads-and-timers/).
- The [API reference](../reference/) lists every wrapper, one page per namespace and widget type.
- **Project** covers [how it is generated](../project/how-it-works/) and [the overrides](../project/overrides/).
