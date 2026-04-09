# Approval Queue

Kyle reads this every morning at 09:00 PT and surfaces pending items to the owner.

## How to use
- **Agents**: append a new line under the correct gate section when approval is needed.
- **Owner**: tell Kyle "approve" or "skip" (or give notes) for each pending item.
- **Kyle**: after owner decides, check the box, update status, and dispatch next action.

## Format
```
- [ ] GATE <N> | <Business Name> | <what needs deciding> | <link to file>
```
Checked = approved. Add `SKIP` or `NOTES: ...` inline if not approving.

---

## Gate 1 — Lead Approvals
_Emily adds leads here after scoring. Owner decides: pursue or skip._

- [ ] GATE 1 | Jimenez Landscaping | Phoenix landscaping co — no website at all, only unclaimed Yelp listing. Pursue? | leads/pipeline.md
- [ ] GATE 1 | Phoenix Pavers | Phoenix paver contractor — 47 photos & 20 reviews on Yelp but no website, unclaimed listing. Pursue? | leads/pipeline.md
- [ ] GATE 1 | Kargo Mobile Mechanics | Phoenix mobile mechanic — running on free Netlify subdomain (no custom domain, no branding). Pursue? | leads/pipeline.md

<!-- Emily appends here -->

---

## Gate 2 — Outreach Approvals
_Emily adds email drafts here. Owner approves before send. Follow-ups also queue here._

<!-- Emily appends here -->

---

## Gate 3a — Wireframe Approvals
_Stevie adds wireframes here. Owner approves direction before full mockup begins._

<!-- Stevie appends here -->

---

## Gate 3b — Mockup Approvals
_Stevie adds completed mockups + handoff.md here. Owner approves before Matt + Raul start._

<!-- Stevie appends here -->
