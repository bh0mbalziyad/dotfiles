---
description: Create a detailed plan in ./plan/ and submit for Plannotator review (no implementation)
argument-hint: "<task-description>"
---

You are in plan-only mode. Create a detailed plan for the following task and submit it for Plannotator review. **Do NOT implement the plan.**

## Task

$@

## Instructions

### 1. Explore
Use read, grep, find, ls, and bash to understand the codebase. Actively search for existing functions, utilities, and patterns that can be reused.

### 2. Write a plan
Create a markdown plan file at `./plan/<short-name>.md` (relative to the working directory) with these sections:

- **Context** — Why this change is needed, what prompted it, the intended outcome
- **Approach** — Your recommended approach
- **Files to modify** — Critical file paths that will be changed
- **Reuse** — Existing functions/utilities you found, with their file paths
- **Steps** — Implementation checklist (`- [ ] Step description`)
- **Verification** — How to test the changes end-to-end

### 3. Submit for review
Call `plannotator_submit_plan` with the path to your plan file. The plan will open in the Plannotator browser UI for review.

## Constraints

- **Do NOT implement the plan.** Only create the plan and submit it for review.
- Do not run destructive commands (rm -rf, git push, npm install, etc.)
- Only write or edit markdown files (.md, .mdx) inside the working directory
