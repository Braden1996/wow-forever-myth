# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow [Semantic Versioning](https://semver.org).

## [Unreleased]

## [0.1.0] - 2026-11-15

### Added

- Generated wrappers for 1,895 WoW: Forever functions and widget methods, from wow-forever-luau-types v0.3.0's
  `api-shapes.json`: `Maybe<T>` for one nilable result, read-only records with Blizzard's result names for several,
  `Maybe<record>` when the call may return nothing. Protected functions are never wrapped.
- `FnInto(reuse, ...)` for every wrapper: refills a record or `Maybe` you already hold, allocating nothing once warm.
- Reviewed overrides: 17 boolean-first APIs as `Result` (such as `C_AddOns.LoadAddOn`), 3 cache loads as `Task`
  (`C_Item.GetItemInfoAsync`, `C_Item.GetItemNameByIDAsync`, `C_QuestLog.GetTitleForQuestIDAsync`) and
  `C_Timer.AfterAsync`.
- `dist/ForeverMyth.lua`, the Lua 5.1 bundle (darklua, luau-true-myth v0.1.0 included), tested in a Lua 5.1-only
  environment with a fake WoW API.

[Unreleased]: https://github.com/Braden1996/wow-forever-myth/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/Braden1996/wow-forever-myth/releases/tag/v0.1.0
