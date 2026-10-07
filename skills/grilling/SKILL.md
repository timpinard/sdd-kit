---
name: grilling
description: Interview the user relentlessly about a plan, request or design until every decision is settled. Use inside the epic, spec, plan and setup stages, or when the user asks to be grilled.
---

Interview the user until you reach a shared understanding. Map the work as a **design tree**: every decision branches into the decisions that hang off it.

Work the tree in **rounds**. The **frontier** is every decision whose prerequisites are settled: the questions you can ask now without guessing at answers you have not heard. Ask the whole frontier in one round, numbered, each with your recommended answer, worded so "yes" accepts it:

```
Q1 - <title>: <question, with the options when there are several>
Recommended: <answer>

Q2 - ...
```

Then wait. Each answer reshapes the tree: recompute the frontier and ask the next round. A question that depends on another question still open this round belongs to a later round.

Facts are your job; decisions are the user's. When a question needs a fact from the code, the docs or the environment, look it up (dispatch a subagent for anything broad) rather than asking. Only the questions downstream of a running lookup wait for it.

When a calling skill names the categories it must cover, the session is not done until each category is settled or explicitly marked out of scope by the user.

Done when the frontier is empty and the user confirms the shared understanding. Then summarise every decision in one numbered list, which the calling skill writes down.
