# Hands Off Design — Project Context

## Mission
**Hands Off Design** (`handsoffdesign.com`) is a web agency that builds and rebuilds websites for **small businesses in the Phoenix, AZ metro area**. We help local businesses that have no website, an outdated one, or one that doesn't convert. Brand guide: `assets/branding/brand-guide.md`.

## How to Resume
From this directory: `claude` — this CLAUDE.md auto-loads.
- Active client work lives in `clients/<client-name>/`
- Lead pipeline: `leads/pipeline.md`
- **Approval queue (check this daily):** `ops/approvals/queue.md`
- Daily/weekly logs: `ops/daily-standup.md`, `ops/weekly-review.md`
- Playbooks (reusable how-tos): `ops/playbooks/`
- Brand & shared assets: `assets/`

## The Team (subagents in `.claude/agents/`)

| Name | Role | Skills | Agent file |
|---|---|---|---|
| Kyle | Project & Client Manager | writing-plans, dispatching-parallel-agents, requesting-code-review, receiving-code-review, using-superpowers | `kyle-pm.md` |
| Stevie | Designer (UI/UX + Graphic) | frontend-design, ui-ux-pro-max, impeccable, taste-skill, redesign-skill, soft-skill, output-skill, minimalist-skill, brutalist-skill, stitch-skill | `stevie-designer.md` |
| Matt | Developer (Full-Stack) | executing-plans, subagent-driven-development, test-driven-development, systematic-debugging, verification-before-completion, requesting-code-review, receiving-code-review, using-git-worktrees, finishing-a-development-branch, dispatching-parallel-agents | `matt-developer.md` |
| Emily | Growth & Marketing (Sales + SEO) | executing-plans, subagent-driven-development, test-driven-development | `emily-growth.md` |
| Raul | Content Writer / Strategist | brainstorming, writing-plans, writing-skills | `raul-content.md` |

Invoke any teammate by name, e.g. "Stevie, draft a hero mockup for Acme HVAC."

## Automated Workflow — Human-in-the-Loop

The agency runs on a 3-gate approval system. Agents do the work; you approve at key moments.

```
Emily (08:45) → finds leads → GATE 1: approve lead?
                                        ↓ yes
Emily → drafts outreach email → GATE 2: approve email?
                                        ↓ yes
Gmail sends → follow-up auto-queued at +4 days
                                        ↓ client replies
Stevie → wireframe → GATE 3a: approve direction?
                                        ↓ yes
Stevie → full mockup + handoff.md → GATE 3b: approve build?
                                        ↓ yes
Matt builds ──────────────────────────────────────────┐
Raul writes copy (parallel) ──────────────────────────┘
                                        ↓ both done
Kyle: pre-launch review → you approve → Matt deploys
```

**Your daily interaction:** open `claude`, Kyle surfaces what needs your decision. Reply "approve [name]" or give notes.

## Cadence
| Time (PT) | Who | What |
|---|---|---|
| 08:45 daily | Emily | Lead discovery |
| 09:00 daily | Kyle | Morning orchestration + approval surface |
| 09:15 daily | Stevie / Matt / Raul | Daily tasks |
| 08:30 Mon | Emily | Pipeline review |
| 16:00 Fri | Kyle | Weekly review |

Recurring tasks are registered via the `schedule` skill (see `ops/playbooks/schedule-setup.md`).

## Working Style
- Phoenix-local focus — Emily's outreach, SEO, and Raul's copy should reflect AZ context.
- Small businesses, lean budgets — favor Astro/Next.js static sites, Cloudflare Pages, simple CMS.
- One client folder per engagement, with `design/ dev/ comms/ content/` subfolders (see `clients/_template/`).
