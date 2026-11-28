import { base, compose } from "@sgt-build/oxlint-config";
import { react } from "@sgt-build/oxlint-config-react";
import { defineConfig } from "oxlint";

export default defineConfig(compose(base, react));
