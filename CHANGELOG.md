# Changelog
Written for adopters. Each entry: what changed, why, and whether to take it
(recommended = fixes a defect in the process; optional = a new convention).

## v0.4.0 - 2026-10-10
Source: whatif-mcp retro after Spec 0002 (T1-T4, QA pass).
- recommended: `implementer` and `tdd`: break code on purpose with a scratch edit restored by
  `git checkout -- <path>`, or a scratch commit; never `git stash`. The stash is shared by every
  worktree of a repo, and dropping it lost a rework in progress.
- recommended: `spec`: every comparison or equality on rounded values gets one AC whose difference
  is smaller than the displayed precision. Rounding between steps caused the worst bug in two
  specs in a row; both times every AC used whole-cent values.
- optional: `spec` step 4, Probe: before approval, the `qa-agent` in probe mode reads the spec text
  and lists behavior it does not state; the owners decide each. QA found mostly spec gaps after
  the build (15 of 18 findings over two specs).
- optional: metrics column `findings_fixed` (findings the owner sent to rework). First pass stays
  as defined; the retro reads the fix rate beside it, since every task had one rework round
  whether it fixed 9 findings or 2.
- recommended: `build` records each completion notice's token count in the review record, one
  line per run, and agent_tokens sums them; each notice is taken as the count of its run alone.
- optional: docs/follow-ups.md. `build` appends findings waived as a separate task and QA
  findings deferred; the retro reviews the list.
- recommended: `plan`: the ~400-line task size counts added lines under the source directories,
  as `git diff --numstat` gives them.

### Migration from 0.3.0
1. metrics/log.csv: append `,findings_fixed` to the header; earlier rows stay blank in that column.
2. Create docs/follow-ups.md from `skills/setup/project/follow-ups.md`, and move any open
   "separate task" findings from review records into it.
3. Write `0.4.0` to `.sdd-kit`.

## v0.3.0 - 2026-10-08
Source: whatif-mcp retro after Spec 0001 (T2-T10, QA pass).
- recommended: install from the GitHub remote (`claude plugin marketplace add timpinard/sdd-kit`).
  A local directory marketplace is read live, so uncommitted kit edits reached projects; use it
  only while developing the kit. Releases are tagged `sdd-kit--vX.Y.Z`. `setup` gives the
  `extraKnownMarketplaces` entry for the GitHub remote as its example.
- recommended: the spec template's AC table column "Test name" becomes "Test prefix", holding
  `test_ACn_`. One AC may be split across several tests; the gate checks only the prefix.
- optional: terms. "Seam" becomes "test boundary" and the planning "slice" becomes "vertical
  slice", each defined on first use; the tdd skill's red-green "slices" become "cycles". README
  gains a Terms section (test boundary, vertical slice, integration branch, escape).
- optional: integration branch. AGENTS.md names it (`- Integration branch: main` by default; or a
  long-lived branch such as `develop`; or `spec` for a per-spec branch `spec/NNNN-name`). Task
  branches are cut from it, reviewers diff against it, the merge gate merges into it. When it is
  not main, the spec's last task ends with an owner gate that merges it to main with `--no-ff`.
- optional: metrics columns `agent_tokens` (implementer and reviewer tokens, rework included) and
  `owner_wait_hours` (time waiting at owner gates). The retro reads working time (cycle time minus
  owner wait) and tokens per task. `escaped_to_prod` is clarified: a bug found after the task
  merged (QA pass or later), traced by QA.
- recommended: `tdd`: a test that passes on its first run is not yet proven. Break the code on
  purpose once, watch it fail for the expected reason, restore it, and say how in the review
  record. `spec-reviewer` checks the record says so for each test not seen red.
- recommended: spec amendments (from plan or build) have their numbers hand-checked with the
  calculation shown, as for new AC. No rule on stored data may depend on the current date: a valid
  stored model would turn invalid with time.
- recommended: `build` writes the gate output into the review record's Gates section before
  dispatching the reviewers.
- optional: `build` cuts the branch in a git worktree beside the repo when another task's build is
  in progress in the same checkout, and removes it after the merge.

### Migration from 0.2.2
1. metrics/log.csv: append `agent_tokens,owner_wait_hours` to the header; earlier rows stay blank
   in those columns.
2. Add `- Integration branch: main` (or your choice) to AGENTS.md Commands, and update the
   branching line in docs/context/conventions.md to match.
3. With the kit installed from GitHub: add `extraKnownMarketplaces` to `.claude/settings.json` (see
   the setup skill) and drop the local `marketplace add` step from AGENTS.md Setup.
4. Spec tables of approved specs may keep the "Test name" header; approved plans may keep the old
   terms.
5. Write `0.3.0` to `.sdd-kit`.

## v0.2.2 - 2026-10-07
- recommended: QA is a named human role. The spec skill brings QA into the grilling (boundaries,
  bad input, failure modes, exact errors) and requires QA's sign-off that every AC is testable
  before approval; `Approved by:` names the product owner, engineer and QA. The plan skill has QA
  review what each seam misses. The build skill offers the qa-agent pass to QA, steered to the
  areas QA names, and QA classes each finding as a bug (Bug and fix task) or a spec gap (proposed
  amendment); QA runs the epic walkthrough with the product owner. The retro skill has QA trace
  each escaped bug to the AC that should have caught it.
- optional: docs/operating-model.html, the human side of the process: roles, gates, artifacts,
  data flow, the per-task decision tree and the Jira mapping.

### Migration from 0.2.1
1. AGENTS.md, Process: replace the human gates line with the one in
   `skills/setup/project/AGENTS.md`.
2. docs/context/tracker.md: the QA finding row is confirmed by QA.
3. Specs approved from now on name QA on the `Approved by:` line.
4. Write `0.2.2` to `.sdd-kit`.

## v0.2.1 - 2026-10-07
Found while migrating whatif-mcp to 0.2.0.
- recommended: the references gate skips dated records (docs/reviews/, docs/retro/,
  docs/kit-feedback.md). It failed on a kit-feedback row naming a template the migration deleted;
  editing a record to satisfy the gate is the wrong direction.
- recommended: `domain-docs` classes reviews, retros and kit feedback as dated records, like ADRs:
  they may name versions and paths. A standards review had flagged an SDK version in a review record.
- optional: `setup` declares the sdd-kit marketplace in the project's `.claude/settings.json` when
  the kit has a git remote, and otherwise documents `claude plugin marketplace add` in AGENTS.md
  instead of committing a machine-specific path.

### Migration from 0.2.0
1. scripts/gates.sh: replace the `DOCS=(...)` line with the one in
   `skills/setup/project/gates.sh` (with its one-line comment).
2. Without a git remote for sdd-kit: add the marketplace step to AGENTS.md's Setup command. With
   one: add `extraKnownMarketplaces` to `.claude/settings.json` as the setup skill describes.
3. Write `0.2.1` to `.sdd-kit`.

## v0.2.0 - 2026-10-07
The kit becomes a Claude Code plugin. Stages that need a human run as skills inside the owner's
session; stages that do not run as agents. Sources: the whatif-mcp pilot's kit feedback (19 rows)
and a comparison with github.com/mattpocock/skills.

- recommended: stages are skills - `setup`, `epic`, `spec`, `plan`, `build`, `retro` - started by
  the owner (`/sdd-kit:spec` and so on). The ticket-agent and planner agents are gone: as subagents
  they could not ask the owner anything, so open questions came back in rounds through a relay.
- recommended: `grilling` skill (adapted, MIT): questions in rounds over the frontier of the design
  tree, each with a recommended answer; facts looked up, decisions asked. Used by every stage skill.
- recommended: specs are written after the grilling, by synthesis; hand-checked worked numbers,
  rounding stated, about 25 AC per spec.
- recommended: plans are vertical slices with blocking edges, agreed seams and a gate command per
  task; spec gaps resolved as an owner-approved amendment (`Amended:` header).
- recommended: `tdd` skill (adapted, MIT): red-green one slice at a time at agreed seams, no
  tautological tests. Replaces "write tests from the AC first", which is horizontal slicing.
- recommended: review on two axes by two read-only agents in parallel, `spec-reviewer` and
  `standards-reviewer`, reported unmerged in docs/reviews/NNNN-Tn.md.
- recommended: `build` skill runs a task end to end: branch, implementer, gates, both reviews, owner
  merge gate, metrics row, spec Status: implemented on the last task, optional qa-agent pass.
- recommended: gates.sh takes AC ids after the spec (`gates.sh <spec> AC3 AC4`) so each task checks
  its own AC; a test level with no tests is a printed skip (`tests_at_level`), not a failure; one
  command per line; references gate also resolves Epic and Plan ids.
- recommended: `epic` skill and template: the PO stage, before specs.
- optional: `domain-docs` skill: glossary and ADRs updated during grilling; reference by ID; only
  ADRs name external systems (the product's own interface is not external); `Jira:` header lines;
  partial supersession `accepted; <part> superseded by NNNN`.
- optional: docs/context/tracker.md maps artifacts and gates to tracker issues and transitions.
- optional: templates gain Approved by / Amended / Epic / Jira lines (spec), Seams, Spec gaps and
  Test layout (plan), Slice / Blocked by / Gate command columns and Task notes (tasks), and a
  "Numbers: precision and rounding" prompt (spec, conventions).
- optional: metrics row written at the merge gate, when every column is known; who fills each
  column is in the retro skill's metrics.md.
- Dropped: kit-manifest and scripts/kit-drift.sh (process files now live in the plugin; the
  version check runs at the start of each stage skill).

### Migration from 0.1.x
1. `claude plugin marketplace add <path to sdd-kit>`, then
   `claude plugin install sdd-kit@sdd-kit --scope project`.
2. Delete the copied process files: `.claude/agents/` (ticket-agent, planner, implementer,
   reviewer, qa-agent), `docs/specs/_template-spec.md`, `docs/plans/_template-plan.md`,
   `docs/tasks/_template-tasks.md`, `docs/adr/0000-template.md`, `docs/retro/_template-retro.md`,
   `docs/epics/_template-epic.md`, `docs/gates.md`, `docs/definition-of-done.md`,
   `.github/pull_request_template.md`, `metrics/README.md`, `scripts/kit-drift.sh`.
3. AGENTS.md: replace Rules and add Process from `skills/setup/project/AGENTS.md`; keep Project
   and Commands.
4. scripts/gates.sh: take the references, `tests_at_level` and AC coverage parts from
   `skills/setup/project/gates.sh`; keep the project's commands.
5. Add docs/context/tracker.md (an existing Jira mapping moves there); add "Numbers and precision"
   and the Testing seams to conventions.md.
6. Record the retro decisions on the existing docs/kit-feedback.md rows.
7. Tasks not yet started: re-plan them with `/sdd-kit:plan`. Merged tasks stand.
8. Write `0.2.0` to `.sdd-kit`.

## v0.1 - 2026-10-06
Found while starting the whatif-mcp pilot.
- recommended: AC coverage gate only checks `tests/test_NNNN_*.py` for spec NNNN and requires a
  `def test_ACn_`. AC ids restart per spec, so another spec's test could satisfy the gate.
- recommended: references gate runs first: every "ADR NNNN", "Spec NNNN" and docs/ path in the docs
  must resolve. AGENTS.md rule 7: refer by ID; only ADRs name external systems; accepted ADRs are
  superseded, never edited.
- recommended: accepting ADRs is a human gate. They were binding but nobody accepted them.
- recommended: `gates.sh` runs from the repo root regardless of the caller's directory.
- optional: ticket-agent has a defined input, output and report; may build on proposed ADRs; sizes
  specs at about 25 AC and may write several; Bash for reading and arithmetic.
- optional: spec template gains Source behavior (kept / dropped or fixed), a Level column for AC,
  and an Open questions table with proposed answers.
- optional: architecture template gains "Runtime inputs".
- optional: lifecycle: `.sdd-kit` version stamp, kit-manifest, `scripts/kit-drift.sh`,
  docs/kit-feedback.md, retro template.

## v0.0
The original stub.
