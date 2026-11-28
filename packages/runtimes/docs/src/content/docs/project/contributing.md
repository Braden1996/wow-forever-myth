---
title: Contributing
description: Set up the repository, run the gate, and work on the library or this site.
---

Follow the [repository contributor guide](https://github.com/Braden1996/wow-forever-myth/blob/main/CONTRIBUTING.md)
to install the pinned tools and run the Sergeant checks.

Run `sgt run @wow-forever-myth/docs` to serve the site or `sgt build @wow-forever-myth/docs` to build it.

## Checked Lua examples

Mark an example ` ```luau check ` to type-check it at build time. These lines are in front of every checked block,
hidden:

```luau
local ForeverMyth = require("./src/ForeverMyth")
local Api, Widgets = ForeverMyth.Api, ForeverMyth.Widgets
local Maybe, Result, Task = ForeverMyth.Maybe, ForeverMyth.Result, ForeverMyth.Task
```

End a line with `-- error` to show an error on purpose. Any other error fails the build.
