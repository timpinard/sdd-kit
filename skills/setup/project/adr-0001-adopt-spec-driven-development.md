# ADR 0001: Adopt spec-driven development with agents
- Status: proposed
- Date:
- Deciders:

## Context
<why: throughput, consistency, review load>
## Decision
Specs are the source of truth, using the sdd-kit plugin. Skills run the stages that need a human
(epic, spec, plan, setup, retro); agents run the stages that do not (implement, review, QA).
Humans accept ADRs and approve epics, specs, plans and merges.
## Consequences
- Spec quality becomes the bottleneck.
- Fix specs, then regenerate. No hand-patching without updating the spec.
## Alternatives considered
- Prompt-only agent use
- Status quo
