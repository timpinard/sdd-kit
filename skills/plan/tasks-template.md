# Tasks NNNN: <capability>
- Plan: Plan NNNN
Each task is a **vertical slice**: a task that cuts thinly through every layer it needs to deliver
one behavior a user can see, as opposed to a layer-only task. Demoable or verifiable on its own, one
agent session, one reviewable branch.

| ID | Vertical slice (what works afterwards, in user terms) | Covers AC | Blocked by | Gate command | Jira | Status |
|----|--------------------------------------------------------|-----------|------------|--------------|------|--------|
| T1 | | AC1 | - | `scripts/gates.sh docs/specs/NNNN-x.md AC1` | | todo |

## Task notes (per task: test boundaries, interfaces it creates or changes, decisions already taken)

## Per-task Definition of Done
- [ ] Gate command green, output in the review record
- [ ] Every covered AC has a passing test at its test boundary, seen red (written red first, or
  broken on purpose and recorded)
- [ ] Spec-review and standards-review findings resolved or waived by the owner
- [ ] No spec or ADR drift
