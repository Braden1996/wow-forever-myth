# Contributing

Follow the [Sergeant playbook](https://github.com/Braden1996/sergeant#readme) for tool setup and workspace checks.
This workspace uses Bun and Woof. Put the three @sgt-build 0.15.0 preset tarballs in the sibling
sergeant/dist/npm/ directory before running `sgt install`. Run `lune setup` once for the Lune definitions.

- Run `sgt doctor --fix`, `sgt check`, `sgt test`, and `sgt build` before opening a pull request.
- Edit semantic overrides in [the generator library](packages/libraries/luau/pure/generator/src/overrides).
  Each override needs a `why` that names the evidence and a case in
  [Overrides.spec.luau](tests/spec/Overrides.spec.luau).
- Run `sgt run generate` and `sgt run bundle` after an override or Woof dependency change.
  Commit the generated wrappers and `dist/ForeverMyth.lua`. Run `sgt run banner` if the banner counts change.
- Dependabot tracks GitHub Actions and Bun dependencies. Update mise tool pins and the Woof manifest separately.

For a release, update `version` in `woof.toml` and
[ForeverMyth.luau](packages/libraries/luau/wow/forever-myth/src/ForeverMyth.luau), add the version to
[CHANGELOG.md](CHANGELOG.md), and rebuild the committed bundle before tagging the release commit.
