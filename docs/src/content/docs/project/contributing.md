---
title: Contributing
description: Set up the repository, run the gate, and work on the library or this site.
---

1. Install [mise](https://mise.jdx.dev) and run `mise install`. It installs every tool at the version in `mise.toml`,
   checked against `mise.lock`.
2. `mise exec -- moon run generator:fetch` downloads the two pinned releases into `.deps/`.
3. `mise exec -- moon run :check` runs everything CI runs, this site included.

| Command                                    | What it does                                            |
| ------------------------------------------ | ------------------------------------------------------- |
| `mise exec -- moon run generator:generate` | regenerate `src/Api` and `src/Widgets`                  |
| `mise exec -- moon run lib:build`          | build `dist/ForeverMyth.lua`                            |
| `mise exec -- moon run tests:spec`         | run every test against the bundle                       |
| `mise exec -- moon run docs:dev`           | serve this site locally                                 |
| `mise exec -- moon run docs:check`         | lint, type-check, format-check, build and link-check it |

## The site

The site lives in `docs/`: Astro and Starlight on Bun, TypeScript 7 for the type check, oxlint and oxfmt. Its
fantasy-styled components are a self-contained kit in `docs/src/wow-ui/`, forked from
[warcraftcn/ui](https://github.com/TheOrcDev/warcraftcn-ui). Import them from `docs/src/wow-ui/index.ts` only.

Mark an example ` ```luau check ` to type-check it at build time. These lines are in front of every checked block,
hidden:

```luau
local ForeverMyth = require("./src/ForeverMyth")
local Api, Widgets = ForeverMyth.Api, ForeverMyth.Widgets
local Maybe, Result, Task = ForeverMyth.Maybe, ForeverMyth.Result, ForeverMyth.Task
```

End a line with `-- error` to show an error on purpose. Any other error fails the build.

See [CONTRIBUTING.md](https://github.com/Braden1996/wow-forever-myth/blob/main/CONTRIBUTING.md) for the code style
and the release steps.
