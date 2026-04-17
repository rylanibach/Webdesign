# Daily Standup

Format: one section per day, newest on top. Each teammate appends a 1–3 bullet update by 09:15 PT. Kyle compiles and posts the summary at 09:00 PT.

---

## 2026-04-17 — Friday

**Kyle (PM):**
- Morning orchestration: yesterday's run (Apr 16) hit a Claude usage cap at 09:02 and didn't push the Gate 2 entries for the 8 outreach drafts it wrote. Caught up today — all 8 now queued for owner review.
- Reviewed approval queue: **15 Gate 1 pending** (Japez + 3 handymen from Apr 12 that were never queued, Garcia's / Handyman Protocol / Able + 8 new industry picks from today) and **8 Gate 2 pending** (the Apr-16 outreach batch). Pipeline is genuinely blocked on owner decisions — we have 11 ready-to-send emails sitting idle.
- No active clients yet. Dispatched Emily → discovery (10 new leads, 3 High queued), Stevie → mobile-first Phoenix playbook, Matt → SEO/LocalBusiness schema scaffold, Raul → FAQ template.
- Friday weekly review written to `ops/weekly-review.md`.

**Stevie (Design):**
- No active client engagements. Published `ops/playbooks/mobile-first-phoenix-checklist.md` — Phoenix-specific mobile audit covering thumb zone, sunlight readability, 1-hand form friction, speed budget, and a physical-world sanity check (tap CTA one-handed in direct sunlight).
- Complements `design-system.md` with the behavioral/UX layer design tokens alone don't cover.
- Ready to wireframe day-one when first client responds.

**Matt (Dev):**
- No active client builds. Addressed last week's "next focus" item: published `clients/_template/dev/seo-local-business.md` with copy-paste Astro `<SEO />` and `<LocalBusinessSchema />` components, per-client `business.ts` data file, sitemap/robots setup, and a pre-ship SEO audit checklist.
- NAP consistency rule documented so footer + JSON-LD + geo meta never drift from GBP.
- Astro starter + Tailwind lib + pre-launch checklist + SEO pack now complete. Zero templates blocking first client scaffold.

**Emily (Growth):**
- Lead discovery: found 10 new leads across garage door, window cleaning, food truck, carpet cleaning, locksmith, and bike shop.
  - 3 High queued as Gate 1: Phoenician Garage Door & Repair (Phoenix), J Window Cleaning (Gilbert), Taqueria1AZ (Scottsdale).
  - 7 Medium: Today Garage Door, Lumberjack's Taco Shack, Integrity Carpet & Tile (Mesa), Window Works LLC (Gilbert), Arizona Locksmith, Mario's Locksmith, Domenic's 2 Wheelers (Tempe).
- Also queued 3 Gate 1 items that never made it to the queue from the Apr-12 run: Garcia's Handyman, Handyman Protocol, Able Handyman Services — all still "pending" in the pipeline.
- Outreach: all 8 approved Apr-14/15 leads already have drafts from yesterday's run. Added the 8 missing Gate 2 entries and bumped their pipeline stage to "Contacted / Gate 2 pending." No new drafts to write this morning — no new approvals since yesterday.
- SEO: no active clients. Prepped a Phoenix + [service] + [neighborhood] keyword template to deploy the moment we sign one.

**Raul (Content):**
- No active client copy. Published `assets/faq-copy-template.md` — universal Phoenix-trust question bank (license, years in biz, service area, response time, warranty), pricing/logistics modules, industry-specific examples (HVAC, pool, mobile mechanic, landscaping, handyman), voice rules, and an FAQPage JSON-LD handoff note for Matt.
- FAQs now covered alongside hero/services/voice — full template system ready for first engagement.

**Blockers:**
- **Critical & growing:** 15 Gate 1 + 8 Gate 2 items pending owner decision. The Gate 2 backlog in particular is the bottleneck — 11 businesses (the Apr-10/12/16 batches, 3 of which are already sent) have personalized outreach sitting in the repo waiting to hit an inbox.
- Yesterday's truncated run (rate limit) revealed a gap: Emily can draft outreach but Gate 2 queueing happens at a later pass, so a mid-run cap leaves drafts orphaned. Consider re-ordering so Gate 2 entry is written the same tool-call as the draft file.

---

## 2026-04-15 — Wednesday

**Kyle (PM):**
- Morning orchestration: resuming after 4 missed all-hands runs (Apr 11–14 failed due to rate limits/auth errors). Catching up pipeline state today.
- Reviewed approval queue: **9 pending Gate 1 items** (Japez Mobile Detailing, Big J's Mobile Detail, The Lightning Mobile Car Wash, Cam's Mobile Mechanic, A's Pool Service, LD Pressure Washing, Foquito Electric, GJ Solutions Painting, Starfix Appliance Repair). Owner action needed.
- **3 pending Gate 2 items** (Cardinals Fencing, Nikki's Mobile Grooming, Midwest Concrete) — outreach emails drafted Apr 12, still awaiting owner approval to send.
- No active client engagements yet. Team continues template/scaffold work.
- Dispatched Emily → lead discovery (6 new leads), pipeline review. Dispatched Stevie → design system refinement. Dispatched Matt → pre-launch checklist + template maintenance. Dispatched Raul → voice guide refinement.

**Stevie (Design):**
- No active client work. Updated design system at `clients/_template/design/design-system.md` — added image optimization guidelines and dark mode token variants for future client builds.
- Ready to start wireframing as soon as first client engagement begins (pending Gate 2 → client reply → Gate 3a flow).

**Matt (Dev):**
- No active client builds. Created pre-launch checklist at `clients/_template/dev/pre-launch-checklist.md` (added during Apr 12 run).
- Reviewed Astro starter scaffold and Tailwind component library — all templates current and ready for first client build.
- Standing by for Gate 3b approval to begin building.

**Emily (Growth):**
- Lead discovery: found 6 new Phoenix-area leads across electrician, painting, appliance repair, and pet grooming industries.
  - 3 High: Foquito Electric (Mesa), GJ Solutions Painting (Phoenix), Starfix Appliance Repair (Phoenix)
  - 3 Medium: Hailey's Mobile Pet Spa (Phoenix), Furry Frenzy Mobile Pet Grooming (Phoenix), Phoenix Mobile Groom (Mesa)
- All 3 High-priority leads queued as Gate 1 in approval queue.
- Outreach: no new outreach to draft — 3 Gate 2 items from Apr 12 (Cardinals Fencing, Nikki's, Midwest Concrete) still pending owner review. 6 other Gate 1 items from Apr 14 also still pending.
- SEO: no active clients. Will run local keyword research for first signed client.

**Raul (Content):**
- No active client copy work. Reviewed and refined `assets/voice-and-copy-guide.md` — ensured Phoenix-local flavor examples are current.
- Standing by to draft client-specific copy once a Gate 3b engagement starts.

**Blockers:**
- **Critical:** 9 Gate 1 leads need owner approval to pursue. 3 Gate 2 outreach drafts need owner approval to send. Pipeline is stalling without owner decisions.
- All-hands automation failed Apr 11–14 (rate limits + auth errors). Runs are working again as of today.
- No active clients yet — team is maintaining templates while pipeline matures.

---

## 2026-04-10 — Friday

**Kyle (PM):**
- Morning orchestration: reviewed approval queue. All 3 Gate 1 leads (Jimenez, Phoenix Pavers, Kargo) were approved by owner yesterday.
- Additionally, Escalona Landscaping and Osvaldo's Landscaping were marked approved in the pipeline — processed all 5 for outreach.
- Dispatched Emily → lead discovery (6 new leads found), outreach drafts for all 5 approved leads, SEO baseline.
- Dispatched Stevie → design system tokens & component patterns template (no active clients yet).
- Dispatched Matt → Tailwind component library for Astro (reusable patterns for first client build).
- Dispatched Raul → services page copy template with industry-specific examples.
- **5 Gate 2 items queued** — owner, please review outreach emails in `ops/approvals/queue.md` and approve for send.
- **3 new Gate 1 items queued** — Cardinals Fencing, Nikki's Mobile Grooming, Midwest Concrete.
- Friday weekly review written to `ops/weekly-review.md`.

**Stevie (Design):**
- No active client work — created reusable design system at `clients/_template/design/design-system.md`.
- Covers: 3 industry color palettes (trades, services, restaurant/retail), typography scale, spacing system, component patterns (hero, service cards, trust bar, CTA band, testimonials), responsive breakpoints, accessibility checklist.
- Ready to customize for first client engagement — just swap primary color and drop in content.

**Matt (Dev):**
- No active client builds — created Tailwind component pattern library at `clients/_template/dev/tailwind-components.md`.
- Includes copy-paste-ready Astro components: Hero, ServiceCard, CTABand, Testimonial, ContactForm (Formspree), and sticky Header with phone CTA.
- Components align with Stevie's design system tokens. Ready to scaffold first client site.

**Emily (Growth):**
- Lead discovery: found 6 new Phoenix-area leads across fencing, pet grooming, and concrete industries.
  - 3 High: Cardinals Fencing (Phoenix), Nikki's Mobile Grooming (Phoenix), Midwest Concrete (Glendale)
  - 3 Medium: Marie's Mobile Grooming, Green Dog Mobile Grooming, Fence AZ
- Outreach: drafted 5 personalized emails for all approved leads (Jimenez, Escalona, Osvaldo's, Phoenix Pavers, Kargo). All queued as Gate 2 in approval queue.
- Updated pipeline: 5 leads moved from New → Contacted, stage moved to Gate 2.
- SEO: no active clients yet. Planning to run local keyword research (Phoenix + service terms) and GBP audit for first signed client. Will prepare a local SEO checklist template next week.

**Raul (Content):**
- No active client copy work — created services page copy template at `assets/services-page-copy-template.md`.
- Template includes: hero headline/subhead patterns, service card copy structure, industry-specific examples (landscaping, auto repair, paving), optional pricing section, bottom CTA patterns.
- Complements the existing voice & copy guide. Ready to customize for first client.

**Blockers:**
- 5 outreach emails need owner approval (Gate 2) before they can be sent.
- 3 new leads need owner approval (Gate 1) to pursue.
- No active clients yet — team is building out reusable tooling and templates while pipeline matures.

---

## 2026-04-09 — Thursday

**Kyle (PM):**
- Morning orchestration: no active clients yet; pipeline was empty until today.
- Reviewed approval queue — was clear. Emily's lead run added 3 new Gate 1 items for owner review.
- Dispatched Stevie → reusable wireframe template; Matt → Astro starter scaffold; Raul → voice/copy guide.
- Dispatched Emily → lead discovery (8 new leads scored), SEO baseline research.
- **Action needed:** Owner, please review the 3 Gate 1 items in `ops/approvals/queue.md` and reply "approve" or "skip" for each.

**Stevie (Design):**
- No active client work — created reusable wireframe template at `clients/_template/design/wireframe-template.md`.
- Template covers: standard small-biz page structure (hero, services, about, testimonials, CTA, footer).
- Ready to apply to first client as soon as a Gate 3a engagement starts.

**Matt (Dev):**
- No active client builds — scaffolded Astro starter config at `clients/_template/dev/astro-starter.md`.
- Documented default stack: Astro + Tailwind + Cloudflare Pages, form handling, image optimization.
- Ready to spin up a client worktree as soon as a Gate 3b is approved.

**Emily (Growth):**
- Lead discovery: found 8 new Phoenix-area leads (5 High, 2 Medium, 1 Low).
- Top 3 High-priority leads queued as Gate 1: Jimenez Landscaping, Phoenix Pavers, Kargo Mobile Mechanics.
- No approved leads yet — outreach drafting on hold pending Gate 1 decisions.
- SEO: no active clients; will begin local SEO audit for first signed client.

**Raul (Content):**
- No active client copy work — created reusable voice & copy guide at `assets/voice-and-copy-guide.md`.
- Guide covers: Phoenix-local tone, standard page sections, CTA patterns, words to avoid.
- Ready to draft client-specific copy as soon as a Gate 3b engagement starts.

**Blockers:**
- Pipeline is brand-new — need owner to review Gate 1 leads before any outreach can begin.

---

## YYYY-MM-DD

**Kyle (PM):**
-

**Stevie (Design):**
-

**Matt (Dev):**
-

**Emily (Growth):**
-

**Raul (Content):**
-

**Blockers:**
-
