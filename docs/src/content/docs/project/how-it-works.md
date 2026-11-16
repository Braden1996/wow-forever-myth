---
title: How it works
description: From Blizzard's documentation to a tested Lua 5.1 bundle, step by step.
---

```text
Blizzard_APIDocumentationGenerated ─┐
LuaCATS annotations ────────────────┼─▶ wow-forever-luau-types ─▶ wow-forever.d.luau, api-shapes.json
client API dump ────────────────────┘                                        │
                                                                             ▼
overrides/ (reviewed) ──────────────────────────────▶ generator/ ─▶ src/Api, src/Widgets
                                                                             │
luau-true-myth ─────────────────────────────────────────────────▶ darklua ─▶ dist/ForeverMyth.lua
```

1. **Shapes.** [wow-forever-luau-types](https://braden1996.github.io/wow-forever-luau-types/) merges Blizzard's API
   documentation, community annotations and a dump of the live client into definitions for luau-lsp. Alongside them
   it writes `api-shapes.json`: for every function and widget method, the kind of results it has, their documented
   names and nilability, its parameters, and whether it is protected.
2. **Pinned inputs.** This repository pins that release, and the luau-true-myth release it builds on, in `deps.toml`
   by tag and by the SHA-256 of every file. `moon run generator:fetch` downloads them and fails on any mismatch.
3. **Overrides.** [`overrides/`](../overrides/) adds what the documentation cannot say. The generator checks every
   entry against the shapes before it uses it.
4. **Generation.** `generator/` plans one module per namespace and per widget type and renders strict Luau. The
   generated files are committed, and CI fails if they differ from a fresh generation.
5. **Type check.** Every module is checked with luau-lsp's new solver against the pinned definitions, with the game's
   missing Luau globals disabled.
6. **Bundle.** darklua compiles everything, luau-true-myth included, into one Lua 5.1 file. The build checks that it
   parses as Lua 5.1 and that it uses only Lua 5.1's standard library and globals the game declares.
7. **Tests.** The bundle is loaded in Lune with only Lua 5.1's standard library and a fake game API. Every generated
   wrapper is checked against its shape (arguments passed through, results named, nils as `Nothing`, `Into` reusing
   its value), and every override has named tests.

## This site

The site is built with [Astro](https://astro.build) and [Starlight](https://starlight.astro.build). Its
[API reference](../../reference/) is generated from `src/` by
[starlight-luau](https://github.com/Braden1996/starlight-luau), from the types alone, one page per namespace and
widget type. Examples marked as checked are type-checked at build time by
[luau-web-checker](https://github.com/Braden1996/luau-web-checker) against the library and the pinned definitions; an
example that stops type-checking fails the build.
