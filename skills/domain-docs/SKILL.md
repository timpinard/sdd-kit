---
name: domain-docs
description: Keep the glossary and ADRs current as decisions are made. Use when a term is coined or challenged, a decision with lasting consequences is taken, or an ADR is written, accepted or superseded.
---

## Glossary (docs/context/glossary.md)
- When the conversation uses a term the glossary lacks, or uses a glossary term in a different sense, stop and settle it with the user, then write the row: term, definition, "do not confuse with".
- One meaning per term. Code, specs and tests use glossary terms verbatim.

## ADRs (docs/adr/NNNN-kebab-title.md, from adr-template.md in this folder)
- Write one when a decision is hard to reverse, constrains later work, or picks between real alternatives. Stack choices and every new runtime or dev dependency qualify.
- New ADRs are `proposed`. Accepting one is a human gate: only the user sets `accepted`.
- Accepted ADRs are never edited except the status line. A changed decision is a new ADR; the old one becomes `superseded by NNNN`, or `accepted; <part> superseded by NNNN` when only part changes.

## References
- Living docs (context, epics, specs, plans, tasks, reviews) refer to each other by ID: "ADR 0004", "Spec 0002", "Plan 0001", "Task 0001-T3".
- External systems, other repositories, their paths and versions are named only inside ADRs. The product's own interface (its file paths, env vars, tool names) is not external.
- A tracker key goes on a `Jira:` (or `Tracker:`) header line.
