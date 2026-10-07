---
name: epic
description: Shape an epic with the product owner: problem, outcome, success measures and the capabilities that become specs.
disable-model-invocation: true
---

Follow `../setup/version-check.md` first.

The user is speaking as product owner. Keep to the problem and outcome; solutions belong to specs.

## 1. Grill
Use the `grilling` skill on the owner's request. Categories to settle: problem (who, today, why it
falls short), outcome in the user's words, users, success measures (observable, countable), the
capabilities in scope with priority (Must / Should / Could), out of scope, assumptions and risks,
and a walkthrough a non-engineer could run to accept the epic.

## 2. Write
`docs/epics/NNNN-kebab-name.md` from `epic-template.md` beside this file, NNNN = next free number,
Status: draft. Each capability is sized to become one spec of about 25 AC or fewer; split any that
would not be.

## 3. Gate
Done when the owner sets Status: approved. Then, per docs/context/tracker.md, the Epic issue is
created (or listed for the owner to create) and its key written on the `Jira:` line.
