---
title: Contributing
description: Set up the repository, run the gate, and work on the library or this site.
---

1. Install [mise](https://mise.jdx.dev) and run `mise install`. It installs every tool at the version in `mise.toml`,
   checked against `mise.lock`.
2. `mise exec -- sgt install` downloads the pinned releases from `woof.toml` / `woof.lock` into `luau_packages/`.
3. `mise exec -- sgt check && mise exec -- sgt test` runs the fast local gate.

| Command                                   | What it does                                                |
| ----------------------------------------- | ----------------------------------------------------------- |
| `mise exec -- sgt run generate`           | regenerate `packages/forever-myth/src/Api` and `Widgets`    |
| `mise exec -- sgt run build`              | build `dist/ForeverMyth.lua`                                |
| `mise exec -- sgt run bundle-specs`       | run every test against the bundle                           |
| `mise exec -- sgt run docs-dev`           | serve this site locally                                     |
| `mise exec -- sgt run docs-check`         | lint, type-check, format-check, build and link-check it     |

## The site

The site lives in `docs/`: Astro and Starlight on Bun, TypeScript 7 for the type check, oxlint and oxfmt. Its
theme and fantasy-styled components come from
[starlight-warcraft](https://github.com/Braden1996/starlight-warcraft): import them from `starlight-warcraft/react`.

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
