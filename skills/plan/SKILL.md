---
name: plan
description: Plan an approved spec as vertical slices with blocking edges, test boundaries and per-task gate commands, agreed with the owner.
disable-model-invocation: true
---

Follow `../setup/version-check.md` first.

Input: an approved spec. Output: docs/plans/NNNN-name.md and docs/tasks/NNNN-name.md from
`plan-template.md` and `tasks-template.md` beside this file, NNNN = the spec's number.

## 1. Read
The spec, every ADR, docs/context/, the code as it is, and later specs that build on this one (plan
so they stay easy, without planning them).

## 2. Test boundaries
A **test boundary** is the public boundary a test drives the system through and observes results
at, e.g. a core function, the store, the tool layer over an in-process client. Propose the test
boundaries, each with what it catches and misses. Prefer existing ones and the highest one that
works. Agree them with the engineer before slicing; QA reviews what each test boundary misses, and
a behavior no test boundary can observe is a plan gap.

## 3. Slice
Draft **vertical slices**: a vertical slice is a task that cuts thinly through every layer it needs
to deliver one behavior a user can see, as opposed to a layer-only task. Each is verifiable on its
own, one session, under ~400 lines of non-test code. The first vertical slice carries any project
setup needed to run gates. Layer-only tasks (all the core first, then all the tools) need a stated
reason. Every AC lands in exactly one vertical slice. Each gets its blockers and its gate command
(`scripts/gates.sh <spec> <its AC ids>`); the last one runs the full `scripts/gates.sh <spec>`.

## 4. Quiz
Use the `grilling` skill on the breakdown: granularity, blocking edges, merges or splits, and every
spec gap found (with a proposed answer). Gap answers become a spec amendment the owner approves:
edit the R rows and add the `Amended:` header line. Amendments follow the spec skill's Amendments
rule.

## 5. Gate
Done when the owner sets the plan's Status: approved. Then, per docs/context/tracker.md, sub-tasks
with blocking links are created or listed for the owner.
