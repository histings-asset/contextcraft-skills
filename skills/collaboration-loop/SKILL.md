---
name: collaboration-loop
description: Use when designing or improving an AI coding workflow for a person or team, especially around task intake, AGENTS.md/CLAUDE.md, reusable skills/prompts/rules, PR templates, review gates, handoff reports, retrospectives, or preventing agents from repeating past mistakes.
metadata:
  short-description: Build a closed-loop AI collaboration workflow
---

# collaboration-loop

Use this skill to turn scattered agent instructions into a repeatable collaboration system.

## Model

Reliable AI collaboration has four stages:

1. **入口**: `task-contract` catches vague requests and turns them into goal/scope/validation.
2. **过程**: repo instructions and workflow skills guide implementation.
3. **出口**: delivery report or PR template proves what changed, how it was tested, and what risk remains.
4. **沉淀**: mistakes, repeated questions, and useful procedures flow back into repo instructions, skills, or docs.

## Diagnose

Ask these questions:

- Does the agent start editing when the task is vague?
- Does the repo have current commands and boundaries in `AGENTS.md` / `CLAUDE.md`?
- Are repeated procedures stored as skills/prompts/rules instead of pasted into chat?
- Does each delivery include files changed, commands run, test results, and remaining risk?
- Do repeated mistakes get written back into durable instructions?

## Build

1. Install or invoke `task-contract` for ambiguous task intake.
2. Use `repo-agent-map` to create or audit repo-level instructions.
3. Identify 2-3 repeated procedures and turn them into separate skills/prompts/rules.
4. Add an exit checklist to PR templates or final responses:
   - goal
   - scope
   - changed files
   - commands run
   - validation result
   - remaining risks
5. Add a retro rule: every repeated mistake must become either a repo fact, a workflow step, a test, or an issue.

## Where Things Belong

| Information | Put it in |
| --- | --- |
| Commands, directories, risky modules | `AGENTS.md` / `CLAUDE.md` |
| Repeated multi-step procedures | Skill / prompt / Cursor rule |
| Current task scope | Task contract or issue |
| Verification proof | PR body or final report |
| Lessons from repeated mistakes | Repo instructions, workflow skill, tests, or docs |

## Success Signals

- A new teammate can work with the repo using the instructions without private explanations.
- The same agent mistake does not happen a third time.
- `AGENTS.md` stays short because procedures are split into skills.
- PR review is easier because the report has goal, scope, validation, and risk.
