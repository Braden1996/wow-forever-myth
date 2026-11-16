// oxfmt for the docs site: the settings of the owner's Higher monorepo (oxfmt.config.js there), including its
// import grouping. Markdown, JSON and YAML stay with the repository's dprint config.

import type { OxfmtConfig } from "oxfmt";

const config: OxfmtConfig = {
  ignorePatterns: [
    "**/node_modules/**",
    "**/dist/**",
    "**/.astro/**",
    "**/out-tsc/**",
    "**/package.json",
    "**/bun.lock",
    "**/*.md",
  ],
  printWidth: 120,
  tabWidth: 2,
  useTabs: false,
  semi: true,
  singleQuote: false,
  trailingComma: "all",
  sortPackageJson: false,
  sortImports: {
    customGroups: [
      { groupName: "builtin-types", modifiers: ["type"], selector: "builtin" },
      { groupName: "builtin-values", modifiers: ["value"], selector: "builtin" },
      { groupName: "external-types", modifiers: ["type"], selector: "external" },
      { groupName: "external-values", modifiers: ["value"], selector: "external" },
    ],
    groups: [
      ["side_effect_style", "side_effect"],
      { newlinesBetween: true },
      "builtin-types",
      { newlinesBetween: false },
      "builtin-values",
      { newlinesBetween: true },
      "external-types",
      { newlinesBetween: false },
      "external-values",
      { newlinesBetween: true },
      ["parent", "sibling", "index"],
      { newlinesBetween: true },
      "style",
      "unknown",
    ],
    ignoreCase: true,
    newlinesBetween: true,
    order: "asc",
    partitionByComment: true,
    partitionByNewline: false,
    sortSideEffects: false,
  },
};

export default config;
