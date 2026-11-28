/// <reference types="node" />

import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";

import { LIBRARY_SOURCE, OVERRIDE_SOURCE, REPOSITORY_ROOT } from "./paths.ts";

const SHAPES = join(REPOSITORY_ROOT, "luau_packages", "wow-types", "api-shapes.json");
const GENERATED_FOLDERS = ["Api", "Widgets"] as const;
const OVERRIDE_FILES = { results: "Results.luau", loads: "Loads.luau", callbacks: "Callbacks.luau" } as const;
const OVERRIDE_KEY = /^\t\["([^"]+)"\] = /gmu;

export type OverrideKind = keyof typeof OVERRIDE_FILES;

export interface Facts {
  readonly kinds: Readonly<Record<string, number>>;
  readonly wrapped: number;
  readonly modules: number;
  readonly overrides: Readonly<Record<OverrideKind, number>>;
  readonly reviewed: number;
}

export function countKinds(shapes: unknown): Record<string, number> {
  const counts: Record<string, number> = {};
  if (typeof shapes !== "object" || shapes === null) {
    throw new TypeError("api-shapes.json is not an object");
  }
  const categories: unknown[] = Object.values(shapes);
  for (const category of categories) {
    if (typeof category !== "object" || category === null) {
      throw new TypeError("api-shapes.json has a category that is not an object");
    }
    const entries: unknown[] = Object.values(category);
    for (const shape of entries) {
      const kind = typeof shape === "object" && shape !== null && "kind" in shape ? shape.kind : undefined;
      if (typeof kind !== "string") {
        throw new TypeError("api-shapes.json has a shape without a kind");
      }
      counts[kind] = (counts[kind] ?? 0) + 1;
    }
  }
  return counts;
}

export function overrideKeys(source: string): string[] {
  return [...source.matchAll(OVERRIDE_KEY)].map((match) => match[1] ?? "");
}

function countOverrideFile(file: string): number {
  return overrideKeys(readFileSync(join(OVERRIDE_SOURCE, file), "utf8")).length;
}

function countOverrides(): Record<OverrideKind, number> {
  return {
    results: countOverrideFile(OVERRIDE_FILES.results),
    loads: countOverrideFile(OVERRIDE_FILES.loads),
    callbacks: countOverrideFile(OVERRIDE_FILES.callbacks),
  };
}

function countModules(): number {
  return GENERATED_FOLDERS.reduce(
    (total, folder) =>
      total + readdirSync(join(LIBRARY_SOURCE, folder)).filter((entry) => entry.endsWith(".luau")).length,
    0,
  );
}

export function wrappedCount(kinds: Readonly<Record<string, number>>, callbacks: number): number {
  return (kinds["maybe"] ?? 0) + (kinds["record"] ?? 0) + callbacks;
}

function readFacts(): Facts {
  const shapes: unknown = JSON.parse(readFileSync(SHAPES, "utf8"));
  const kinds = countKinds(shapes);
  const overrides = countOverrides();
  return {
    kinds,
    wrapped: wrappedCount(kinds, overrides.callbacks),
    modules: countModules(),
    overrides,
    reviewed: overrides.results + overrides.loads + overrides.callbacks,
  };
}

export const facts: Facts = readFacts();

export function formatCount(n: number): string {
  return n.toLocaleString("en-GB");
}

export function countOf(kind: string): string {
  return formatCount(facts.kinds[kind] ?? 0);
}
