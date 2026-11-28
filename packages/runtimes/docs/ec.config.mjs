import { defineEcConfig } from "@astrojs/starlight/expressive-code";
import { pluginLuauTypes } from "luau-web-checker/expressive-code";

import { docsChecker, PRELUDE } from "./src/lib/luau/checker.ts";

export default defineEcConfig({
  themes: ["github-dark-default", "github-light-default"],
  styleOverrides: { borderRadius: "0.25rem" },
  plugins: [pluginLuauTypes({ checker: docsChecker, check: "marked", prelude: PRELUDE, tooltips: false })],
});
