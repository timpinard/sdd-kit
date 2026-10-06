# SDD Kit (stub)

Flow: intent -> spec -> plan -> tasks -> implement -> gates -> review -> merge -> metrics

| Stage     | Artifact                       | Owner (human gate)  | Agent             |
|-----------|--------------------------------|---------------------|-------------------|
| Intent    | docs/specs/NNNN-name.md        | Product + Eng       | ticket-agent      |
| Plan      | docs/plans/NNNN-name.md        | Eng (approves)      | planner           |
| Tasks     | docs/tasks/NNNN-name.md        | Eng (skims)         | planner           |
| Implement | PR                             | -                   | implementer       |
| Gates     | scripts/gates.sh               | -                   | implementer + CI  |
| Review    | PR review                      | Eng (final merge)   | reviewer          |
| Verify    | acceptance tests               | -                   | qa-agent          |
| Measure   | metrics/log.csv                | Eng lead            | -                 |

Human gates: approve spec, approve plan, merge. Everything else is agent-run.
