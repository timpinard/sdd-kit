# sdd-kit

A Claude Code plugin for spec-driven development: the owner settles decisions in grilling sessions,
specs are written from them, work is planned in thin slices and built test-first by agents, and
nothing merges without the owner.

```
setup -> epic -> spec -> plan -> build (per task) -> retro
          PO      grill    slices   implementer -> gates -> spec-reviewer + standards-reviewer -> merge gate
```

| Stage | Started with | Artifact | Human gate |
|-------|--------------|----------|------------|
| Setup | `/sdd-kit:setup` | AGENTS.md, docs/context/, ADRs, gates.sh, `.sdd-kit` | accept ADRs |
| Epic | `/sdd-kit:epic` | docs/epics/NNNN | approve epic |
| Spec | `/sdd-kit:spec` | docs/specs/NNNN | approve spec |
| Plan | `/sdd-kit:plan` | docs/plans/NNNN, docs/tasks/NNNN | approve plan |
| Build | `/sdd-kit:build Task NNNN-Tn` | branch, docs/reviews/NNNN-Tn, metrics row | merge |
| Retro | `/sdd-kit:retro` | docs/retro/, a new kit version | decide each item |

## Skills and agents
Skills run in the owner's session, so they can ask questions and wait: every stage that needs a
human is a skill. Agents run in their own context and report back: work that needs no human
(implementing, reviewing, adversarial QA) is an agent, dispatched by a skill.

- Stage skills (owner-started): setup, epic, spec, plan, build, retro
- Shared skills (used by stages, or by the model when the task fits): grilling, tdd, domain-docs
- Agents: implementer, spec-reviewer, standards-reviewer, qa-agent

## Install
```
claude plugin marketplace add ~/Workspace/sdd-kit
claude plugin install sdd-kit@sdd-kit --scope project
```
Then `/sdd-kit:setup` in the project. Restart the session after installing or updating.

## Versions and change
The plugin is the reference implementation of the process. A project records the version it
adopted in `.sdd-kit`; updates reach it only through `claude plugin update`, and each stage skill
checks the version first and offers the CHANGELOG entries since (adopt or defer). Problems found
while working go in the project's docs/kit-feedback.md; `/sdd-kit:retro` turns them into a release.

Adapted material: see THIRD_PARTY_NOTICES.md.
