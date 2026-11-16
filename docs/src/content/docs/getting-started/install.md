---
title: Install
description: Add wow-forever-myth to a plain Lua addon or to a strict Luau addon built with darklua.
---

Each [release](https://github.com/Braden1996/wow-forever-myth/releases) has two files and a `SHA256SUMS` to verify
them:

| File                             | For                                                                         |
| -------------------------------- | --------------------------------------------------------------------------- |
| `ForeverMyth.lua`                | Any addon. One Lua 5.1 file with every wrapper and luau-true-myth included. |
| `wow-forever-myth-<version>.zip` | Strict Luau addons. The Luau sources, to type-check and bundle yourself.    |

## A plain Lua addon

Copy `ForeverMyth.lua` into your addon and list it in the `.toc` before your own files:

```text
## Interface: 16001
## Title: My Addon
Libs/ForeverMyth.lua
Core.lua
```

Listed in a `.toc`, the file stores the library on your addon's namespace:

```lua
local _, ns = ...
local Api, Maybe = ns.ForeverMyth.Api, ns.ForeverMyth.Maybe
```

The bundle holds every wrapper, about 1.2 MB of Lua. That is fine for most addons. If size matters, use the sources
and bundle only what you require.

## A strict Luau addon

1. Unpack the source archive into your project, for example under `vendor/wow-forever-myth/`.
2. The sources require luau-true-myth as `@truemyth/...`. Download the
   [luau-true-myth release](https://github.com/Braden1996/luau-true-myth/releases) that the archive's `deps.toml`
   pins, and point the alias at its `src/` in `.luaurc`:

   ```json
   {
     "languageMode": "strict",
     "aliases": { "truemyth": "./vendor/luau-true-myth/src" }
   }
   ```

3. Give darklua the same alias, so `bundle` can follow it:

   ```json
   {
     "bundle": {
       "require_mode": { "name": "path", "sources": { "@truemyth": "./vendor/luau-true-myth/src" } }
     }
   }
   ```

4. Require only what you use. Each namespace and widget type is its own module:

   ```luau
   local C_Item = require("./vendor/wow-forever-myth/src/Api/C_Item")
   ```

   or everything at once through `src/ForeverMyth`.

The library is type-checked against the [WoW: Forever definitions](https://braden1996.github.io/wow-forever-luau-types/)
release that `deps.toml` pins. Use the same release in your editor; [Editor setup](../editor-setup/) shows how.
