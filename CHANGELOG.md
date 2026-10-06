# Changelog
Written for adopters. Each entry: what changed, why, and whether to take it
(recommended = fixes a defect in the process; optional = a new convention).

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
