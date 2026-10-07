# Gates (cheapest first; scripts/gates.sh in the project)
0. References: every ADR/Epic/Spec/Plan id and docs/ path mentioned resolves
1. Format + lint
2. Type check
3. Unit tests (no tests at a level yet is a printed skip, not a failure)
4. Integration tests
5. AC coverage: `gates.sh <spec> AC3 AC4` checks the task's AC; `gates.sh <spec>` checks all
6. Two-axis review (agents spec-reviewer and standards-reviewer)
CI repeats 0-5. A failing gate blocks merge.
