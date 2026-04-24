# Weekly Review

Written by Kyle every Friday 16:00 PT.

---

## Week of 2026-04-20

**Wins:**
- Cleared the four carry-over items from last Friday's "next week's focus" list, despite a 4-day automation blackout: `ops/scripts/new-client.sh` scaffold script (Matt), `clients/_template/design/fastest-path-wireframe-kit.md` (Stevie), `ops/playbooks/contact-email-sourcing.md` (Emily), and `assets/agency/{about,pricing}.md` (Raul). Our own agency site now has production-ready copy, and a first-client scaffold takes ~10 seconds.
- Pipeline grew from 39 → 45 leads despite only one active run this week. 3 new verticals added (massage, moving, barber) that weren't represented before.
- Template system is **genuinely launch-complete**. After this week, there is no template/playbook gap left that would block first-client onboarding. Every remaining blocker is owner-side or pipeline-side.

**Misses / blockers:**
- **All-hands automation blackout Apr 20–23.** 4 consecutive days failed to Claude usage cap (see `ops/logs/all-hands-2026-04-20.log` through `all-hands-2026-04-23.log`). Monday's weekly-pipeline-review never ran. Owner got daily emails but the logs showed exit-1 — we should make that signal louder.
- **Owner-side backlog unmoved all week.** 3 Gate 1 + 10 Gate 2 items now 5 days old. The Apr-19 outreach batch had observation lines like "I noticed your Yelp review from Tuesday" — that line is now false and those emails need a light edit before send if they go out Monday.
- **Still zero replies received** on the 5 sent outreach emails (Jimenez/Escalona/Osvaldo/Pavers/Kargo batch from 2+ weeks ago). Per the follow-up sequence in `ops/playbooks/outreach-sequence.md`, they're past the +4d follow-up window and into +10d territory. We need to either (a) queue follow-up emails or (b) accept them as Stale.
- **Still no active clients.** The entire pipeline is stalled on the Gate 2 approval queue. This is the only thing blocking the first-client launch.

**Pipeline (Emily):**
- Total leads: 45 (up from 39 last week)
- Scored: 21 High, 23 Medium, 1 Low
- Gate 1 approved: 24 (unchanged from last week — no new approvals landed)
- Gate 1 pending: 6 (3 Apr-19 + 3 Apr-24 — notary/roofing/massage/moving/barber)
- Gate 2 approved + sent: 8 (unchanged)
- Gate 2 pending: 10 (unchanged — the Apr-19 batch, now 5 days old)
- Qualified / Proposal / Won / Lost / Stale: 0 / 0 / 0 / 0 / 0
- Industries covered: 30+ (added: massage, moving, barber)
- **Forecast:** if owner clears the 10 pending Gate 2 emails Monday morning, they go out Monday PM with light freshness edits. At ~20% response rate we'd expect 1–2 qualified conversations by end of next week. Zero replies on the original 5 sent emails is a real signal — may indicate we need to also revise the Gate 2 Tuesday batch before sending, not just approve and send as-drafted.

**Engineering (Matt):**
- Delivered the carry-over: `ops/scripts/new-client.sh` — parameterized scaffold, placeholder substitution, validation, dry-run, cleanup-on-abort. Tested against `_template/` end-to-end; emits Kyle's next-steps checklist.
- No other engineering work this week (4-day automation blackout + no active clients).
- Template dev stack unchanged: Astro starter + Tailwind lib + SEO pack + pre-launch + deploy + analytics/privacy + scaffold script. Nothing to add.

**Design (Stevie):**
- Delivered the carry-over: `clients/_template/design/fastest-path-wireframe-kit.md` — 4 variants (Trades, Services, Food, Retail) with per-block copy/component mappings and a per-industry match table. Every Gate-2-pending lead now has a named starting variant.
- No other design work (4-day blackout + no active clients).
- Design-system coverage is complete. Next design work will be a real client wireframe.

**Content (Raul):**
- Delivered the carry-over: `assets/agency/about.md` and `assets/agency/pricing.md` — our own site copy. About uses the three-gate process as a differentiator. Pricing page commits to three fixed prices (Starter $2,500, Standard $4,500, Full Rebuild $8,500 + $125/mo care) and publishes the full anti-lock-in clause.
- Note: this is the web-page copy version, separate from the internal sales sheet in `assets/pricing/packages.md` which has all add-ons, bundles, and payment terms. The public page stays simpler.
- Reusable copy library complete for clients AND agency self-copy. No gaps.

**Next week's focus:**
- **Owner:** **This is the highest-ROI action of the quarter.** Spend 45 minutes Monday morning reading and approving the 10 Gate 2 drafts. Every day further is 24 more hours of decay on the research specificity — after today, most drafts need a light freshness edit anyway, so the optimal move is: approve Monday, Emily re-reads for staleness before send, emails go out Tuesday.
- **Owner:** Also clear the 6 Gate 1 items (3 notary/roofing from Apr-19, 3 massage/moving/barber from Apr-24) in the same sitting.
- **Emily:** Before sending the Gate 2 batch Tuesday, do a freshness pass — any "I just saw" / "I noticed your recent" lines get updated or cut. Then queue +4d follow-up drafts for the original 5 sent emails (Jimenez/Escalona/Osvaldo/Pavers/Kargo) since they're now at +14d with zero reply.
- **Emily:** Apply the new `contact-email-sourcing.md` playbook to the Gate 2 batch — before send, attempt to find personal-owner emails for each of the 10 drafted leads. Even upgrading half of them from Yelp PM to personal email should materially lift response rate.
- **Stevie / Matt / Raul:** Standing by for first client engagement. If none lands next week, do NOT pad templates — instead pair with Emily on a "proof page" rendering of 2-3 mock client sites so our Work section isn't empty when a prospect visits.
- **Kyle:** Harden the all-hands automation — this week's 4-day blackout was invisible until Friday. Add a daily check that emails the owner with a **visible WARNING subject** when the cron exits non-zero (vs. the current success email pattern, which is identical regardless of exit code). Also look at whether we can retry against a different account/key when rate-limited.

---

## Week of 2026-04-13

**Wins:**
- Pipeline grew from 14 → 39 scored leads (+25 net) across 6 new industries: handyman, appliance repair, painting, electrical, pressure washing, mobile detailing/car wash, pool service, and this Friday's batch (garage door, window cleaning, food truck, carpet, locksmith, bike shop).
- Emily cleared the outreach backlog end-to-end: 8 Apr-14/15 approved leads had personalized drafts ready by Apr-16 (despite the Claude usage cap truncating that run before queueing). Fixed the orphaned queue today.
- Template system is done for launch: Stevie published the mobile-first Phoenix checklist, Matt shipped the SEO/LocalBusiness schema pack, Raul shipped the FAQ template. We can now onboard a client in <48 hours from "yes" to first wireframe.

**Misses / blockers:**
- **Pipeline blocked on owner approvals.** 15 Gate 1 + 8 Gate 2 items pending. The Gate 2 queue in particular represents 11 personalized outreach emails we've already written that nobody's receiving yet. This is the single most expensive bottleneck right now — every day of delay is a day of decay on the research/pitch.
- All-hands automation was fragile mid-week: Apr 11–14 failed (rate limits/auth). Apr-16 hit the Claude cap mid-run and left 8 Gate 2 entries unqueued. Cadence is recovering but we should assume ≥1 incomplete run per week.
- Contact emails still unknown for most leads — we're sending via Yelp message or phone. Blocks mass-personalization at scale. Emily needs a structured step to source direct email addresses.

**Pipeline (Emily):**
- Total leads: 39 (up from 14 last week)
- Scored: 18 High, 20 Medium, 1 Low
- Gate 1 approved: 14 (Jimenez Landscaping, Escalona, Osvaldo's, Phoenix Pavers, Kargo, Cardinals Fencing, Nikki's, Midwest Concrete, Big J's, Lightning, Cam's, A's Pool, LD Pressure, Foquito, GJ Solutions, Starfix)
- Gate 1 pending: 15 (Japez + 3 handymen from Apr-12, Phoenician Garage Door, J Window Cleaning, Taqueria1AZ + 3 more handymen surfaced today — but 3 of those were already on pipeline.md unqueued)
- Gate 2 approved + sent: 8 (Apr-10 and Apr-12 batches)
- Gate 2 pending: 8 (Apr-16 batch — drafted, awaiting owner review)
- Qualified: 0
- Proposals / Won / Lost: 0 / 0 / 0
- Industries covered: 18 (up from 7 last week)
- **Forecast:** If owner clears the 8 pending Gate 2 emails on Monday and they go out Tuesday, at ~20% response we'd expect 2 qualified conversations by end of next week. Zero qualified leads this week is entirely gated by approval cadence, not outreach volume.

**Engineering (Matt):**
- Delivered the "next week's focus" from last Friday — Astro SEO meta component, LocalBusiness JSON-LD schema, NAP consistency rule, pre-ship SEO audit.
- Template pack now: Astro starter + Tailwind components + pre-launch checklist + SEO/schema. Ready for `cp -r clients/_template clients/<name>` on Gate 3b day-one.
- No production deploys (no clients). Uptime/backup N/A.

**Design (Stevie):**
- Published mobile-first Phoenix playbook — complements the design system with the behavioral layer (thumb zone, sunlight readability, speed budget, physical sanity check).
- Design-system dark-mode tokens added Apr-15.
- Ready to wireframe the first client within hours of Gate 3a dispatch.

**Content (Raul):**
- Published FAQ copy template (universal trust Qs, pricing/logistics modules, industry-specific examples, FAQPage JSON-LD handoff).
- Voice guide + services template + FAQ template = full page-level content coverage for first client.

**Next week's focus:**
- **Owner:** Clear the Gate 1 + Gate 2 queues early Monday. 8 Gate-2 emails going out Tuesday starts the first possible reply window by Thursday.
- **Emily:** Source direct contact emails for the Jimenez/Escalona/Osvaldo/Pavers/Kargo batch (2 weeks since outreach — if no reply by Apr-20, queue Gate 2-followup entries at +4d as designed). Continue discovery in restaurants, dentists, small retail.
- **Stevie:** Start prepping a "fastest-path wireframe kit" — pre-built wireframe variants for the top 4 industries (trades, services, food, retail) so we can go from client-yes to Gate 3a in 2 hours instead of 6.
- **Matt:** Build a one-command client scaffold script (`ops/scripts/new-client.sh <name>`) that runs `cp -r clients/_template clients/<name>`, wires a git worktree, and renames placeholders. Shaves 30 min off every Gate 3b.
- **Raul:** Draft the agency's own "About" and "Pricing" page copy — we still haven't written our own site copy.
- **Kyle:** Audit the all-hands script for rate-limit resilience — re-order Emily's steps so Gate 2 entries are written in the same file batch as the draft itself, so a mid-run cap doesn't orphan the queue.

---

## Week of 2026-04-07

**Wins:**
- Agency pipeline launched — went from zero leads to 14 scored leads in 2 days.
- All 5 High-priority leads approved by owner and outreach emails drafted. Fast turnaround.
- Reusable template system built out across design, dev, and content — team is ready to execute as soon as a client signs.

**Misses / blockers:**
- No signed clients yet — expected for week 1. Pipeline needs time to convert.
- Haven't identified owner/contact email for most leads yet — relying on Yelp messaging and phone. Emily should research direct emails next week.
- Gate 2 outreach emails pending owner approval — need to clear the queue to start the outreach clock.

**Pipeline (Emily):**
- New leads: 14 total (8 from 04-09, 6 from 04-10)
- Scored: 8 High, 5 Medium, 1 Low
- Gate 1 approved: 5 (Jimenez Landscaping, Escalona Landscaping, Osvaldo's Landscaping, Phoenix Pavers, Kargo Mobile Mechanics)
- Gate 1 pending: 3 (Cardinals Fencing, Nikki's Mobile Grooming, Midwest Concrete)
- Gate 2 pending: 5 outreach drafts awaiting owner review
- Qualified: 0 (outreach not yet sent)
- Proposals out: 0
- Won / Lost: 0 / 0
- Industries covered: landscaping (3), auto repair (2), pavers (1), pool service (2), fencing (2), pet grooming (3), concrete (1)
- Forecast: if outreach converts at ~20%, expect 1-2 qualified leads by mid-April

**Engineering (Matt):**
- Astro starter scaffold documented (stack: Astro + Tailwind + Cloudflare Pages)
- Tailwind component library created — Hero, ServiceCard, CTABand, Testimonial, ContactForm, Header
- Components aligned with Stevie's design tokens. Ready to spin up first client worktree on Gate 3b approval.

**Design (Stevie):**
- Wireframe template created (standard small-biz page structure)
- Design system created with 3 industry color palettes, typography scale, spacing system, component patterns, accessibility checklist
- Ready to produce wireframes within hours of first client engagement

**Content (Raul):**
- Voice & copy guide published (Phoenix-local tone, standard sections, CTA patterns)
- Services page copy template created with industry-specific examples (landscaping, auto repair, paving)
- Ready to draft client copy on Gate 3b approval

**Next week's focus:**
- Owner: clear Gate 1 + Gate 2 queues so outreach can go out Monday/Tuesday
- Emily: research contact emails for approved leads; continue lead discovery in new industries (restaurants, gyms, dental); prepare follow-up sequence for non-responders
- Stevie: begin wireframe for first qualified lead (when one responds)
- Matt: optimize Astro starter — add SEO meta component, structured data for local business schema
- Raul: draft "about us" page copy for the agency itself; prepare FAQ copy template

---

## Week of YYYY-MM-DD

**Wins:**
-

**Misses / blockers:**
-

**Pipeline (Emily):**
- New leads:
- Qualified:
- Proposals out:
- Won / Lost:

**Engineering (Matt):**
-

**Design (Stevie):**
-

**Content (Raul):**
-

**Next week's focus:**
-
