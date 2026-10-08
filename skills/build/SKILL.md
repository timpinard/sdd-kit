---
name: build
description: Build one planned task end to end - implementer agent, gates, two-axis review, owner's merge gate, metrics.
disable-model-invocation: true
---

Follow `../setup/version-check.md` first.

Input: a task ("Task 0001-T2"). Talk to agents through pointers (spec, plan, tasks doc, review
record, diff command), never by pasting their contents.

The integration branch is the one named in AGENTS.md (`Integration branch:`, default `main`). With
`spec`, it is `spec/NNNN-name`, created from main at the spec's first task.

At every owner gate, note when you present it to the owner and when the owner answers. The time
between is owner wait, recorded in the metrics row.

## 1. Ready
Confirm every blocker in the task row is merged to the integration branch and the tree is clean.
Create branch `task/NNNN-Tn-short-name` from the integration branch. When another task's build is
in progress in the same checkout, cut the branch in a git worktree beside the repo instead
(`git worktree add -b <branch> ../<repo>-Tn <integration branch>`) and point the agents at it.
Start the review record docs/reviews/NNNN-Tn.md from `review-template.md` beside this file. Note
the start time.

## 2. Implement
Dispatch the `implementer` agent with the task id, branch (and worktree path, if any) and review
record path. When it reports, note the token count in its completion notice and run the task's
gate command yourself; a red gate goes back to the implementer with the output. Write the green
output into the review record's Gates section before step 3.

## 3. Review
Dispatch `spec-reviewer` and `standards-reviewer` in parallel, each with the diff command
`git diff <integration branch>...HEAD`, the task id and the spec id. Note the token count in each
completion notice. Put their reports, unmerged and unreranked, under the review record's two
headings.

## 4. Owner gate
Show the owner the gate output and both reviews. The owner decides: merge, rework, or waive a
finding with a reason.
- Rework: send the findings to the implementer, add 1 to Regenerations, back to step 2.
- Merge: commit the review record on the branch, merge into the integration branch with `--no-ff`,
  set the task row's Status to done, append the metrics row (columns in `../retro/metrics.md`,
  including agent_tokens and owner_wait_hours). Remove the task's worktree, if any.

Done when the branch is merged and the metrics row and task status are committed.

## 5. Last task of a spec
Run `scripts/gates.sh <spec>` with no AC list. When green, set the spec's Status: implemented and
offer QA a `qa-agent` pass, steered to the areas QA names. QA classes each finding: a bug against
the spec becomes a Bug and a fix task; a gap in the spec becomes a proposed amendment for the
spec's owners, following the spec skill's Amendments rule. Neither becomes a silent fix. QA then
runs the epic's acceptance walkthrough with the product owner once the epic's Must specs are
implemented.

When the integration branch is not main, the task ends with an owner gate after the full gates
pass: on the owner's yes, merge the integration branch to main with `--no-ff`.

Definition of done: `definition-of-done.md` beside this file.
