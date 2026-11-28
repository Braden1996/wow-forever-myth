/// <reference types="node" />

import { join, resolve, sep } from "node:path";
import { cwd } from "node:process";

const runtime = join("packages", "runtimes", "docs");
const workingDirectory = cwd();

export const REPOSITORY_ROOT: string = workingDirectory.endsWith(sep + runtime)
  ? resolve(workingDirectory, "../../..")
  : workingDirectory;
export const LIBRARY_SOURCE: string = join(REPOSITORY_ROOT, "packages/libraries/luau/wow/forever-myth/src");
export const OVERRIDE_SOURCE: string = join(REPOSITORY_ROOT, "packages/libraries/luau/pure/generator/src/overrides");
