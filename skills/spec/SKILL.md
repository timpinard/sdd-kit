---
name: spec
description: Turn one epic capability (or a request) into a testable spec through a grilling session, then write it.
disable-model-invocation: true
---

Follow `../setup/version-check.md` first.

Input: an epic and capability ("Epic 0001, capability 2"), or a request. Output: one spec per
capability, docs/specs/NNNN-kebab-name.md from `spec-template.md` beside this file.

## 1. Explore
Read docs/context/, every ADR, the epic, related specs, and any source material the request points
at. Source material describes behavior to keep, not structure to copy.

## 2. Grill
Use the `grilling` skill, with `domain-docs` for every new or disputed term and every decision
that needs an ADR. The product owner, the engineer and QA take part; QA raises boundaries, bad
input, failure modes and exact error behavior so they become AC rather than later bugs.
Categories to settle: each behavior and its inputs and outputs, defaults and
limits, error behavior and messages, numbers (precision, rounding, units), edge cases, what is kept,
dropped or fixed from source behavior, and non-goals.

## 3. Write
Synthesize the settled decisions; ask nothing new while writing.
- Behavior, not implementation. Each requirement has 1+ AC with Given / When / Then concrete enough
  to test: inputs, observable outputs, exact errors.
- AC ids appear in the AC table and the Open questions table, nowhere else (the coverage gate counts
  every AC id in the file).
- Hand-check every worked number with a calculation you show (Bash or Python), and state which
  values are rounded. A number you cannot check goes to Open questions.
- About 25 AC at most; split larger capabilities into several specs in dependency order.

## 4. Gate
Done when Open questions is empty, QA has signed off that every AC is testable as written
(concrete inputs, observable outputs, exact errors, hand-checked numbers), and the product owner
and engineer set Status: approved. `Approved by:` names all three with the date. Then, per
docs/context/tracker.md, the Story is created or listed for the owner.
