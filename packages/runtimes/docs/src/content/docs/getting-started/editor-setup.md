---
title: Editor setup
description: "Configure luau-lsp so the wrappers, the WoW: Forever definitions and the new type solver work together."
---

The wrappers' types use Luau's new type solver and the WoW: Forever definitions. Configure
[luau-lsp](https://github.com/JohnnyMorganz/luau-lsp) with both.

## VS Code

Install the **Luau Language Server** extension, then in `.vscode/settings.json`:

```json
{
  "luau-lsp.platform.type": "standard",
  "luau-lsp.sourcemap.enabled": false,
  "luau-lsp.fflags.enableNewSolver": true,
  "luau-lsp.types.definitionFiles": { "@wow": "types/wow-forever.d.luau" }
}
```

`types/wow-forever.d.luau` is the definitions file from the
[wow-forever-luau-types release](https://github.com/Braden1996/wow-forever-luau-types/releases) that the library's
`woof.toml` pins (v0.7.0 for wow-forever-myth 0.6.0). If you install via [Woof](https://github.com/Braden1996/woof),
point `@wow` at `luau_packages/wow-types/wow-forever.d.luau`.

The same release ships `luau-lsp.settings.json`, which disables the Luau globals the game lacks, such as
`table.clone` and `require`. Copy its `luau-lsp.types.disabledGlobals` list into your settings, but leave out
`require` if you bundle with darklua: darklua replaces every `require` before the game sees it.

## Command line and CI

```sh
luau-lsp analyze --platform=standard --flag:LuauSolverV2=true \
  --definitions=@wow=types/wow-forever.d.luau --settings=luau-lsp.settings.json src/
```

## Zed

With the Luau extension, in `.zed/settings.json`:

```json
{
  "lsp": {
    "luau-lsp": {
      "settings": {
        "fflags": { "enable_new_solver": true },
        "luau-lsp": {
          "platform": { "type": "standard" },
          "types": { "definitionFiles": { "@wow": "types/wow-forever.d.luau" } }
        }
      }
    }
  }
}
```
