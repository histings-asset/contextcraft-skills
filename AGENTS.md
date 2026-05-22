# Agent instructions

This repo contains reusable AI collaboration skills for Codex, Claude Code, and adjacent coding agents.

## Commands

- Install to Codex: `./bin/install-local codex`
- Install to Claude: `./bin/install-local claude`
- Install to both: `./bin/install-local all`
- Validate shell scripts: `bash -n bin/install-local`

## Project Map

- `skills/<name>/SKILL.md`: required skill entrypoint.
- `skills/<name>/references/`: optional details loaded only when needed.
- `bin/install-local`: local installer that copies all skills to Codex and/or Claude skill directories.
- `README.md`: human-facing overview for the open source project.

## Editing Rules

- Keep each `SKILL.md` concise and action-oriented.
- Put long examples and prompt libraries under `references/`.
- Do not add extra docs inside individual skill folders unless the skill needs them.
- Prefer workflows that apply across Codex and Claude; mention tool-specific behavior only where it changes usage.
- Do not store secrets, tokens, private repo details, or machine-specific credentials.

## Completion Standard

- Run `bash -n bin/install-local` after editing installer logic.
- If skill trigger wording changes, verify the `description` still names the real user phrases that should trigger it.
- Final report should state changed files, validation commands, and remaining risk.
