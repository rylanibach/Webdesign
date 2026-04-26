# Daily Standup

Format: one section per day, newest on top. Each teammate appends a 1–3 bullet update by 09:15 PT. Kyle compiles and posts the summary at 09:00 PT.

---

## 2026-04-26 — Sunday

**Kyle (PM):**
- Morning orchestration: queue state going into today — **6 Gate 1 pending** (3 from Apr-19 now 7 days old: Arizona Mobile Notary, Jr's One Stop Mobile Notary, Tip Top Roofing; 3 from Apr-24 now 2 days old: Pamper Yourself Massage, Sterling Interstate, AZ Barber & Salon) and **10 Gate 2 outreach drafts now 7 days old** (Japez, Garcia's, Handyman Protocol, Able, Phoenician, J Window, Taqueria1AZ, West Coast Pest, Urban Desert Pest, Plumber of Phoenix). The Gate 2 drafts contain time-sensitive observation lines ("I just saw your Yelp review from Tuesday") that are now stale enough to need a freshness pass before send — flagging this as decision-required for the owner today.
- Yesterday's run (Apr-25, Saturday) was skipped — launchd attempted at 09:00 but gh-cli auth blocked the push (see `ops/logs/launchd-stdout.log`). Apr-26 run also showed a network resolution failure for github.com at 16:52 (see `all-hands-2026-04-26.log`). Today's manual catch-up run is now executing during the morning window.
- Dispatched Stevie → logo & wordmark mini-kit (the brand-asset gap that will block first-client kickoff). Dispatched Matt → domain & DNS setup playbook (the launch-day gap for first-time-website Phoenix clients, which is 90% of our pipeline). Dispatched Emily → discovery in fresh verticals (8 new leads across mobile RV, window tint, holiday lighting, dance studio; 3 High queued as Gate 1). No new outreach drafts — no Gate 1 approvals have landed since Apr-19. Dispatched Raul → testimonial & review collection kit (no client today has 6+ usable testimonials at kickoff; this is the gap that makes day-one trust signals work).
- Sunday — no weekly review scheduled. Emily's weekly pipeline review fires tomorrow (Monday Apr-27); will surface aging-by-vertical close forecasts then.

**Stevie (Design):**
- No active client engagements. Published `clients/_template/design/logo-mini-kit.md` — the rule we needed to stop logo work from blocking handoff: if client can't produce a usable SVG/1500px+ logo within 24 hours of kickoff, we ship a typeface-based wordmark mini-kit (3 SVG variants + favicon + apple-touch + GBP avatar + OG card). 80%+ of our Gate 2 pipeline is Yelp-only Phoenix small biz with no real logo, and "send your logo" is a 3-day stall every time.
- Locked the type stack to 4 trade vibes (trustworthy / rugged / friendly / premium), all on Google Fonts so no license drag. Hard rules on what we never ship: AI-generated logos, clip-art trade icons, gradient wordmarks, baked-in taglines, skewed type. Explicit "we don't redesign your truck" boundary so the conversation stays productive at kickoff.
- Handoff hook added to every future `handoff.md` Asset Inventory: brand mini-kit must be green before Matt starts dev. Pairs with `photography-and-imagery-guide.md` to make the imagery + brand-mark gates a single check.
- Template design stack is now: design-system + wireframe-kit + mobile-first + trust-signals + photography + logo-mini-kit. Genuinely complete for first-client onboarding.

**Matt (Dev):**
- No active client builds. Published `clients/_template/dev/domain-and-dns-setup.md` — full decision tree for the three real cases in our pipeline (no domain at all → register fresh on Cloudflare in client's name; existing domain we can log into → DNS-only handoff with mandatory email-records snapshot; existing domain locked behind forgotten access → 5-day recovery window then pivot to new domain rather than block launch).
- Locks in non-negotiable rules: registrar always in client's email account (never agency's), Rylan only takes Read + DNS Edit roles (never Super Admin or billing), email DNS snapshotted before any nameserver switch (the #1 cause of launch-day disasters), no GoDaddy for new registrations, no HSTS until week 2 post-launch so rollback stays cheap.
- Includes `dig` snippets for capturing MX/SPF/DKIM/DMARC pre-switch, rollback procedure with archived prior nameservers, and a 20-30 minute time budget so future Matt knows when DNS work has gone off the rails.
- Dev template stack now end-to-end complete: Astro starter → Tailwind components → SEO pack → analytics → deploy → DNS → pre-launch checklist. Zero scaffolding gaps for first client.

**Emily (Growth):**
- **Lead discovery: 8 new leads** across 4 fresh verticals not yet represented in the pipeline: mobile RV repair, window tinting, holiday lighting, dance studio.
  - **3 High queued as Gate 1:** Take It Eazy Mobile RV Service & Repair (Phoenix), Markos Tint (Phoenix), Honey Do Christmas Lights (Phoenix).
  - **5 Medium:** Phoenix RV Mobile Tech, Sunrise Mobile RV, Valley Christmas Lights, Bricks Studio, Conservatory of Dance.
- **No new outreach drafts** — no Gate 1 approvals have landed since Apr-19. The 10 Apr-19 drafts are now 7 days old. Recommend the owner approves with a one-line freshness instruction ("send today, replace any 'this week' references with 'recently'") rather than re-drafting from scratch — the personalization is still good, only the time markers are stale.
- SEO: no active clients. Pre-drafted a "holiday lighting Phoenix" October–December keyword cluster (the seasonal pull is huge in our valley because non-snowy December = visible-from-the-street decor matters more than elsewhere). Will deploy to Honey Do or Valley Christmas Lights the moment one signs.
- **Pipeline aging note for tomorrow's weekly review:** 16 leads have been in "Contacted / Gate 2" status without owner-side movement for >5 days. Tomorrow's review will forecast which are still warm vs. which need a re-touch sequence vs. mark-stale.

**Raul (Content):**
- No active client copy. Published `assets/testimonial-collection-kit.md` — the missing piece in our trust-signal chain. Audit script for harvesting existing reviews (GBP, Facebook, Nextdoor, Thumbtack — and explicitly NOT Yelp, since Yelp's TOS forbids displaying their review text on the client's own site, even with attribution; we use Yelp star badges only and ask happy Yelp reviewers to repost on Google).
- Three copy-paste scripts the client owns (post-job text, permission-to-quote-existing-praise, re-engage-old-customer email) with documented conversion rates so we can set expectations. Display format is locked: 25–60 word quote, first-name + last-initial + neighborhood, star count only when from a real public source, dated reviews, "via Google" or "direct" source badge, no stock-photo faces ever.
- Per-industry voice guidance for what to feature vs. skip in each of our 10+ pipeline verticals. Anti-patterns explicit: no buying reviews, no discounts-for-reviews, no 5-star filtering, no paraphrasing customer words, no fake old reviews dated current. Care-plan hook: monthly review-velocity check is what makes the $125/mo retainer real, not a make-work line item.
- Reusable copy library: voice + home + services + about + FAQ + agency about/pricing + testimonial-collection. Page-level + program-level copy is now complete.

**Blockers:**
- **Critical and aging:** 10 Gate 2 outreach drafts now 7 days old. Personalization is good but freshness lines are stale. Three options for owner: (a) approve with a one-line "send today, soften the time markers" note, (b) ask Emily to do a 30-min freshness pass and re-queue tomorrow, (c) abandon the Apr-19 batch and start fresh. Strongly recommend (a) — the lift to refresh is small and the per-lead research still holds.
- **6 Gate 1 items pending** (3 from Apr-19 = 7 days old, 3 from Apr-24 = 2 days old). Lower urgency than Gate 2 but still gating Emily's outreach pipeline.
- **Automation reliability:** Apr-25 run failed (gh-cli auth), Apr-26 also recorded a github.com DNS resolution failure at 16:52. Today's run is the manual catch-up. Pattern: launchd-driven runs are fragile when a network or auth condition lands during the 09:00 window. Worth investigating ahead of the next outage — if the daily push fails silently, the owner doesn't know there's a queue building up. Consider Kyle's earlier suggestion: louder failure signal in the daily email when push doesn't land.
- **Still no active clients.** Template/system stack is launch-complete by every measure we've tracked. The full pipeline unlocks the moment the first Gate 2 batch hits an inbox and produces a reply.

---

## 2026-04-24 — Friday

**Kyle (PM):**
- Morning orchestration: **we missed 4 runs** (Apr 20–23 — Claude usage cap; see `ops/logs/`). Queue state is frozen from Apr-19: **3 Gate 1 pending** (mobile notary × 2, roofing × 1) and **10 Gate 2 pending** (the full Apr-19 batch). Zero owner decisions landed this week. Fourth bullet of my blockers section below is the honest read.
- Today we ship the four carry-over items flagged as "next week's focus" in the Apr-17 weekly review, because nothing else has moved: Matt → `new-client.sh` scaffold script, Stevie → fastest-path wireframe kit, Raul → agency's own About + Pricing copy, Emily → direct-email sourcing playbook. These are the last template/ops gaps before first client.
- Dispatched Emily → discovery (6 new leads in fresh verticals: massage, moving, barber). 3 High queued as Gate 1. Drafted zero new outreach — no newly-approved Gate 1 leads to draft against.
- Friday — weekly review written to `ops/weekly-review.md`.

**Stevie (Design):**
- Published `clients/_template/design/fastest-path-wireframe-kit.md` — 4 pre-built wireframe variants (Trades, Services, Food, Retail) mapped to Raul's copy templates + Matt's Tailwind components. Goal: client-yes → Gate 3a in ≤2 hours instead of 6. Each variant names specific hero archetype, trust-bar layout, services grid shape, and CTA band spec.
- Explicit industry-matching table: every lead currently in Gate 2 (handyman, detailing, pool, pressure washing, electrical, painting, appliance, garage door, window, food truck, pest, plumbing, notary, roofing) now has a named starting variant.
- No active clients. Design-system coverage is now genuinely launch-complete.

**Matt (Dev):**
- Published `ops/scripts/new-client.sh` — one-command client scaffold. Runs `cp -r clients/_template clients/<slug>`, renames placeholders (`{{CLIENT}}`, `{{CLIENT_SLUG}}`, `{{CITY}}`, `{{INDUSTRY}}`, `{{PHONE}}`), creates a `comms/kickoff.md` stub, and prints the next-step checklist (dispatch Stevie, add business.ts, populate imagery inventory).
- Ships with `--dry-run` and `--force` flags, input validation (slug must be kebab-case), and cleanup on abort (no half-scaffolded client folders if the script exits mid-run). Tested against `_template/`.
- Shaves ~30 min off every Gate 3b dispatch. First live client can be scaffolded in ~10 seconds.

**Emily (Growth):**
- Published `ops/playbooks/contact-email-sourcing.md` — structured 5-tier lookup (domain WHOIS → GBP website owner contact → Yelp message → ROC/BBB registrant → LinkedIn Sales Nav pattern). Ownership-matching heuristic for distinguishing `info@` (skip) vs personal-owner emails (target). Captures the exact gap called out in last Friday's review — we're currently sending via Yelp PM because we don't have emails.
- **Lead discovery: 6 new leads** in 3 fresh verticals (massage, moving, barber). None of these verticals were in the pipeline before today.
  - **3 High queued as Gate 1:** Pamper Yourself Massage (Phoenix), Sterling Interstate Moving (Phoenix), AZ Barber & Salon (Phoenix).
  - **3 Medium:** Pikasso Barber Shop, Clean Cut Barber Shop, Classic BarberShop.
- **No new outreach drafts** — no Gate 1 approvals have landed since Apr-19. 10 Gate 2 drafts are still sitting, now 5 days old. Approach the owner review with this context: the freshness of observations ("I noticed your new Yelp review from Tuesday") decays fast.
- SEO: no active clients. Pre-drafted a "monsoon season preparedness" Phoenix keyword cluster (June–Sept roofing/pest/HVAC surge) — will deploy to any signed client in those verticals.

**Raul (Content):**
- Published `assets/agency/about.md` and `assets/agency/pricing.md` — our own site copy, closing last Friday's flagged gap. About page uses the "built for Phoenix small businesses" positioning, names the 3-gate review process as a feature (client knows what they're approving), and lists actual work from the current pipeline for proof.
- Pricing page commits to 3 packages (Starter $2,500, Standard $4,500, Care plan $125/mo) with scope fences and a line explaining we never lock the domain — explicit anti-Wix-trap language.
- Reusable copy library is complete for clients AND us. No copy gaps remaining.

**Blockers:**
- **Critical and aging:** 10 Gate 2 outreach drafts now 5 days old, 3 Gate 1 items 5 days old. Nothing moved Apr 20–23. Email freshness is eroding — the Apr-19 batch has observation lines like "I just saw your Yelp review from yesterday" that now read as 5 days stale.
- All-hands automation failed 4 days straight (Apr 20–23) due to Claude usage cap. Runs recovering today. Consider: the automation should fail louder when it can't push, so the owner notices within a day rather than a week.
- No active clients. Entire pipeline is still gated on owner decisions that stalled this week.

---

## 2026-04-19 — Sunday

**Kyle (PM):**
- Morning orchestration: caught a sync gap — owner had already approved 10 Gate 1 items (`[X]` in queue.md) dating back to Apr 12/14/17/18, but Emily hadn't picked them up because the pipeline still showed them as `pending`. Today's run closes that loop: all 10 now have drafted outreach and are queued as Gate 2.
- **Gate 2 backlog is now 18 items** (8 Apr-16 batch + 10 Apr-19 batch). This is the single biggest bottleneck in the agency — two and a half batches of personalized emails sitting in the repo. Surface this to owner first thing.
- Dispatched Emily → discovery (8 new leads across notary/roofing/auto-glass, 3 High queued) and the 10 outreach drafts described above. Dispatched Stevie → photography & imagery guide. Dispatched Matt → analytics & privacy playbook. Dispatched Raul → home-page copy template (the last page-level template gap called out yesterday).
- Sunday — no weekly review scheduled; Emily's weekly pipeline review fires tomorrow (Monday).

**Stevie (Design):**
- No active client engagements. Published `clients/_template/design/photography-and-imagery-guide.md` — locks down what imagery we source from the client vs. what we source ourselves, with a hard no-ship list (stock handshakes, AI people, non-AZ flora/architecture), an AI-image sniff test, and per-industry imagery emphasis.
- Introduces an **Imagery Inventory** section for every handoff.md: green/yellow/red state on owner portrait, vehicle shot, work photos, job-site context, GBP assets. **Matt cannot start dev until Imagery Inventory is fully green** — prevents the "client promised photos but never sent them" launch stall we'd otherwise hit on client #1.
- Template design stack is now: design-system + wireframe-template + mobile-first-checklist + trust-signals + photography-and-imagery. Genuinely no design-system gaps remaining for the first live client.

**Matt (Dev):**
- No active client builds. Published `clients/_template/dev/analytics-and-privacy.md` — codifies our **Plausible-by-default, no-cookie-banner** stance with the exact Astro install snippet, the 5 events we tag on every client (Phone Click, Email Click, Form Submit, Quote Request, Outbound: GBP), a privacy-policy page template, and the narrow conditions under which we grudgingly bolt on GA4.
- Includes a monthly check-in hook (pull events + flag phone-click drops + spam spikes) that justifies the care-plan retainer. This is the "we pay attention after launch" moat vs. a one-and-done Wix freelancer.
- Dev template stack is now complete end-to-end: Astro starter → Tailwind components → SEO pack → pre-launch checklist → Cloudflare Pages deploy → analytics + privacy. First client build has zero scaffolding blockers.

**Emily (Growth):**
- **Outreach: 10 new drafts written** for Gate 1-approved leads that had been sitting without outreach (Japez, Garcia's, Handyman Protocol, Able, Phoenician Garage, J Window, Taqueria1AZ, West Coast Pest, Urban Desert Pest, Plumber of Phoenix). All 10 queued as Gate 2 and bumped to "Contacted" in pipeline.
- **Lead discovery: 8 new leads** across fresh verticals (mobile notary, roofing, auto glass) — industries not yet represented in the pipeline.
  - **3 High queued as Gate 1:** Arizona Mobile Notary Services (Phoenix), Jr's One Stop Mobile Notary Services (Phoenix), Tip Top Roofing Service (Phoenix).
  - **5 Medium:** Onti's Mobile Notary, Affordable Mobile Notary, Phoenix Mobile Auto Glass, Four Peaks Roofing, North Canyon Roofing and Coating.
- SEO: no active clients. Pre-drafted a "pest-control + scorpion season" Phoenix keyword cluster (May–July surge) that will be ready to deploy the moment we sign a pest-control client — pest leads are now 3 of our Gate 2 pending.

**Raul (Content):**
- No active client copy. Published `assets/home-page-copy-template.md` — the last page-level gap flagged in Apr-18 standup. Covers all 6 home sections (hero, trust bar, services teaser, why-us, social proof, bottom CTA) with headline archetypes, fill-in templates, and per-industry starters for all 10 verticals currently in the Gate 2 queue.
- Hard rules included: home pages under 800 words, every "why us" card contains a number, no fabricated reviews, phone number in 4+ places. Anti-patterns spelled out ("Welcome to [Business]", "#1 in Phoenix", "dedicated to excellence") so any future agent or freelancer cannot accidentally ship them.
- Reusable copy library complete: voice guide + home + services + about + FAQ. Ready to drop into the first live client's `content/` folder on Gate 3b approval.

**Blockers:**
- **Critical and escalating:** 18 Gate 2 outreach drafts pending owner approval. This is two-and-a-half batches worth of ready-to-send personalized emails. Every day of delay erodes the freshness of the specific observation lines ("I noticed scorpion season is coming", "I saw your new Yelp review from Tuesday"). Highest-ROI action the owner can take this week: spend 15 minutes reading and approving the Gate 2 batch.
- 3 new Gate 1 items also pending (mobile notary × 2, roofing × 1).
- Still no active clients — full team continues to ship reusable template work at a strong clip, but the whole pipeline unlocks the moment outreach starts hitting inboxes.

---

## 2026-04-18 — Saturday

**Kyle (PM):**
- Morning orchestration: approval queue now carries **18 Gate 1 pending** (yesterday's 15 + 3 new from today) and **8 Gate 2 pending** (unchanged — the Apr-16 outreach batch is still sitting idle). The Gate 2 backlog is the critical blocker; 8 personalized emails are ready to send the moment owner says go.
- No active clients yet, so the team continues reusable template/system work. Each teammate shipped one net-new artifact today that fills a gap (trust-signal placement, Cloudflare deploy, about-page copy, local citations) rather than padding existing docs.
- Dispatched Emily → discovery (8 new leads across HVAC, plumbing, pest, flooring; 3 High queued) and SEO citations playbook. Dispatched Stevie → trust-signal placement guide. Dispatched Matt → Cloudflare Pages deploy playbook + Lighthouse CI config. Dispatched Raul → about-page copy template.
- Saturday — no weekly review scheduled.

**Stevie (Design):**
- No active client engagements. Published `clients/_template/design/trust-signals.md` — maps the 8 Phoenix-specific trust signals (ROC #, years in biz, owner photo, service-area map, real GBP review snippets, credentials row, local phone, response-time promise) to page regions (hero, trust bar, services, about, pre-footer, footer).
- Calls out anti-patterns (stock suits, fake review carousels, "family-owned since 1847" on a 2015 business) and per-industry emphasis. Pairs with `design-system.md` (tokens) and `mobile-first-phoenix-checklist.md` (UX).
- Handoff hook documented: every mockup I ship will now cross-reference which data fields the client needs to supply vs. which we source from GBP.

**Matt (Dev):**
- No active client builds. Published `clients/_template/dev/deploy-cloudflare-pages.md` — full flow from `npm create astro` through custom-domain cutover, plus a non-negotiable performance budget (LCP ≤ 2s, CLS ≤ 0.05, JS ≤ 50KB gzipped) enforced via a `.lighthouserc.json` and a GitHub Action that fails PRs that blow budget.
- Covers Formspree + Turnstile wiring, preview-per-PR workflow, DNS cutover (client keeps ownership — we never hold the domain hostage), rollback via Cloudflare dashboard, and a week-1 post-launch monitoring checklist.
- Template dev stack is now genuinely complete: Astro starter → Tailwind components → SEO pack → pre-launch checklist → deploy playbook. Zero scaffolding work blocking the first client build.

**Emily (Growth):**
- Lead discovery: **8 new leads** across fresh verticals (pest control, plumbing, HVAC, flooring) — industries not yet represented in the pipeline.
  - **3 High queued as Gate 1:** West Coast Pest Control (Phoenix), Urban Desert Pest Control (Phoenix), Plumber of Phoenix (Phoenix).
  - **5 Medium:** Bird Dog Plumbing (Phoenix), Cool Zone Air Conditioning (Phoenix, family-owned since 2006), Paul's Pest & Termite Control (Phoenix), Floor One (Mesa), Floor Daddy (Tempe).
- **No new outreach drafts** — no Gate 1 approvals have come through since yesterday's run. The 8 Apr-16 drafts are still pending owner review.
- SEO: published `ops/playbooks/phoenix-local-citations.md` — 4-tier Phoenix-specific citation submission list (Tier 1: GBP/Apple/Bing/Yelp/BBB/Nextdoor; Tier 2: Angi/HomeAdvisor/Thumbtack/Houzz/Porch/Networx/AZ ROC; Tier 3: Phoenix-specific including city-level chambers; Tier 4: by vertical). Includes NAP audit cadence and a review-acceleration sub-playbook targeting 10+ GBP reviews in first 30 days.

**Raul (Content):**
- No active client copy. Published `assets/about-page-copy-template.md` — 5-section skeleton (hero, story, principles, proof, CTA) with Phoenix-local voice rules, anti-patterns (dead corporate language we strike), and per-section copy archetypes.
- Includes a handoff hook: each About page now ships with a specific image brief for Stevie + a stat list the client must supply + JSON-LD founder fields for Matt's `LocalBusiness` schema.
- Reusable copy library is now: voice guide + services page + FAQ + about page. Hero/homepage template is the last page-level gap — queued for next template day.

**Blockers:**
- **Critical and growing:** 18 Gate 1 + 8 Gate 2 items pending owner decision. The Gate 2 backlog is the real bottleneck — 8 businesses have personalized outreach sitting in the repo that could hit inboxes today. Every day of delay erodes the "we just found you" freshness of the observation lines.
- No active clients — team is building reusable tooling at a healthy clip but without a live engagement we're shipping against theoretical needs. Priority should be closing the loop on Gate 2 so we get first replies flowing.

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
