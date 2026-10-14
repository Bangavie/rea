@AGENTS.md

## Claude Code

`AGENTS.md` (imported above) is the single source of repository guidance; update it there rather than duplicating rules here.

- Cloud sessions run `.claude/hooks/session-start.sh`, which installs locked dependencies with `npm ci`. Local sessions use your own pinned toolchain from `.nvmrc`.
- Day-to-day loop: `npm run test:local -- PATH...` for the tests you touched, then `npm run check:fast` (typecheck and lint, also run by the pre-push hook). Run `npm run format` before committing; lint-staged runs on commit.
- Repository skills live in `.agents/skills/` (`rea-tool-design`, `rea-ci-tests-audit`, `rea-changelog-update`, `reverse-engineer-anything`). Read the matching `SKILL.md` when a task fits one.
- Real-provider checks (`npm run verify:*`) need Ghidra, IDA, Hopper, Frida and similar tools that cloud sessions do not have. Report them as unverified instead of simulating them.
- Submodules under `third_party/` are not initialized by default; initialize only the one a task needs.
