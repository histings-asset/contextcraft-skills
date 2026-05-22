# Agent Collaboration Skills

一组帮助人更好使用 Codex、Claude Code 和其他 coding agent 的协作技能。

这套 skills 的目标不是教 AI “写更聪明的代码”，而是让 AI 协作更像可靠工程流程：

- 任务开始前把模糊需求变成可执行工单。
- 项目开始时生成短、真、可执行的 `AGENTS.md` / `CLAUDE.md`。
- 任务结束时把经验回流到项目说明书、流程文件或 PR 交付标准。

## Skills

| Skill | 作用 |
| --- | --- |
| `task-contract` | 遇到“优化一下”“改一改”“你看着办”等模糊需求时，先补目标、范围、验收和执行方式，再动手。 |
| `repo-agent-map` | 基于真实仓库审计并起草/反审计 `AGENTS.md`、`CLAUDE.md` 或 Cursor rules。 |
| `collaboration-loop` | 把入口工单、项目说明书、流程文件、PR 交付和经验沉淀串成闭环。 |

## Install

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

## Source

这些 skills 来自文章《AI 编程时代，程序员的新基本功是什么？》中的方法论：说明书、流程文件、任务工单、制度闭环。

本项目会把文章里的长文经验拆成可复用的 agent skills。
