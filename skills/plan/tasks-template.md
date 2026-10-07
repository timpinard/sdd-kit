# Tasks NNNN: <capability>
- Plan: Plan NNNN
Each task is a **slice**: a thin path through every layer it needs, demoable or verifiable on its
own, one agent session, one reviewable branch.

| ID | Slice (what works afterwards, in user terms) | Covers AC | Blocked by | Gate command | Jira | Status |
|----|-----------------------------------------------|-----------|------------|--------------|------|--------|
| T1 | | AC1 | - | `scripts/gates.sh docs/specs/NNNN-x.md AC1` | | todo |

## Task notes (per task: seams, interfaces it creates or changes, decisions already taken)

## Per-task Definition of Done
- [ ] Gate command green, output in the review record
- [ ] Every covered AC has a passing test at its seam, written red first
- [ ] Spec-review and standards-review findings resolved or waived by the owner
- [ ] No spec or ADR drift
