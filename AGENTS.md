# Agent instructions

This repo contains reusable AI collaboration skills for Codex, Claude Code, and adjacent coding agents.

## Commands

- Install to Codex: `./bin/install-local codex`
- Install to Claude: `./bin/install-local claude`
- Install to both: `./bin/install-local all`
- List skills: `./bin/install-local list`
- Install one skill: `./bin/install-local codex --skill task-contract`
- Install to project scope: `./bin/install-local claude --scope project --skill repo-agent-map`
- Windows install to Codex: `.\bin\install-local.ps1 codex`
- Windows install to Claude: `.\bin\install-local.ps1 claude`
- Windows install to both: `.\bin\install-local.ps1 all`
- Windows install one skill: `.\bin\install-local.ps1 codex -SkillName task-contract`
- Validate repo structure: `./bin/validate`
- Validate shell scripts: `bash -n bin/install-local`

## Project Map

- `skills/<name>/SKILL.md`: required skill entrypoint.
- `skills/<name>/references/`: optional details loaded only when needed.
- `skills.json`: machine-readable catalog of available skills.
- `bin/install-local`: local installer that copies all skills to Codex and/or Claude skill directories.
- `bin/install-local.ps1`: Windows PowerShell installer with the same target arguments as `bin/install-local`.
- `bin/validate`: local validator for installer syntax and skill structure.
- `.github/workflows/validate.yml`: CI validation for Bash and PowerShell installer paths.
- `README.md`: human-facing overview for the open source project.
- `README.zh-CN.md`: Simplified Chinese README linked from the English README.

## Editing Rules

- Keep each `SKILL.md` concise and action-oriented.
- Put long examples and prompt libraries under `references/`.
- Do not add extra docs inside individual skill folders unless the skill needs them.
- Prefer workflows that apply across Codex and Claude; mention tool-specific behavior only where it changes usage.
- Do not store secrets, tokens, private repo details, or machine-specific credentials.

## Completion Standard

- Run `bash -n bin/install-local` after editing installer logic.
- Run `./bin/validate` after editing skills, references, or installer logic.
- If Windows installer logic changes, syntax-check or smoke-test `bin/install-local.ps1` when PowerShell is available.
- Keep `skills.json`, README skill tables, and `skills/*/SKILL.md` aligned.
- If skill trigger wording changes, verify the `description` still names the real user phrases that should trigger it.
- Final report should state changed files, validation commands, and remaining risk.
