# Contributing

## Setup

1. Install [mise](https://mise.jdx.dev) and run `mise install` (exact tool versions from `mise.toml`, checksums in
   `mise.lock`).
2. `mise exec -- lefthook install` for the git hooks.
3. `mise exec -- sgt install` downloads the pinned releases from `woof.toml` / `woof.lock` into `luau_packages/`.
   Editors and Sergeant read the WoW: Forever definitions and `luau-true-myth` sources from there.

`mise exec -- sgt check && mise exec -- sgt test` is the fast local gate; CI runs it alongside the generator,
bundle, fixture, and docs commands.

## How the library is made

| Path                                                                            | What it is                                                                                 |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `woof.toml`, `woof.lock`                                                        | `luau-true-myth` and `wow-forever-luau-types`, pinned by tag and SHA-256 via Woof          |
| `generator/`                                                                    | reads `api-shapes.json`, validates `overrides/` against it, plans and renders the wrappers |
| `overrides/`                                                                    | the reviewed semantics the documentation cannot express, each with a `why`                 |
| `packages/forever-myth/src/Runtime/`                                            | hand-written Tasks: `Loads`, `Combat`, `Timing`, `Events`; `Reuse` for the `Into` variants |
| `packages/forever-myth/src/Api`, `Widgets`, `ApiIndex.luau`, `WidgetIndex.luau` | generated; never edit by hand                                                              |
| `dist/ForeverMyth.lua`                                                          | the darklua bundle; never edit by hand                                                     |
| `tests/spec/`                                                                   | runtime specs, run against the bundle in a fake WoW world (`tests/support/World.luau`)     |
| `tests/pass`, `tests/fail`                                                      | type fixtures: clean, and exactly the diagnostics in `.expected`                           |

`Generated.spec.luau` checks every generated wrapper against its shape: arguments pass through, results map to the
documented fields, nils become `Nothing`, and `Into` reuses what it is given.

## Adding an override

1. Find the API in `luau_packages/wow-types/api-shapes.json`.
2. Add an entry to the matching file in `overrides/` with a `why` that names the evidence (the event, the error
   strings, a Blizzard UI call site). The generator rejects an entry that does not fit the shape.
3. `mise exec -- sgt run generate && mise exec -- sgt run build && mise exec -- sgt run banner`.
4. `Overrides.spec.luau` tests every entry generically; add a specific test if the API needs one.

## Bumping a dependency

Update the release tag/asset in `woof.toml`, run `mise exec -- woof install` to refresh `woof.lock` and
`luau_packages/`, then run `mise exec -- sgt run derive`, `generate`, `build`, and `banner`.
Dependabot only bumps GitHub Actions.

## Code style

- `--!strict` everywhere, Luau's new solver.
- No comments in Luau: descriptive names and small functions. `scripts/lint.luau` enforces it.
- A cast to `any` lives only in a small function named `unchecked...` that states the assumption.
- Library code uses only Lua 5.1's standard library and the WoW API (Sergeant enforces the Lua 5.1 target and forbids
  Luau stdlib calls).

## Releases

Move the "Unreleased" notes in `CHANGELOG.md` under a version heading, set `version` in
`packages/forever-myth/src/ForeverMyth.luau`, `packages/forever-myth/sergeant.jsonc`, and `woof.toml`, and tag
`vX.Y.Z` on `main`. The release workflow re-runs the full gate and publishes `ForeverMyth.lua`, a Woof-ready source
archive (`wow-forever-myth-X.Y.Z.zip`), and `SHA256SUMS`.
