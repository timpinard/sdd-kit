# Definition of Done

## Task (checked by the build skill at the merge gate)
- [ ] Gate command green; output in the review record
- [ ] Every covered AC has a passing test at its seam
- [ ] Spec review and standards review findings resolved or waived by the owner
- [ ] Owner merged the branch; metrics row written (build skill)

## Spec (checked when its last task merges)
- [ ] `scripts/gates.sh <spec>` with no AC list is green (every AC covered)
- [ ] Spec Status: implemented (build skill)
- [ ] Docs and ADRs updated where behavior or decisions changed
