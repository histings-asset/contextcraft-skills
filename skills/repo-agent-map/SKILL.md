---
name: repo-agent-map
description: Use when asked to create, improve, audit, or reconcile AGENTS.md, CLAUDE.md, Cursor rules, repo instructions, project context files, coding-agent onboarding docs, or AI collaboration instructions for a repository. Helps build short, true, executable repo maps based on real evidence rather than generic best practices.
metadata:
  short-description: Create evidence-based AGENTS.md and agent repo instructions
---

# repo-agent-map

Use this skill to create or audit repository-level agent instructions. The goal is a short, true, executable map that changes agent behavior.

## Principle

An agent map is not a README. README explains the project to humans. `AGENTS.md` / `CLAUDE.md` tells an agent how to work safely in this repo.

Good agent maps are:

- Short: preferably under 200 lines.
- True: every command, path, and rule comes from current repo evidence.
- Executable: rules can be followed, tested, or cited in review.
- Layered: facts stay in repo instructions; reusable procedures become skills/prompts/rules.

## Workflow

1. **Read-only audit first.** Inspect README, package files, lockfiles, Makefile, CI, docs, existing instructions, and repo tree. Do not write yet.
2. **Extract evidence.** List commands, entrypoints, directories, risky areas, generated files, deprecated paths, test/build/lint flows, and missing facts. Cite source files.
3. **Draft short instructions.** Keep only rules that change agent behavior. Do not copy README prose.
4. **Reverse-audit the draft.** For each rule ask:
   - Is there real evidence?
   - Will it change agent behavior?
   - Is it stale, duplicate, or generic?
   - Should it live in README, CI, a workflow skill, or current task notes instead?
5. **Install for tools.**
   - Codex: root `AGENTS.md`.
   - Claude Code: root `CLAUDE.md` that imports or mirrors `AGENTS.md`.
   - Cursor: `.cursor/rules/*.mdc` with targeted descriptions/globs.

## Suggested AGENTS.md Shape

```markdown
# Project agent instructions

## Commands
- Dev:
- Test:
- Build:
- Typecheck/lint:

## Project Map
- ...

## Boundaries
- ...

## Completion Standard
- State files changed.
- State commands run and results.
- If tests were not run, explain why and remaining risk.
- Do not mix unrelated refactors into scoped tasks.
```

## Anti-patterns

- "Write high quality code."
- "Follow best practices."
- Commands that were guessed instead of verified.
- Long architecture essays that do not affect behavior.
- Embedding deployment procedures that should be a separate skill/checklist.
- Stale commands copied from old README sections.

## Prompts

For ready-to-send audit prompts, read `references/prompts.md`.
