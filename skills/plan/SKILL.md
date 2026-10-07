---
name: plan
description: Plan an approved spec as thin vertical slices with blocking edges, seams and per-task gate commands, agreed with the owner.
disable-model-invocation: true
---

Follow `../setup/version-check.md` first.

Input: an approved spec. Output: docs/plans/NNNN-name.md and docs/tasks/NNNN-name.md from
`plan-template.md` and `tasks-template.md` beside this file, NNNN = the spec's number.

## 1. Read
The spec, every ADR, docs/context/, the code as it is, and later specs that build on this one (plan
so they stay easy, without planning them).

## 2. Seams
Propose the seams where tests observe behavior, each with what it catches and misses. Prefer
existing seams and the highest one that works. Agree them with the engineer before slicing; QA
reviews what each seam misses, and a behavior no seam can observe is a plan gap.

## 3. Slice
Draft **slices**: each a thin path through every layer it needs, verifiable on its own, one session,
under ~400 lines of non-test code. The first slice carries any project setup needed to run gates.
Layer-only tasks (all the core first, then all the tools) need a stated reason. Every AC lands in
exactly one slice. Each slice gets its blockers and its gate command
(`scripts/gates.sh <spec> <its AC ids>`); the last slice runs the full `scripts/gates.sh <spec>`.

## 4. Quiz
Use the `grilling` skill on the breakdown: granularity, blocking edges, merges or splits, and every
spec gap found (with a proposed answer). Gap answers become a spec amendment the owner approves:
edit the R rows and add the `Amended:` header line.

## 5. Gate
Done when the owner sets the plan's Status: approved. Then, per docs/context/tracker.md, sub-tasks
with blocking links are created or listed for the owner.
