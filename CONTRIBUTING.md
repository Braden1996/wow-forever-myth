# Contributing

## Setup

1. Install [mise](https://mise.jdx.dev) and run `mise install` (exact tool versions from `mise.toml`, checksums in
   `mise.lock`).
2. `mise exec -- lefthook install` for the git hooks.
3. `mise exec -- moon run generator:fetch` downloads the two pinned releases (`deps.toml`) into `.deps/`. Editors
   read the WoW: Forever definitions from there.

`mise exec -- moon run :check` is the gate; CI runs it cold on every pull request, and the pre-push hook runs it for
what changed.

## How the library is made

| Path                                                                  | What it is                                                                                 |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `deps.toml`                                                           | luau-true-myth and wow-forever-luau-types, pinned by tag and the SHA-256 of every asset    |
| `generator/`                                                          | reads `api-shapes.json`, validates `overrides/` against it, plans and renders the wrappers |
| `overrides/`                                                          | the reviewed semantics the documentation cannot express, each with a `why`                 |
| `src/Runtime/`                                                        | hand-written Tasks: `Loads`, `Combat`, `Timing`, `Events`; `Reuse` for the `Into` variants |
| `src/Api`, `src/Widgets`, `src/ApiIndex.luau`, `src/WidgetIndex.luau` | generated; never edit by hand                                                              |
| `dist/ForeverMyth.lua`                                                | the darklua bundle; never edit by hand                                                     |
| `tests/spec/`                                                         | runtime specs, run against the bundle in a fake WoW world (`tests/support/World.luau`)     |
| `tests/pass`, `tests/fail`                                            | type fixtures: clean, and exactly the diagnostics in `.expected`                           |

`Generated.spec.luau` checks every generated wrapper against its shape: arguments pass through, results map to the
documented fields, nils become `Nothing`, and `Into` reuses what it is given.

## Adding an override

1. Find the API in `.deps/wow-forever-luau-types/api-shapes.json`.
2. Add an entry to the matching file in `overrides/` with a `why` that names the evidence (the event, the error
   strings, a Blizzard UI call site). The generator rejects an entry that does not fit the shape.
3. `mise exec -- moon run generator:generate lib:build`, then `lune run scripts/banner`.
4. `Overrides.spec.luau` tests every entry generically; add a specific test if the API needs one.

## Bumping a dependency

Change the tag in `deps.toml`, copy each asset's hash from that release's `SHA256SUMS`, then regenerate and build.
There is no Renovate; Dependabot only bumps GitHub Actions.

## Code style

- `--!strict` everywhere, Luau's new solver.
- No comments in Luau: descriptive names and small functions. `scripts/lint.luau` enforces it.
- A cast to `any` lives only in a small function named `unchecked...` that states the assumption.
- Library code uses only Lua 5.1's standard library and the WoW API (the type check disables the rest).

## Releases

Move the "Unreleased" notes in `CHANGELOG.md` under a version heading, set `version` in `src/ForeverMyth.luau`, and
tag `vX.Y.Z` on `main`. The release workflow re-runs the gate and publishes `ForeverMyth.lua`, a source archive and
`SHA256SUMS`.
