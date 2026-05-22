# task-contract examples

## Bad

```text
商品列表页有点慢，你优化一下。
```

Problem: no target metric, no scope, no forbidden areas, no validation.

## Good

```text
目标：降低商品列表页首屏请求量，不改变商品详情页和下单流程。

请先只读分析：
1. 找到商品列表页入口文件。
2. 找到它请求商品数据的方式。
3. 判断是否为了统计信息额外请求了过多商品。
4. 给出最小修改方案，等我确认后再改。

允许改：
- 商品列表页组件和它直接调用的数据封装。
- 必要的统计接口。

禁止改：
- 商品详情页渲染逻辑。
- 加购物车、下单、支付链路。
- 用户登录和权限校验。

验收：
- 列表页分类筛选仍正确。
- 商品总数显示一致。
- 商品详情页打开行为不变。
- 最终汇报：首屏请求数量变化、改了哪些文件、用了什么命令验证。
```

## Four Failure Types

| Failure | Bad prompt | Fix |
| --- | --- | --- |
| Goal unclear | "make this better" | State target metric and reason. |
| Scope unclear | "refactor this" | State allowed and forbidden modules. |
| Done unclear | "fix this bug" | State behavior, command, and non-regression checks. |
| Execution unclear | "you decide" | State whether to analyze first, ask first, or implement directly. |
