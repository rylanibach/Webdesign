# Weekly Review

Written by Kyle every Friday 16:00 PT.

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
