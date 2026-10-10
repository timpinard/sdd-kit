# Metrics (metrics/log.csv; one row per task, written by the build skill at the merge gate)
| Column | Filled from |
|--------|-------------|
| first_pass | yes when merged with zero regenerations |
| regenerations | rework rounds after review |
| review_findings_agent | spec-review + standards-review findings |
| review_findings_human | findings the owner added at the merge gate |
| escaped_to_prod | later: a bug found after the task merged (QA pass or later), traced by QA to this task |
| cycle_time_hours | branch created to merge |
| agent_tokens | sum of the per-run token counts in the review record (implementer and reviewer runs, rework rounds included); each completion notice is taken as the count of that run alone |
| findings_fixed | findings the owner sent to rework, all rounds |
| owner_wait_hours | time the task waited at owner gates: from when the build skill presents a gate to the owner until the owner answers |

Read at each retro:
- First-pass rate = first_pass=yes / tasks. Start target: >60%.
- Rework ratio = sum(regenerations) / tasks.
- Review catch rate = agent findings / (agent + human + escaped).
- Escape rate = escaped / tasks. The real quality number.
- Fix rate = sum(findings_fixed) / sum(review_findings_agent + review_findings_human).
- Working time = cycle_time_hours - owner_wait_hours, per task.
- Tokens per task = sum(agent_tokens) / tasks.
