# Fastest-Path Wireframe Kit

Pre-built wireframe variants for the 4 categories that cover ~90% of our Phoenix SMB pipeline. Goal: from client-yes to Gate 3a approval in **≤2 hours** instead of 6.

Each variant names a specific hero, trust bar, services grid, about, proof, FAQ, and CTA band — mapped to Raul's copy templates in `assets/` and Matt's Tailwind components in `clients/_template/dev/tailwind-components.md`. When a new engagement lands, I pick the variant that matches the lead's industry, run through the Imagery Inventory from `photography-and-imagery-guide.md`, and ship a wireframe as a single `wireframe.md` + 3-6 hand-drawn-feel component sketches.

---

## How to use this kit

1. Open the lead's `clients/<name>/design/` folder (created by Matt's `new-client.sh`).
2. Use the industry match table below to select a variant. If the lead straddles two, pick the one whose CTA archetype matches their strongest channel (phone-first → Trades variant; form-first → Services variant).
3. Copy the variant's "block order" into `wireframe.md`. Annotate per-block with the content source (client-supplied vs GBP-scraped vs copy template).
4. Fill the Imagery Inventory table from `photography-and-imagery-guide.md`. If any row is red, stop — flag in the handoff that Matt cannot start until green.
5. Submit to Gate 3a. After approval, move to Gate 3b (full mockup).

---

## Industry match table

| Lead industry | Variant | Why |
|---|---|---|
| Landscaping, fencing, concrete, pavers, painting, roofing, garage door | **Trades** | Trust-first, phone-first, seasonal urgency |
| Handyman, mobile mechanic, mobile detailing, pool service, pressure washing, HVAC, plumbing, electrical, appliance repair, pest control, locksmith, window cleaning, carpet cleaning, moving | **Services** | Speed-to-quote matters; form + phone hybrid |
| Taqueria, food truck, small restaurant | **Food** | Menu + location + hours are the whole job |
| Barber, massage, pet grooming, bike shop, any storefront | **Retail** | Booking CTA, hours, location map, gallery |

Every Gate-2-pending lead today has a named variant here. No guesswork on the first client.

---

## Variant 1 — Trades

**Target:** ROC-licensed contractors (fencing, concrete, roofing, garage door, painting, landscaping, paving). High-ticket ($2K–$50K jobs), trust-sensitive, phone-primary.

**Block order:**

1. **Header (sticky):** logo left, phone number right (tap-to-call, always visible). No nav bloat — 4 links max: Services / Work / About / Contact.
2. **Hero:** full-width job-site photo (client-supplied or we source AZ-specific stock). Headline archetype: `[Service] in [Neighborhood] — [Differentiator]`. Example: "Fence installation in Phoenix — ROC-licensed, family-owned since 2010." CTA: "Call for free estimate" button (tap-to-call). Secondary link: "See our work" → gallery.
3. **Trust bar (below hero, above fold on desktop):** 4 items inline — ROC number, years in biz, service-area cities, response time. Use `trust-signals.md` row 1 layout.
4. **Services grid:** 3–6 cards. Each card: icon, service name, 1-line description, starting-at price (if client allows), "request quote" inline CTA. Lean on `services-page-copy-template.md`.
5. **Social proof strip:** 3 GBP review snippets with star icon and first name/last initial. No fabricated reviews — Matt scrapes live.
6. **About preview (2 cols):** owner portrait left, 3-paragraph story right (per `about-page-copy-template.md`). Ends with "Read our story →" link to About page.
7. **Gallery:** 6–12 job-site photos. Before/after pairs for concrete/painting/landscaping; standalone for roofing/garage door/fencing.
8. **FAQ:** 6 Qs from `faq-copy-template.md` universal bank + 2 industry-specific (licensing, warranty, financing).
9. **Bottom CTA band:** "Get a free estimate — [phone]" on high-contrast color band. No form — trades convert better with phone.
10. **Footer:** NAP (exactly matches GBP + JSON-LD), hours, service-area list, ROC # repeated, socials.

**Wireframe sketch files to produce:** hero, services grid, trust-bar detail, footer. 4 sketches total.

**Raul copy sources:** home template, services template, about template, FAQ template.

**Matt component needs:** Hero, ServiceCard, TrustBar, CTABand (phone variant, no form).

---

## Variant 2 — Services

**Target:** mobile-first services with 2-hour response windows (handyman, mobile mechanic, pool, detailing, pressure washing, plumbing, HVAC, pest, locksmith, moving). Mid-ticket ($100–$1500 jobs), speed-sensitive, form + phone hybrid.

**Block order:**

1. **Header (sticky):** logo, phone right, "Get a Quote" CTA button (scrolls to form).
2. **Hero:** owner + truck/van photo OR owner doing the work (mobile mechanic under hood, groomer with dog). Headline: `Same-day [service] in [area]` or `[Service] in under 2 hours — [Neighborhood]`. CTAs: primary "Get a quote" (scrolls to form), secondary tap-to-call.
3. **Trust bar:** response-time promise, service area, years in biz, insured. Use `trust-signals.md` row 2 layout.
4. **3-step "how it works":** Call/text → Quote → Done. Visual icons, no paragraphs. This is the differentiator vs. Angi/Thumbtack lead-mill experience.
5. **Services grid:** 4–8 cards, each with typical turnaround time badge ("same-day", "1–2 hr", "next morning").
6. **Proof row:** 3 review snippets + GBP star rating + review count.
7. **Inline quote form:** name, phone, service dropdown, zip, optional description. Formspree + Turnstile (per `deploy-cloudflare-pages.md`). NO long address or email field — friction kills mobile forms.
8. **Service area map:** static map of Phoenix metro with covered zip codes highlighted.
9. **FAQ:** 6 Qs, lean on "how fast", "what do you charge", "are you insured", "do you come to [neighborhood]".
10. **Bottom CTA band:** dual — tap-to-call + "Text us now" (SMS link). SMS converts in this category.
11. **Footer:** NAP, hours, service-area cities, socials.

**Wireframe sketch files:** hero, how-it-works, quote form, service-area map.

**Raul copy sources:** home template, services template, FAQ template.

**Matt component needs:** Hero, ServiceCard (with badge slot), HowItWorks (new — 3-step icon row), ContactForm, CTABand (dual phone + SMS).

---

## Variant 3 — Food

**Target:** food trucks, taquerias, small Phoenix restaurants. Menu + hours + location is the whole job.

**Block order:**

1. **Header (sticky):** logo, "Today's Hours" pill (dynamic), "Directions" button (Google Maps deep link).
2. **Hero:** signature dish photo, huge. Headline: dish name + location. No marketing copy. Example: `Birria tacos. McDowell & 73rd.` CTAs: "See today's menu", "Get directions".
3. **Today's location/hours strip:** for food trucks — today's spot, tonight's spot, weekly schedule table. For fixed restaurants — hours + today's status (open/closed) live pill.
4. **Menu:** photo-heavy. Category sections. Prices if allowed. No "our story" crap before the menu — menu is above the fold on mobile scroll.
5. **Social proof:** 2 review snippets + Yelp/GBP badges.
6. **Instagram feed embed (optional):** latest 6 posts, for food trucks where social is the primary discovery channel.
7. **About (short):** 2 paragraphs, owner photo. Ends with "Follow us" Instagram link.
8. **Footer:** NAP, socials, last-updated timestamp for hours/location.

**Wireframe sketch files:** hero, menu layout, location strip.

**Raul copy sources:** shorter home template, minimal About.

**Matt component needs:** Hero (dish-centric), HoursPill (new — reads from business.ts), MenuSection, InstagramFeed (optional).

**Note:** food variant breaks some rules from the main templates — menu is above fold, About is truncated. Don't force the standard services-page structure here.

---

## Variant 4 — Retail / Storefront

**Target:** barbers, massage studios, pet groomers, bike shops, small retail. Booking + location + gallery is the job.

**Block order:**

1. **Header (sticky):** logo, "Book Now" button (scrolls to booking section or links to Square/Booksy/Calendly).
2. **Hero:** storefront or in-service photo (barber mid-cut, groomer with dog). Headline: `[Service type] in [Neighborhood] — book online in 60 seconds.` CTA: "Book Now".
3. **Trust bar:** years in biz, rating, service area, parking/walk-in info.
4. **Booking section:** either embed the booking widget OR link to the external system with a clear "Book on Booksy" etc. Do not roll our own booking — always integrate with whatever they already use.
5. **Services + pricing grid:** 4–8 services with price. For barbers: cut, fade, shave, kids. For massage: 30/60/90 min options.
6. **Gallery:** 8–12 photos, gridded. Work portfolio (haircuts, groom before/afters) OR storefront/interior.
7. **Social proof:** 3 review snippets + GBP rating.
8. **Hours + location:** static map, street address, hours table, parking note.
9. **FAQ:** 4 Qs — "first-time walk-in?", "kids welcome?", "what to bring/wear?", cancellation policy.
10. **Footer:** NAP, socials, booking link repeated.

**Wireframe sketch files:** hero, booking section, gallery, hours/location.

**Raul copy sources:** home template (minor), FAQ template.

**Matt component needs:** Hero, BookingEmbed (new — renders whichever booking system), ServiceCard (price-forward), Gallery, HoursMap.

---

## What I stop doing vs. the old wireframe process

- **No blank-page wireframing.** First question is "which variant?" — saves 2 hours of deciding block order from scratch.
- **No per-client copy improvisation.** I annotate each block with `[uses home-template hero archetype #2]` so Raul knows exactly which pattern to fill.
- **No mockup before Imagery Inventory.** If the client can't produce a truck shot and we can't source one, the Trades hero breaks — catch it at wireframe, not at mockup.

---

## When a lead doesn't fit any variant

Rare, but: roofers who also do solar (Trades + Services hybrid), or a massage therapist who's mobile-only (Services, not Retail). In those cases, start from the closest variant and document the diff in the wireframe — don't invent a new variant unless the pattern repeats 3+ times.

If a 5th variant is emerging, flag it in the weekly review and I'll promote it here.
