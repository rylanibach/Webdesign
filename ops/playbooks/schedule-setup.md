# Schedule Setup — Recurring Agent Tasks

The agency runs on a **single consolidated daily trigger** (Anthropic plan limit: 1 daily cloud scheduled session). One remote session plays all five teammates in sequence and conditionally runs the Monday pipeline review and Friday weekly review.

## The Trigger

| Field | Value |
|---|---|
| Name | `Web Agency — Daily all-hands` |
| ID | `trig_01HLqma384JrYZUr4nkdi3Lb` |
| Cron | `0 16 * * *` UTC = **daily 9:00 AM PT** |
| Repo | `https://github.com/rylanibach/Webdesign` (cloned each run) |
| Model | `claude-sonnet-4-6` |
| MCP | Gmail (for draft email digest) |
| Manage | https://claude.ai/code/scheduled/trig_01HLqma384JrYZUr4nkdi3Lb |

## What it does (in order)

1. **Kyle — Morning Orchestration** — reads `ops/approvals/queue.md`, reviews active clients, appends today's standup to `ops/daily-standup.md`, dispatches work to the team.
2. **Stevie — Design** — advances design work in `clients/<client>/design/`, queues new Gate 3a/3b items.
3. **Matt — Dev** — advances builds in `clients/<client>/dev/`, notes pre-launch-ready deploys.
4. **Emily — Growth** — lead discovery (5–10 Phoenix targets), appends to `leads/pipeline.md`, queues Gate 1 items, runs SEO tasks.
5. **Raul — Content** — drafts copy in `clients/<client>/content/`.
6. **If Monday** — Emily's weekly pipeline review.
7. **If Friday** — Kyle's weekly review → `ops/weekly-review.md`.

## Outputs

- **Pull request** on branch `all-hands/YYYY-MM-DD` titled `Daily All-Hands — YYYY-MM-DD`. Body is the full markdown report with **pending approvals at the top**. This is your primary approval surface.
- **Gmail draft** to your authenticated address with a short summary + PR link. Review in Gmail before sending.

## Daily interaction

Each morning: open the PR (linked from the Gmail draft), reply to pending approvals by commenting `approve <name>` or leaving notes, then merge. Local `claude` sessions in `~/web-agency` can pull the merged branch and continue the work.

## Managing the trigger

- **List / verify**: invoke the schedule skill, action `list`
- **Run now**: schedule skill, action `run`, trigger `trig_01HLqma384JrYZUr4nkdi3Lb`
- **Edit prompt or schedule**: schedule skill, action `update`
- **Delete**: not supported via API — go to https://claude.ai/code/scheduled

## Expanding beyond 1 trigger

To split this back into per-role triggers (the original design — Emily 8:45, Kyle 9:00, Stevie/Matt/Raul 9:15, Emily Mon 8:30, Kyle Fri 16:00), upgrade your Anthropic plan tier to raise the daily-trigger limit, then ask: *"Use the schedule skill to split the all-hands trigger into per-role triggers."*
