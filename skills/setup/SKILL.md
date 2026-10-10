---
name: setup
description: Set up a repository for spec-driven development with sdd-kit, or migrate one from an older kit version. Run once per repo.
disable-model-invocation: true
---

Set up this repo so every later stage has what it reads. Templates for the files written here are
in `project/` beside this file.

## 1. Explore
Read what exists: AGENTS.md / CLAUDE.md, docs/, `.sdd-kit`, package or build files, test setup,
`git remote -v`, existing ADRs and glossary. A `.sdd-kit` from kit 0.1.x means migration: follow
the 0.2.0 migration notes in CHANGELOG.md (plugin root) instead of steps 2-4, with the owner
confirming each step.

## 2. Grill
Use the `grilling` skill. Categories to settle (skip any exploration already settled):
1. Project paragraph: what it does, for whom.
2. Stack, runtime dependencies and dev tools: each becomes a proposed ADR (skill `domain-docs`).
3. Data stores and runtime inputs (clock, env vars, config files).
4. Conventions: style, naming, error handling, numbers and rounding, test boundaries, logging.
5. Gate commands: lint, typecheck, unit, integration.
6. Tracker: Jira, GitHub, local files or none; key format; who moves issues.
7. Branching (including the integration branch), review record, commit identity, whether there is
   a remote.

## 3. Write
From `project/`, with the decisions filled in:
- `AGENTS.md`, and `CLAUDE.md` as a symlink to it
- `docs/context/architecture.md`, `conventions.md`, `glossary.md`, `tracker.md`
- `docs/adr/0001-adopt-spec-driven-development.md` plus one ADR per stack decision, all `proposed`
- `scripts/gates.sh` with the real commands (one per line; `tests_at_level` for test levels)
- `docs/kit-feedback.md`, `docs/follow-ups.md`, `metrics/log.csv`
- `.sdd-kit` containing this plugin's version

`Integration branch:` in AGENTS.md names the branch task branches are cut from and merged into:
`main` (the default), a long-lived branch such as `develop`, or `spec`, meaning a per-spec branch
`spec/NNNN-name` cut from main at the spec's first task. Any branch other than main is merged to main
at an owner gate when its spec is done (build skill).

Install the plugin for the project if it is not: `claude plugin install sdd-kit@sdd-kit --scope project`.
That records the plugin in `.claude/settings.json`, but not where its marketplace lives. When the
sdd-kit repository has a git remote, add it to the same file so any machine can resolve it:
`"extraKnownMarketplaces": {"sdd-kit": {"source": {"source": "git", "url": "<remote url>"}}}`, for
example `"extraKnownMarketplaces": {"sdd-kit": {"source": {"source": "git", "url": "https://github.com/timpinard/sdd-kit.git"}}}`.
Without a remote, commit no local path; add the step
`claude plugin marketplace add <path to sdd-kit>` to the Setup command in AGENTS.md instead.

## 4. Gate
Show the owner the ADRs. Done when the owner has accepted (or rejected) each ADR, `scripts/gates.sh`
runs its references stage cleanly, and the owner has approved the commit of the setup.
