## What and why

<!-- One concern per pull request. Title: type(scope): summary. -->

## Checklist

- [ ] `sgt check` passes locally
- [ ] `src/Api`, `src/Widgets`, `dist/ForeverMyth.lua` and `.github/banner.svg` were regenerated (`sgt run generate, sgt run bundle`, `sgt run banner`), not edited by hand
- [ ] A new or changed override in the generator's `src/overrides/` says `why`, and `tests/spec/Overrides.spec.luau` covers it (the runner enforces it)
- [ ] `CHANGELOG.md` has a line under "Unreleased" if users will notice the change
