---
name: build
description: Build one planned task end to end - implementer agent, gates, two-axis review, owner's merge gate, metrics.
disable-model-invocation: true
---

Follow `../setup/version-check.md` first.

Input: a task ("Task 0001-T2"). Talk to agents through pointers (spec, plan, tasks doc, review
record, diff command), never by pasting their contents.

## 1. Ready
Confirm every blocker in the task row is merged to main and the tree is clean. Create branch
`task/NNNN-Tn-short-name` from main. Start the review record docs/reviews/NNNN-Tn.md from
`review-template.md` beside this file. Note the start time.

## 2. Implement
Dispatch the `implementer` agent with the task id, branch and review record path. When it reports,
run the task's gate command yourself; a red gate goes back to the implementer with the output.

## 3. Review
Dispatch `spec-reviewer` and `standards-reviewer` in parallel, each with the diff command
`git diff main...HEAD`, the task id and the spec id. Put their reports, unmerged and unreranked,
under the review record's two headings.

## 4. Owner gate
Show the owner the gate output and both reviews. The owner decides: merge, rework, or waive a
finding with a reason.
- Rework: send the findings to the implementer, add 1 to Regenerations, back to step 2.
- Merge: commit the review record on the branch, merge to main with `--no-ff`, set the task row's
  Status to done, append the metrics row (columns in `../retro/metrics.md`).

Done when the branch is merged and the metrics row and task status are committed.

## 5. Last task of a spec
Run `scripts/gates.sh <spec>` with no AC list. When green, set the spec's Status: implemented and
offer the owner a `qa-agent` pass; its findings beyond the AC become Bugs or proposed spec
amendments, never silent fixes.

Definition of done: `definition-of-done.md` beside this file.
