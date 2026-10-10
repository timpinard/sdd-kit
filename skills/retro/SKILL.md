---
name: retro
description: Run a retrospective - turn docs/kit-feedback.md and the metrics into decisions, and kit changes into a new sdd-kit release.
disable-model-invocation: true
---

Input: a milestone ("Spec 0001 done") in a project using sdd-kit.

## 1. Gather
docs/kit-feedback.md rows without a retro decision, metrics/log.csv since the last retro, review
records with waived findings, docs/follow-ups.md, and sessions the owner points to. QA traces each escaped bug to the
AC that should have caught it. Compute the measures in
`metrics.md` beside this file.

## 2. Look for more
Beyond the logged rows, look for: mistakes an automated check could have caught (prefer building the
check to writing a rule), instructions agents ignored or did not need, information an agent lacked,
and steps that took far longer than they should.

## 3. Decide
Use the `grilling` skill, one question per item, with a recommendation: **kit change**, **project
only**, or **drop**.

## 4. Write
docs/retro/YYYY-MM-DD-<milestone>.md from `retro-template.md` beside this file, and the decision
column of each kit-feedback row. Project-only changes are made in the project now. Kit changes are
listed as CHANGELOG entries (recommended or optional, each with migration notes) for the sdd-kit
repository.

Done when every row has a decision, the retro record is committed, and the kit changes are either
applied in the sdd-kit repository as a new version or handed to its owner.
