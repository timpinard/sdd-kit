# SDD Kit (stub)

Flow: intent -> spec -> plan -> tasks -> implement -> gates -> review -> merge -> metrics

| Stage     | Artifact                       | Owner (human gate)  | Agent             |
|-----------|--------------------------------|---------------------|-------------------|
| Decide    | docs/adr/NNNN-name.md          | Eng (accepts)       | -                 |
| Intent    | docs/specs/NNNN-name.md        | Product + Eng       | ticket-agent      |
| Plan      | docs/plans/NNNN-name.md        | Eng (approves)      | planner           |
| Tasks     | docs/tasks/NNNN-name.md        | Eng (skims)         | planner           |
| Implement | PR                             | -                   | implementer       |
| Gates     | scripts/gates.sh               | -                   | implementer + CI  |
| Review    | PR review                      | Eng (final merge)   | reviewer          |
| Verify    | acceptance tests               | -                   | qa-agent          |
| Measure   | metrics/log.csv                | Eng lead            | -                 |

Human gates: accept ADRs, approve spec, approve plan, merge. Everything else is agent-run.

## Adopting the kit in a new project
1. Copy a tagged release into the new repo: `git -C <kit> archive vX.Y | tar -x -C <project>`,
   then write the tag into `.sdd-kit`.
2. Symlink `CLAUDE.md -> AGENTS.md` so Claude Code reads the same rules.
3. Fill the Project paragraph and Commands in AGENTS.md.
4. Fill docs/context/ before the first spec: agents read it on every task.
5. Accept ADR 0001, then record an ADR per stack choice (language, runtime deps, storage).
   Rule: no dependency without an ADR, so the first dependencies need one too.
6. Wire `scripts/gates.sh` to real commands. A no-op gate passes everything.

## Process lifecycle
The kit is the reference implementation of the process. A project copies it once and owns its copy;
nothing flows into an active project automatically.
- During a project, problems with the process go into the project's docs/kit-feedback.md, not
  into the kit.
- At the end of a milestone, a retro (docs/retro/_template-retro.md) sorts that list into kit
  changes, project-only changes and drops. Kit changes ship as a tagged release with a
  CHANGELOG.md entry marked recommended or optional.
- When new work starts in an existing project (a new spec), `scripts/kit-drift.sh` compares the
  project's `.sdd-kit` stamp with the kit's latest tag and lists what changed. Adopt or skip each
  entry, update the stamp, commit listing what was taken. kit-manifest says which files are the
  kit's to compare; context docs and ADRs are always the project's.

## Running an agent
Agents are defined in `.claude/agents/`. Claude Code loads them at session start, so open the
session in the project root and ask for one by name ("use the ticket-agent on: <request>").
