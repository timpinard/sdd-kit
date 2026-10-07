---
name: tdd
description: Test-driven development in red-green slices at agreed seams. Use when implementing a task, fixing a bug test-first, or writing tests for acceptance criteria.
---

## Seams
A **seam** is the public boundary a test observes behavior through. The task notes name the seams for each AC (for example: the core projection function, the MCP tool through an in-process session). Test there and nowhere deeper. A seam the task notes do not name is a question for the planner, recorded in the review file, not a seam to invent.

## The loop
One slice at a time:
1. **Red**: write one test for one AC (or one behavior inside it) at its seam, named `test_AC<n>_<behavior>`. Run it and watch it fail for the reason you expect.
2. **Green**: write the least code that passes it. Run the single test file.
3. Next slice. Each test responds to what the previous cycle taught you.

Refactoring belongs to review, not to the loop.

## A good test
- Asserts behavior visible at the seam: return values, tool results, file contents, errors.
- Takes expected values from an independent source: the AC's worked numbers, a hand-checked literal. A test that recomputes the expected value the way the code does (**tautological**) passes by construction; every expected number is a literal from the spec or shown worked in a one-line comment.
- Survives a rewrite of the internals.

## Done
Every AC the task covers has a passing test at its seam, each written red first, and the task's gate command is green.
