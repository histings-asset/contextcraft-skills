# ContextCraft Skills

[English](README.md)

一组帮助人更好使用 Codex、Claude Code 和其他 coding agent 的协作技能。

这套 skills 的目标不是教 AI “写更聪明的代码”，而是让 AI 协作更像可靠工程流程：

- 任务开始前把模糊需求变成可执行工单。
- 项目开始时生成短、真、可执行的 `AGENTS.md` / `CLAUDE.md`。
- 任务结束时把经验回流到项目说明书、流程文件或 PR 交付标准。

## 适用人群

适合这些场景：

- 你经常让 Codex、Claude Code 或其他 coding agent 接手真实仓库。
- 你发现 agent 容易在需求模糊时直接动手，最后越改越散。
- 你想把项目说明、任务工单、PR 交付、复盘沉淀做成可重复流程。

不适合这些场景：

- 你只想要一个提示词合集。
- 你希望 agent 永远直接改，不做任务边界确认。
- 你还没有在本地启用 skills 目录加载机制。

## Skills

| Skill | 作用 |
| --- | --- |
| `task-contract` | 遇到“优化一下”“改一改”“你看着办”等模糊需求时，先补目标、范围、验收和执行方式，再动手。 |
| `repo-agent-map` | 基于真实仓库审计并起草/反审计 `AGENTS.md`、`CLAUDE.md` 或 Cursor rules。 |
| `collaboration-loop` | 把入口工单、项目说明书、流程文件、PR 交付和经验沉淀串成闭环。 |

## 快速开始

克隆仓库后，先验证结构：

```bash
./bin/validate
```

列出当前 skills：

```bash
./bin/install-local list
```

macOS 或 Linux：

安装到 Codex：

```bash
./bin/install-local codex
```

安装到 Claude：

```bash
./bin/install-local claude
```

同时安装：

```bash
./bin/install-local all
```

只安装一个 skill：

```bash
./bin/install-local codex --skill task-contract
```

安装到当前仓库，而不是用户全局目录：

```bash
./bin/install-local claude --scope project --skill repo-agent-map
```

Windows PowerShell：

安装到 Codex：

```powershell
.\bin\install-local.ps1 codex
```

安装到 Claude：

```powershell
.\bin\install-local.ps1 claude
```

同时安装：

```powershell
.\bin\install-local.ps1 all
```

只安装一个 skill：

```powershell
.\bin\install-local.ps1 codex -SkillName task-contract
```

安装脚本会把 `skills/*` 下所有包含 `SKILL.md` 的目录复制到目标 skills 目录。再次安装时会先删除目标里的同名 skill 目录，避免旧文件残留。

默认目标目录：

| Target | Directory |
| --- | --- |
| macOS/Linux Codex | `${CODEX_HOME:-$HOME/.codex}/skills` |
| macOS/Linux Claude | `${CLAUDE_HOME:-$HOME/.claude}/skills` |
| Windows Codex | `%CODEX_HOME%\skills` 或 `%USERPROFILE%\.codex\skills` |
| Windows Claude | `%CLAUDE_HOME%\skills` 或 `%USERPROFILE%\.claude\skills` |

机器可读的技能目录放在 [`skills.json`](skills.json)。它刻意保持轻量，方便未来安装器、目录站或 plugin manifest 读取同一份 skill 列表，而不是解析 README。

## 如何使用

安装后，重新开启一个 Codex 或 Claude Code 会话，让 agent 发现新安装的 skills。之后在任意仓库里正常提需求即可。你不需要在代码里 import 任何东西；你是在让 agent 进入某种工作流。

有两种用法：

- **自然语言触发**：直接描述任务，让 agent 根据 `SKILL.md` 的 `description` 自己选择 skill。
- **点名触发**：明确说使用某个 skill，比如“先用 `task-contract`”。

### 1. 把模糊需求变成任务工单

```text
这个页面有点慢，你先别改代码，帮我把目标、范围、验收标准整理成一个任务工单。
```

预期结果：agent 应该使用 `task-contract`，先复述目标、补齐缺失范围、提出允许/禁止修改区域，并定义验证方式，再进入编辑。

### 2. 审计或生成仓库说明

```text
请审计这个仓库的 AGENTS.md，看它有没有编造命令、过期路径或无效规则。
```

预期结果：agent 应该使用 `repo-agent-map`，先读取真实仓库证据，标出命令、路径和规则来源，删除泛泛而谈的说明，只保留真正改变 agent 行为的规则。

也可以这样说：

```text
用 repo-agent-map 帮我给这个仓库起草 AGENTS.md。第一轮只读审计，不要先写文件。
```

### 3. 设计 AI 协作闭环

```text
我们团队最近反复在 PR 交付和复盘上掉链子，帮我设计一套 agent 协作闭环。
```

预期结果：agent 应该使用 `collaboration-loop`，把任务入口、仓库说明、交付报告、复盘沉淀串成可重复执行的流程。

### 怎么确认生效

如果 skill 生效了，agent 的回答应该明显符合对应 `SKILL.md` 的工作流：

- `task-contract` 会在编辑前询问或整理目标、范围、禁区、验证和交付预期。
- `repo-agent-map` 会先做只读仓库审计，再起草说明。
- `collaboration-loop` 会把入口、过程、出口、沉淀分开处理。

如果没有变化，重启 agent 会话，并确认 skill 目录已经安装到目标 skills 目录。

`task-contract` 是一个偏保守的 intake skill：当目标、范围、禁区或验收不清楚时，它会要求先确认任务合同，再进入编辑。小而明确的单文件任务不需要使用它。

## 贡献新 Skill

每个 skill 放在独立目录：

```text
skills/<name>/SKILL.md
skills/<name>/references/
```

规则：

- `SKILL.md` 必须包含 frontmatter：`name` 和 `description`。
- `description` 要写真实用户会说的话，帮助 agent 正确触发。
- `SKILL.md` 保持简洁、行动导向。
- 长示例、提示词库、扩展材料放进 `references/`。
- 不要提交 secrets、tokens、私有项目细节或机器专属凭证。

提交前运行：

```bash
./bin/validate
```

GitHub Actions 也会在 Ubuntu 和 Windows 上跑验证。Windows job 会用临时 `CODEX_HOME` 和 `CLAUDE_HOME` smoke test PowerShell 安装脚本。
