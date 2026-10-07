# Conventions
## Code style
## Naming
Domain terms come from docs/context/glossary.md, verbatim.
## Error handling
## Numbers and precision
<money type, rounding mode, where rounding happens, tolerances in tests>
## Testing
- Seams: <the public boundaries tests observe through, per component>
- Unit vs integration: <what each covers; how integration tests are marked>
- Naming: `test_AC<n>_<behavior>` in `tests/test_<spec NNNN>_*.py`.
- Expected values are literals from the spec or hand-checked, never recomputed the way the code does.
## Logging and observability
## Branching and commits
- One branch per task: `task/NNNN-Tn-short-name`, merged to main at the human merge gate.
- Review record: docs/reviews/NNNN-Tn.md (stands in for the PR description when there is no remote).
