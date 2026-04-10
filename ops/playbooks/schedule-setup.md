# Schedule Setup — Recurring Agent Tasks

The agency runs on a **single consolidated daily trigger** (Anthropic plan limit: 1 daily cloud scheduled session). One remote session plays all five teammates in sequence and conditionally runs the Monday pipeline review and Friday weekly review.

## The Trigger

| Field | Value |
|---|---|
| Name | `Hands Off Design — Daily all-hands` |
| ID | `trig_01HLqma384JrYZUr4nkdi3Lb` |
| Cron | `0 16 * * *` UTC = **daily 9:00 AM PT** |
| Repo | `https://github.com/rylanibach/Webdesign` (cloned **read-only** each run) |
| Model | `claude-sonnet-4-6` |
| MCP | Gmail (for draft email digest) |
| Delivery | **Gmail draft** (not a PR — sandbox can't push on current plan) |
| Manage | https://claude.ai/code/scheduled/trig_01HLqma384JrYZUr4nkdi3Lb |

## Why read-only + Gmail draft (not PRs)

The Anthropic plan tier allows the sandbox to **clone** public/connected repos but does **not** grant `git push` auth. The sandbox also only has 1 scheduled session/day. So the trigger is designed around those two constraints:

- Clone for context (reads CLAUDE.md, agent defs, queue, pipeline, clients/)
- Produces one consolidated report with proposed file changes as fenced code blocks
- Delivers via Gmail draft so the owner can review, copy-paste changes locally, and commit manually

When you upgrade the plan tier, we can split this into 5+ triggers and re-enable direct commit/PR flow.

## What it does (in order)

1. **Kyle — Morning Orchestration** — surfaces every pending gate from `ops/approvals/queue.md`, reviews active clients in `clients/`, proposes today's entry for `ops/daily-standup.md`, dispatches work to Stevie/Matt/Emily/Raul.
2. **Stevie — Design** — proposes wireframe/mockup/handoff advances for active clients, queues new Gate 3a/3b items.
3. **Matt — Dev** — proposes build advances for clients with approved handoffs, notes pre-launch-ready deploys.
4. **Emily — Growth** — lead discovery (5–10 Phoenix targets via WebSearch), proposes `leads/pipeline.md` appends and Gate 1 items, runs SEO tasks.
5. **Raul — Content** — proposes copy drafts for `clients/<client>/content/` reflecting Phoenix-local voice.
6. **If Monday** — Emily's weekly pipeline review.
7. **If Friday** — Kyle's weekly review (proposed write to `ops/weekly-review.md`).

## Output format

**Gmail draft** to your authenticated address, subject `Hands Off Design Daily All-Hands — YYYY-MM-DD`. Body structure:

1. `## ⚠️ Pending Owner Actions` — every approval gate at the very top
2. Seven sections (Kyle → Stevie → Matt → Emily → Raul → Mon/Fri conditionals)
3. Each section includes human-readable status + fenced code blocks labeled `ops/daily-standup.md (append)`, `leads/pipeline.md (append)`, `clients/<name>/content/home.md (new)`, etc.

## Daily interaction

1. Open the Gmail draft each morning.
2. Triage the Pending Owner Actions block — reply "approve X" / "skip X" notes in your local `claude` session.
3. For changes you approve, copy the fenced code blocks into the matching local files in `~/web-agency`.
4. `git add` + `git commit` the approved changes locally. Push if desired.
5. Send or delete the draft.

## Managing the trigger

- **List / verify**: invoke the schedule skill, action `list`
- **Run now**: trigger detail page → "Run now" button
- **Edit prompt or schedule**: schedule skill, action `update`
- **Delete**: not supported via API — go to https://claude.ai/code/scheduled

## Expanding beyond 1 trigger

To split this back into per-role triggers (the original design — Emily 8:45, Kyle 9:00, Stevie/Matt/Raul 9:15, Emily Mon 8:30, Kyle Fri 16:00) and restore direct commit/PR flow, upgrade your Anthropic plan tier to raise both the daily-trigger limit and enable sandbox git push auth. Then ask: *"Use the schedule skill to split the all-hands trigger into per-role triggers with direct commit/PR delivery."*
