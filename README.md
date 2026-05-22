# ContextCraft Skills

[简体中文](README.zh-CN.md)

Reusable collaboration skills for Codex, Claude Code, and adjacent coding agents.

ContextCraft Skills is not a prompt pack for making AI "write smarter code." It is a small workflow toolkit for making AI collaboration behave more like a reliable engineering process:

- Turn vague requests into executable task contracts before work begins.
- Create short, true, actionable `AGENTS.md` / `CLAUDE.md` files at the start of a project.
- Feed lessons from completed tasks back into project instructions, workflow files, or PR delivery standards.

## Who This Is For

Use this project if:

- You regularly ask Codex, Claude Code, or another coding agent to work in real repositories.
- Your agents tend to start editing too early when the task is vague.
- You want project instructions, task contracts, PR delivery, and retrospectives to become repeatable workflows.

This may not be for you if:

- You only want a prompt collection.
- You want the agent to always edit immediately without clarifying task boundaries.
- Your local agent setup does not load skills from a skills directory.

## Skills

| Skill | Purpose |
| --- | --- |
| `task-contract` | For vague requests like "make this better", "clean this up", "you decide", "优化一下", or "改一改"; clarifies goal, scope, validation, and execution mode before editing. |
| `repo-agent-map` | Audits or drafts `AGENTS.md`, `CLAUDE.md`, and Cursor rules from real repository evidence. |
| `collaboration-loop` | Connects task intake, repo instructions, workflow files, PR delivery, and retrospective learning into a closed loop. |

## Quick Start

After cloning the repository, validate the structure first:

```bash
./bin/validate
```

List available skills:

```bash
./bin/install-local list
```

On macOS or Linux:

Install to Codex:

```bash
./bin/install-local codex
```

Install to Claude:

```bash
./bin/install-local claude
```

Install to both:

```bash
./bin/install-local all
```

Install one skill:

```bash
./bin/install-local codex --skill task-contract
```

Install into the current repository instead of your user home:

```bash
./bin/install-local claude --scope project --skill repo-agent-map
```

On Windows PowerShell:

Install to Codex:

```powershell
.\bin\install-local.ps1 codex
```

Install to Claude:

```powershell
.\bin\install-local.ps1 claude
```

Install to both:

```powershell
.\bin\install-local.ps1 all
```

Install one skill:

```powershell
.\bin\install-local.ps1 codex -SkillName task-contract
```

The installer copies every `skills/*` directory that contains a `SKILL.md` file into the target skills directory. Reinstalling removes the target skill directory first, so stale files do not linger.

Default target directories:

| Target | Directory |
| --- | --- |
| Codex on macOS/Linux | `${CODEX_HOME:-$HOME/.codex}/skills` |
| Claude on macOS/Linux | `${CLAUDE_HOME:-$HOME/.claude}/skills` |
| Codex on Windows | `%CODEX_HOME%\skills` or `%USERPROFILE%\.codex\skills` |
| Claude on Windows | `%CLAUDE_HOME%\skills` or `%USERPROFILE%\.claude\skills` |

The machine-readable catalog lives in [`skills.json`](skills.json). It is intentionally small so future installers, registries, and plugin manifests can discover the same skill list without scraping the README.

## How To Use

After installation, start a new Codex or Claude Code session so the agent can discover the installed skills. Then work in any repository as usual. You do not import anything in your codebase; you ask the agent for a workflow and the matching skill guides the conversation.

You can use the skills in two ways:

- **Natural language**: describe the task and let the agent choose the matching skill.
- **Explicit mention**: name the skill when you want a specific workflow, for example "use `task-contract` first".

### 1. Turn a vague request into a task contract

```text
This product listing page feels slow. Do not edit code yet. First turn the goal, scope, and validation criteria into a task contract.
```

Expected result: the agent should use `task-contract` to restate the goal, identify missing scope, propose allowed/forbidden areas, and define validation before editing files.

### 2. Audit or create repository instructions

```text
Audit this repository's AGENTS.md. Check for invented commands, stale paths, and generic rules that do not change agent behavior.
```

Expected result: the agent should use `repo-agent-map` to inspect the real repository, cite evidence, remove generic instructions, and keep only rules that change agent behavior.

You can also ask:

```text
Use repo-agent-map to draft an AGENTS.md for this repository. First do a read-only audit and do not write files yet.
```

### 3. Design a closed AI collaboration loop

```text
Our team keeps losing context between PR delivery and retrospectives. Design an AI collaboration loop for us.
```

Expected result: the agent should use `collaboration-loop` to connect task intake, repo instructions, delivery reports, and retrospectives into a repeatable workflow.

### Check That It Works

If the skill is active, the agent's response should follow the workflow shape from the relevant `SKILL.md`. For example:

- `task-contract` should ask for goal, scope, forbidden areas, validation, and delivery expectations before editing.
- `repo-agent-map` should do a read-only repository audit before drafting instructions.
- `collaboration-loop` should separate intake, process, exit, and learning steps.

If nothing changes, restart the agent session and confirm the skill folder exists in the target skills directory.

`task-contract` is intentionally conservative. When the goal, scope, forbidden areas, validation, or execution mode is unclear, it asks for a task contract before editing. Small, explicit, single-file tasks do not need it.

## Contributing Skills

Each skill lives in its own directory:

```text
skills/<name>/SKILL.md
skills/<name>/references/
```

Rules:

- `SKILL.md` must include frontmatter with `name` and `description`.
- `description` should include real phrases users would say, so agents can trigger the skill correctly.
- Keep `SKILL.md` concise and action-oriented.
- Put long examples, prompt libraries, and extended material under `references/`.
- Do not commit secrets, tokens, private project details, or machine-specific credentials.

Before submitting changes, run:

```bash
./bin/validate
```

Validation also runs in GitHub Actions on Ubuntu and Windows. The Windows job smoke-tests the PowerShell installer with temporary `CODEX_HOME` and `CLAUDE_HOME` directories.
