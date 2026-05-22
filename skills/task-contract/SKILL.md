---
name: task-contract
description: Use when the user gives an ambiguous coding, product, writing, cleanup, optimization, refactor, debugging, or implementation request such as "optimize this", "make it better", "fix it", "clean this up", "you decide", "帮我搞一下", "优化一下", "整理一下", "改一改", or when scope, acceptance criteria, risk boundaries, or execution mode are unclear. Forces the agent to clarify goal, scope, forbidden areas, validation, and delivery report before editing files.
metadata:
  short-description: Turn vague requests into executable task contracts before acting
---

# task-contract

Use this skill before acting on ambiguous requests. The priority is: clarify first, then implement. Do not trade correctness and scope control for speed.

## Trigger

Run this flow if any of these are true:

- The user uses vague action words: optimize, improve, clean up, refactor, fix, make better, handle it, you decide, 看看, 优化一下, 整理一下, 改一改, 搞定.
- The task likely touches more than one file or module.
- The task involves production config, auth, permissions, payment, billing, data migration, external APIs, secrets, dependency upgrades, or generated/deleted files.
- The user has not stated goal, scope, forbidden areas, validation, or whether you should act immediately.

Skip only for pure explanation/query tasks, or when the user explicitly gives a small, clear, single-file task with acceptance criteria.

## Flow

1. Restate the goal in one sentence.
2. Identify missing information: goal, scope, forbidden areas, validation, risks.
3. If enough can be inferred, draft a proposed task contract.
4. Mark what still needs confirmation.
5. Before confirmation, do not edit files, create files, delete files, or run state-changing commands.
6. After implementation, deliver a report: files changed, commands run, results, not done, remaining risks.

## Output

Use this structure:

```markdown
## 我理解的目标

一句话说明目标。

## 背景与假设

- 我假设：...
- 我没找到关于 X 的明确说明，暂时按 Y 处理，请确认。
- 我注意到 Z 可能和目标冲突，请确认。

## 建议范围

可以改：
- ...

不要改：
- ...

不在本次范围内：
- ...

## 执行顺序

1. 先只读分析，输出方案。
2. 你确认方案。
3. 我动手改。
4. 跑验证。
5. 给交付报告。

## 验收标准

- 命令必须通过：
- 页面或行为必须正确：
- 不允许回归的功能：
- 最终汇报必须包含：

## 需要你确认

1. ...
2. ...
```

## Hard Rules

- Do not start editing before restating the goal.
- Do not assume default business behavior without confirmation.
- Do not exceed the confirmed scope.
- Do not decide business rules alone.
- Put tempting extra fixes into "extension suggestions" instead of doing them.
- If the request conflicts with existing code or project instructions, report the conflict first.
- If the user confirms the contract, implement with normal autonomy and verify before final response.

## Examples

For common vague prompts and better task-contract rewrites, read `references/examples.md` only when you need examples.
