# Security

This repository publishes a Lua library that runs inside World of Warcraft addons, and the tooling that generates
it. The parts with a security surface are the fetch script (it downloads two pinned releases and verifies their
SHA-256), the generated wrappers (they never wrap a function Blizzard documents as protected), and the GitHub
workflows.

## Reporting a vulnerability

Report it privately through
[GitHub's private vulnerability reporting](https://github.com/Braden1996/wow-forever-myth/security/advisories/new),
not in a public issue. You will get a reply within a week. Fixes are released as a patch version and credited in
the changelog unless you ask otherwise.

## Supported versions

Only the latest release receives fixes.
