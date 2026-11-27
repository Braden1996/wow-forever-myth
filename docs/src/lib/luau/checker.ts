import { readdirSync, readFileSync, statSync } from "node:fs";
import { join, relative } from "node:path";

import { Checker } from "luau-web-checker";

const PACKAGES = join("..", "luau_packages");
const TRUE_MYTH_SOURCE = join(PACKAGES, "truemyth", "src");
const LIBRARY_SOURCE = join("..", "packages", "forever-myth", "src");
const TRUE_MYTH_MODULES = "vendor/luau-true-myth/src";
const DISABLED_GLOBALS = "luau-lsp.types.disabledGlobals";

export const PRELUDE = [
  'local ForeverMyth = require("./src/ForeverMyth")',
  "local Api, Widgets = ForeverMyth.Api, ForeverMyth.Widgets",
  "local Maybe, Result, Task = ForeverMyth.Maybe, ForeverMyth.Result, ForeverMyth.Task",
].join("\n");

function luauFiles(dir: string): string[] {
  return readdirSync(dir).flatMap((entry) => {
    const path = join(dir, entry);
    if (statSync(path).isDirectory()) {
      return luauFiles(path);
    }
    return path.endsWith(".luau") ? [path] : [];
  });
}

function moduleName(prefix: string, root: string, file: string): string {
  return `${prefix}/${relative(root, file).replaceAll("\\", "/")}`;
}

export function readDisabledGlobals(): string[] {
  const settings: unknown = JSON.parse(readFileSync(join("..", ".build", "library.settings.json"), "utf8"));
  const names: unknown =
    typeof settings === "object" && settings !== null
      ? Object.entries(settings).find(([key]) => key === DISABLED_GLOBALS)?.[1]
      : undefined;
  if (!Array.isArray(names) || !names.every((name): name is string => typeof name === "string")) {
    throw new TypeError(`.build/library.settings.json has no ${DISABLED_GLOBALS}: run sgt run derive`);
  }
  return names;
}

async function createDocsChecker(): Promise<Checker> {
  const checker = await Checker.create({
    definitions: { "@wow": readFileSync(join(PACKAGES, "wow-types", "wow-forever.d.luau"), "utf8") },
    disabledGlobals: readDisabledGlobals(),
    aliases: { "@truemyth": TRUE_MYTH_MODULES },
    strict: true,
  });
  for (const file of luauFiles(TRUE_MYTH_SOURCE)) {
    checker.setSource(moduleName(TRUE_MYTH_MODULES, TRUE_MYTH_SOURCE, file), readFileSync(file, "utf8"));
  }
  for (const file of luauFiles(LIBRARY_SOURCE).filter((entry) => !entry.endsWith(".spec.luau"))) {
    checker.setSource(moduleName("src", LIBRARY_SOURCE, file), readFileSync(file, "utf8"));
  }
  return checker;
}

let shared: Promise<Checker> | undefined;

export function docsChecker(): Promise<Checker> {
  shared ??= createDocsChecker();
  return shared;
}
