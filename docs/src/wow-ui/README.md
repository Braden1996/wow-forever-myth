# WoW UI

The site's fantasy-styled components: a self-contained subset of
[warcraftcn/ui](https://github.com/TheOrcDev/warcraftcn-ui) by TheOrcDev, forked at commit
`67dfa8e30442ae042b3d63030c17cb00590542ff` under the MIT licence ([LICENSE.md](LICENSE.md)), by way of
[wow-forever-luau-types' docs](https://github.com/Braden1996/wow-forever-luau-types/tree/main/docs/src/components/warcraftcn).

Everything the components need lives in this folder: `cn.ts`, `warcraft.css` and `assets/`. Nothing outside it is
imported, so the folder can become its own package by adding a `package.json` and pointing `index.ts` at it.

| File            | Upstream (`components/ui/warcraftcn/`) | Changes                                                       |
| --------------- | -------------------------------------- | ------------------------------------------------------------- |
| `button.tsx`    | `button.tsx`                           | strict TypeScript props, relative imports                     |
| `card.tsx`      | `card.tsx`                             | strict TypeScript props, smaller header padding               |
| `badge.tsx`     | `badge.tsx`                            | no faction variant; renders a `span`                          |
| `cn.ts`         | `lib/utils.ts`                         | the `cn` helper, moved into the folder                        |
| `warcraft.css`  | `styles/warcraft.css`                  | used classes only, local textures, self-hosted Cinzel         |
| `assets/*.webp` | `assets/`                              | unchanged (frame textures drawn for warcraftcn, not game art) |

Use it from Astro or MDX through `index.ts`, and load `warcraft.css` once in the site's global stylesheet. Its
peer dependencies are React, Tailwind CSS 4, `class-variance-authority`, `clsx`, `tailwind-merge`,
`@radix-ui/react-slot` and `@fontsource/cinzel`.
