/// <reference types="bun" />

import { describe, expect, test } from "bun:test";
import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";

import { countKinds, facts, overrideKeys, wrappedCount } from "./facts.ts";
import { LIBRARY_SOURCE } from "./paths.ts";

describe("countKinds", () => {
  test("counts every shape's kind across both categories", () => {
    const shapes = {
      functions: { A: { kind: "maybe" }, B: { kind: "void" }, C: { kind: "maybe" } },
      widgetMethods: { "Frame:D": { kind: "record" } },
    };
    expect(countKinds(shapes)).toEqual({ maybe: 2, void: 1, record: 1 });
  });

  test("rejects a shape without a kind", () => {
    expect(() => countKinds({ functions: { A: {} } })).toThrow("without a kind");
  });
});

describe("overrideKeys", () => {
  test("reads the quoted keys of an override table", () => {
    const source = '\t["C_AddOns.LoadAddOn"] = {\n\t\terror = "value",\n\t},\n\t["C_Timer.After"] = { x = 1 },\n';
    expect(overrideKeys(source)).toEqual(["C_AddOns.LoadAddOn", "C_Timer.After"]);
  });
});

describe("the site's facts", () => {
  test("wrapped counts maybe and record shapes plus callback overrides", () => {
    expect(wrappedCount({ maybe: 3, record: 2, void: 9 }, 1)).toBe(6);
  });

  test("agree with the generated wrappers", () => {
    const plain = ["Api", "Widgets"]
      .flatMap((folder) =>
        readdirSync(join(LIBRARY_SOURCE, folder)).map((file) =>
          readFileSync(join(LIBRARY_SOURCE, folder, file), "utf8"),
        ),
      )
      .flatMap((source) => Array.from(source.matchAll(/^function Wrappers\.(\w+)\(/gmu), (match) => match[1] ?? ""))
      .filter((name) => !/(?:Into|Async)$/u.test(name));
    expect(facts.wrapped).toBe(plain.length + facts.overrides.callbacks);
    expect(facts.reviewed).toBe(facts.overrides.results + facts.overrides.loads + facts.overrides.callbacks);
  });
});
