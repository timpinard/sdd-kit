# AGENTS.md (CLAUDE.md is a symlink to this file)

## Project
<one paragraph: what this system does, who uses it>

## Process
Spec-driven, with the sdd-kit plugin (version in `.sdd-kit`). Stages: epic -> spec -> plan -> build
-> merge, each started with its skill (`/sdd-kit:epic`, `/sdd-kit:spec`, `/sdd-kit:plan`,
`/sdd-kit:build`). Human gates: accept ADRs, approve epic, approve spec, approve plan, merge.

## Read before any task
- docs/context/architecture.md, docs/context/conventions.md, docs/context/glossary.md
- docs/adr/ (accepted ADRs are binding)

## Commands
- Setup: `<cmd>`
- Gates: `scripts/gates.sh [docs/specs/NNNN-name.md [AC ids...]]`

## Rules
1. No spec, no code. Ask.
2. A spec is changed only by its owner. Code that disagrees with a spec is flagged, not reconciled.
3. "Done" means `scripts/gates.sh` green, with the output shown.
4. An ADR that blocks the approach stops the work; report it.
5. Refer to docs by ID; only ADRs name external systems (skill `domain-docs`).
6. Every runtime or dev dependency needs an ADR first.
7. Problems with the process itself go in docs/kit-feedback.md.
