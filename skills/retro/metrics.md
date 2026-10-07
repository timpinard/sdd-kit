# Metrics (metrics/log.csv; one row per task, written by the build skill at the merge gate)
| Column | Filled from |
|--------|-------------|
| first_pass | yes when merged with zero regenerations |
| regenerations | rework rounds after review |
| review_findings_agent | spec-review + standards-review findings |
| review_findings_human | findings the owner added at the merge gate |
| escaped_to_prod | later, when a bug labelled escaped traces to this task |
| cycle_time_hours | branch created to merge |

Read at each retro:
- First-pass rate = first_pass=yes / tasks. Start target: >60%.
- Rework ratio = sum(regenerations) / tasks.
- Review catch rate = agent findings / (agent + human + escaped).
- Escape rate = escaped / tasks. The real quality number.
