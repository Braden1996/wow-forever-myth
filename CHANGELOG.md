# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow [Semantic Versioning](https://semver.org).

## [Unreleased]

## [0.2.1] - 2026-11-16

### Fixed

- `Async` load wrappers (`C_Item.GetItemInfoAsync`, `C_Item.GetItemNameByIDAsync`,
  `C_QuestLog.GetTitleForQuestIDAsync`) failed in the game with "attempt to call a table value" when their load
  event fired: the runtime used Luau's generalised iteration, which Lua 5.1 lacks and darklua does not lower.

### Added

- Gates against Luau-only iteration: the lint rejects it in `src/` and `wow/`, the build rejects it in the bundle,
  and `tests:lua51` runs the bundle under LuaJIT (pinned in mise) through a load event, a timer, records, `Into` and
  `Result`.

## [0.2.0] - 2026-11-16

### Changed

- Built and tested against wow-forever-luau-types v0.4.0, whose definitions type about 150 results of calls that
  may return nothing as `T?`. The wrappers are unchanged: those calls already returned `Maybe` here. Code that calls
  the raw API with the new definitions may get new nil-check errors; the wrapped calls do not.

### Added

- A documentation site at [braden1996.github.io/wow-forever-myth](https://braden1996.github.io/wow-forever-myth/): an
  introduction, guides with examples type-checked at build time (luau-web-checker), and an API reference generated
  from `src/` by starlight-luau, one page per namespace and widget type. Styled with a self-contained fork of
  warcraftcn/ui in `docs/src/wow-ui/`.

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

[Unreleased]: https://github.com/Braden1996/wow-forever-myth/compare/v0.2.1...HEAD
[0.2.1]: https://github.com/Braden1996/wow-forever-myth/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/Braden1996/wow-forever-myth/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/Braden1996/wow-forever-myth/releases/tag/v0.1.0
