---
name: tdd
description: Test-driven development in red-green cycles at agreed test boundaries. Use when implementing a task, fixing a bug test-first, or writing tests for acceptance criteria.
---

## Test boundaries
A **test boundary** is the public boundary a test drives the system through and observes results at, e.g. a core function, the store, the tool layer over an in-process client. The task notes name the test boundaries for each AC. Test there and nowhere deeper. A test boundary the task notes do not name is a question for the planner, recorded in the review file, not one to invent.

## The loop
One cycle at a time:
1. **Red**: write one test for one AC (or one behavior inside it) at its test boundary, named `test_AC<n>_<behavior>`. Run it and watch it fail for the reason you expect.
2. **Green**: write the least code that passes it. Run the single test file.
3. Next cycle. Each test responds to what the previous cycle taught you.

A test that passes on its first run is not yet proven. Break the code on purpose once, watch the test fail for the expected reason, restore the code, and say in the review record how you broke it.

Refactoring belongs to review, not to the loop.

## A good test
- Asserts behavior visible at the test boundary: return values, tool results, file contents, errors.
- Takes expected values from an independent source: the AC's worked numbers, a hand-checked literal. A test that recomputes the expected value the way the code does (**tautological**) passes by construction; every expected number is a literal from the spec or shown worked in a one-line comment.
- Survives a rewrite of the internals.

## Done
Every AC the task covers has a passing test at its test boundary, each seen red (written red first, or broken on purpose and recorded), and the task's gate command is green.
