---
title: Credits and licences
description: What the library and this site are built from, and their licences.
---

wow-forever-myth is released under the
[MIT licence](https://github.com/Braden1996/wow-forever-myth/blob/main/LICENSE).

## The library

| Project                                                                        | Licence | Used for                                                     |
| ------------------------------------------------------------------------------ | ------- | ------------------------------------------------------------ |
| [wow-forever-luau-types](https://github.com/Braden1996/wow-forever-luau-types) | MIT     | The definitions the wrappers are checked against, and shapes |
| [luau-true-myth](https://github.com/Braden1996/luau-true-myth)                 | MIT     | `Maybe`, `Result` and `Task`; bundled into `ForeverMyth.lua` |
| [true-myth](https://true-myth.dev) by Chris Krycho and contributors            | MIT     | The ideas and names luau-true-myth ports                     |
| [darklua](https://github.com/seaofvoices/darklua)                              | MIT     | Compiling Luau to Lua 5.1                                    |

The shapes come from Blizzard's `Blizzard_APIDocumentationGenerated` by way of wow-forever-luau-types; its
[credits](https://braden1996.github.io/wow-forever-luau-types/project/credits/) list those sources.

## This site

| Software                                                                                                  | Licence | Used for                                                                                    |
| --------------------------------------------------------------------------------------------------------- | ------- | ------------------------------------------------------------------------------------------- |
| [Astro](https://astro.build) and [Starlight](https://starlight.astro.build)                               | MIT     | Static site generator and documentation theme                                               |
| [starlight-luau](https://github.com/Braden1996/starlight-luau)                                            | MIT     | The API reference, generated from the Luau types                                            |
| [luau-web-checker](https://github.com/Braden1996/luau-web-checker)                                        | MIT     | Type-checking the examples at build time, with hover types                                  |
| [warcraftcn/ui](https://github.com/TheOrcDev/warcraftcn-ui) by TheOrcDev                                  | MIT     | Fantasy-styled components and frame textures, forked into `docs/src/wow-ui` as listed there |
| [React](https://react.dev), [Tailwind CSS](https://tailwindcss.com), [Radix UI](https://www.radix-ui.com) | MIT     | Rendering and styling the WoW UI components                                                 |
| [Cinzel](https://fonts.google.com/specimen/Cinzel) by Natanael Gama, via Fontsource                       | OFL-1.1 | Display typeface                                                                            |

## Trademarks

World of Warcraft, Warcraft and Blizzard Entertainment are trademarks or registered trademarks of Blizzard
Entertainment, Inc. This is an unofficial community project. It is not affiliated with, sponsored by or endorsed by
Blizzard Entertainment. The site uses no Blizzard artwork or logos.
