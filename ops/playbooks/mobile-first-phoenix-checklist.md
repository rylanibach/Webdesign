# Mobile-First Checklist — Phoenix Small Business Sites

A pre-launch mobile audit checklist Stevie runs on every client site before handoff to Matt. Written for Phoenix trades/service businesses where the overwhelming majority of traffic is mobile (homeowner searches while standing next to a broken AC, dead pool pump, or sparking outlet).

Use this in addition to `clients/_template/design/design-system.md` — this is the **behavioral** layer the design system alone doesn't cover.

---

## 1. Thumb Zone & Reachability

- [ ] Primary CTA (Call / Request Service) sits in the bottom half of the viewport on mobile, not the top
- [ ] Sticky header phone-tap CTA is always visible on scroll (right-side, large enough for a fat thumb)
- [ ] No primary action lives in the top-right corner — that's the iOS status bar / Android notch area
- [ ] All tap targets ≥ 44×44 pt (Apple HIG) / 48×48 dp (Android) with 8 pt of padding between

## 2. Outdoor / Sunlight Readability

Phoenix sun is brutal. Assume half your visitors are squinting at a phone at 110°F in a driveway.

- [ ] Body text contrast ≥ 7:1 against background (exceeds WCAG AAA); never rely on gray-400 on gray-100
- [ ] Primary CTA uses a saturated, high-contrast color — avoid pastels for action buttons
- [ ] Dark mode tokens present but **default to light mode** — dark mode in sunlight is unreadable
- [ ] Hero imagery has a solid overlay behind headline text (never "just hope it reads")

## 3. One-Thumb Scroll & Form Friction

- [ ] Contact form is ≤ 4 fields (Name, Phone, Service needed, Zip) — every extra field loses ~10% completion
- [ ] `type="tel"`, `autocomplete` attributes set on every input
- [ ] "Call now" option always sits beside the form — homeowners in distress want voice, not forms
- [ ] No multi-step forms for lead capture. Multi-step is for quotes, not first contact.

## 4. Speed Budget

Phoenix ISPs average fine, but service-call scenarios often happen on weak LTE in garages / backyards.

- [ ] LCP < 2.0s on simulated Fast 3G
- [ ] Hero image: AVIF w/ WebP fallback, max 120KB, `loading="eager"` + `fetchpriority="high"`
- [ ] Non-hero images lazy-loaded, width/height set (no CLS)
- [ ] Total JS on homepage < 80KB gzip (Astro static; Tailwind purged)
- [ ] Zero blocking third-party scripts above the fold (Google Maps, chat widgets — lazy load them)

## 5. Local Trust Signals (Above the Fold)

- [ ] Phoenix neighborhood / service area named in hero subhead (e.g., "Serving Tempe, Mesa, Chandler")
- [ ] Star rating + review count visible within first scroll (pull from GBP or Yelp)
- [ ] License number for trades (AZ ROC #) visible in footer — non-licensed trades bounce on this
- [ ] Family-owned / years-in-business stat in hero or trust bar (most Phoenix small-biz leads have this angle)

## 6. One-Handed Sanity Check

Before sign-off:

1. Pull the site up on your own phone, one-handed, in direct sunlight (step outside).
2. Tap the primary CTA with your thumb without re-gripping.
3. Fill the contact form with one hand, no zoom.
4. Tap the phone number and confirm it launches the dialer (`tel:` link).
5. Screenshot the hero and show it to someone for 3 seconds — can they tell what the business does and where they operate?

If any step failed, it's not ready.

---

**When to use:** Before every Gate 3b handoff. Attach results as `design/mobile-audit.md` in the client folder.

**Owner:** Stevie. Review quarterly; trades and services testing shows thumb-zone friction drives ~30% of form drop-off.
