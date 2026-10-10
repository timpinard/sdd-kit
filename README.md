# sdd-kit

A Claude Code plugin for spec-driven development: the owner settles decisions in grilling sessions,
specs are written from them, work is planned in vertical slices and built test-first by agents,
and nothing merges without the owner.

Status: experimental. Version 0.x, proven on one pilot project so far (one spec of 34 acceptance
criteria, 10 tasks, one QA pass, two retros). Expect the process to change between minor versions;
the CHANGELOG says what changed and how to migrate.

```
setup -> epic -> spec -> plan -> build (per task) -> retro
          PO      grill    vertical slices   implementer -> gates -> spec-reviewer + standards-reviewer -> merge gate
```

| Stage | Started with | Artifact | Human gate |
|-------|--------------|----------|------------|
| Setup | `/sdd-kit:setup` | AGENTS.md, docs/context/, ADRs, gates.sh, `.sdd-kit` | accept ADRs |
| Epic | `/sdd-kit:epic` | docs/epics/NNNN | approve epic |
| Spec | `/sdd-kit:spec` | docs/specs/NNNN | approve spec; QA signs off the AC |
| Plan | `/sdd-kit:plan` | docs/plans/NNNN, docs/tasks/NNNN | approve plan |
| Build | `/sdd-kit:build Task NNNN-Tn` | branch, docs/reviews/NNNN-Tn, metrics row, docs/follow-ups.md | merge; QA decides QA findings |
| Retro | `/sdd-kit:retro` | docs/retro/, a new kit version | decide each item |

The human side of the process (roles including QA, gates, artifacts, the data flow, the per-task
decision tree, and what is created in Jira) is in docs/operating-model.html. Open it in a browser;
the Mermaid diagrams render only where Mermaid is available (the published artifact view).

## Skills and agents
Skills run in the owner's session, so they can ask questions and wait: every stage that needs a
human is a skill. Agents run in their own context and report back: work that needs no human
(implementing, reviewing, adversarial QA) is an agent, dispatched by a skill.

- Stage skills (owner-started): setup, epic, spec, plan, build, retro
- Shared skills (used by stages, or by the model when the task fits): grilling, tdd, domain-docs
- Agents: implementer, spec-reviewer, standards-reviewer, qa-agent

## Terms
- Test boundary: the public boundary a test drives the system through and observes results at,
  e.g. a core function, the store, the tool layer over an in-process client.
- Vertical slice: a task that cuts thinly through every layer it needs to deliver one behavior a
  user can see, as opposed to a layer-only task.
- Integration branch: the branch task branches are cut from and merged into. It is `main` by
  default; it may be a long-lived branch such as `develop`, or a per-spec branch `spec/NNNN-name`.
- Escape: a bug found after its task merged, traced by QA to the AC that should have caught it.

## Install
```
claude plugin marketplace add timpinard/sdd-kit
claude plugin install sdd-kit@sdd-kit --scope project
```
Then `/sdd-kit:setup` in the project. Restart the session after installing or updating.
Setup records the marketplace in the project's `.claude/settings.json` so other machines resolve it.
Releases are tagged `sdd-kit--vX.Y.Z`.

A local directory marketplace (`claude plugin marketplace add <path to sdd-kit>`) is read live:
uncommitted kit edits reach every project that uses it. Use it only while developing the kit.

## Versions and change
The plugin is the reference implementation of the process. A project records the version it
adopted in `.sdd-kit`; updates reach it only through `claude plugin update`, and each stage skill
checks the version first and offers the CHANGELOG entries since (adopt or defer). Problems found
while working go in the project's docs/kit-feedback.md; `/sdd-kit:retro` turns them into a release.

Adapted material: see THIRD_PARTY_NOTICES.md.
