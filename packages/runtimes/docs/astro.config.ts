import react from "@astrojs/react";
import starlight from "@astrojs/starlight";
import { defineConfig } from "astro/config";
import starlightLuau from "starlight-luau";
import starlightWarcraft from "starlight-warcraft";

import { BASE } from "./src/lib/base.ts";

const repository = "https://github.com/Braden1996/wow-forever-myth";

const config: ReturnType<typeof defineConfig> = defineConfig({
  site: "https://braden1996.github.io",
  base: BASE,
  trailingSlash: "always",
  output: "static",
  compressHTML: true,
  integrations: [
    starlight({
      title: "wow-forever-myth",
      description:
        "The WoW: Forever API as Maybe, Result and Task: generated, strictly typed wrappers for World of Warcraft addons written in Luau.",
      logo: { src: "./src/assets/logo.svg", alt: "" },
      favicon: "/favicon.svg",
      social: [{ icon: "github", label: "GitHub", href: repository }],
      editLink: { baseUrl: `${repository}/edit/main/packages/runtimes/docs/` },
      lastUpdated: true,
      credits: false,
      customCss: ["./src/styles/global.css"],
      components: { Footer: "./src/components/starlight/footer.astro" },
      head: [{ tag: "meta", attrs: { name: "color-scheme", content: "dark light" } }],
      sidebar: [
        {
          label: "Introduction",
          items: [
            { slug: "introduction" },
            { slug: "getting-started/install" },
            { slug: "getting-started/editor-setup" },
            { slug: "getting-started/tour" },
          ],
        },
        {
          label: "Understanding",
          items: [
            { slug: "understanding/shapes" },
            { slug: "understanding/records" },
            { slug: "understanding/hot-paths" },
            { slug: "understanding/results" },
            { slug: "understanding/loads-and-timers" },
            { slug: "understanding/combat-timing-events" },
          ],
        },
        {
          label: "API reference",
          items: [
            { label: "Overview", link: "/reference/" },
            { label: "ForeverMyth", link: "/reference/forevermyth/" },
            { label: "Runtime", items: [{ autogenerate: { directory: "reference/runtime" } }] },
            {
              label: "Namespaces and globals",
              collapsed: true,
              items: [{ autogenerate: { directory: "reference/api" } }],
            },
            {
              label: "Widgets and script objects",
              collapsed: true,
              items: [{ autogenerate: { directory: "reference/widgets" } }],
            },
          ],
        },
        {
          label: "Project",
          items: [
            { slug: "project/how-it-works" },
            { slug: "project/overrides" },
            { slug: "project/contributing" },
            { slug: "project/credits" },
          ],
        },
      ],
      plugins: [
        starlightWarcraft(),
        starlightLuau({
          source: "../../libraries/luau/wow/forever-myth/src",
          exclude: ["ApiIndex.luau", "WidgetIndex.luau", "*.spec.luau"],
          output: "reference",
          sidebar: false,
          examples: false,
          sourceUrl: `${repository}/blob/main/packages/libraries/luau/wow/forever-myth/src/{file}#L{line}`,
        }),
      ],
    }),
    react(),
  ],
});

export default config;
