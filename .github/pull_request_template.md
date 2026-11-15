## What and why

<!-- One concern per pull request. Title: type(scope): summary. -->

## Checklist

- [ ] `mise exec -- moon run :check` passes locally
- [ ] `src/Api`, `src/Widgets`, `dist/ForeverMyth.lua` and `.github/banner.svg` were regenerated (`moon run generator:generate lib:build`, `lune run scripts/banner`), not edited by hand
- [ ] A new or changed override in `overrides/` says `why`, and `tests/spec/Overrides.spec.luau` covers it (the runner enforces it)
- [ ] `CHANGELOG.md` has a line under "Unreleased" if users will notice the change
