# Trust Signals — Placement Playbook

**Owner:** Stevie | **Applies to:** every small-business site we ship (especially Phoenix trades)

Phoenix small-business customers do not trust generic websites. They trust specific, verifiable signals: a real face, an Arizona license number, a service-area map, a years-in-business badge, a local phone number. This playbook maps *which* signals go *where* — so every layout we ship has them in the right zones.

Pair with `design-system.md` (tokens) and `mobile-first-phoenix-checklist.md` (touch / sunlight UX).

## The 8 trust signals we use

| Signal | Why it converts in Phoenix | Where to source |
|---|---|---|
| **AZ ROC license number** | "ROC #123456" is the single strongest trust signal for trades. Customers have been burned by unlicensed contractors. | roc.az.gov lookup |
| **Years in business** | "Serving Phoenix since 2009" beats "experienced." Be specific. | Client intake form |
| **Owner / crew photo** | Real people, shot on real Phoenix locations (desert backdrop, client's truck, actual job site). No stock. | Client-supplied or we shoot during intake |
| **Service area map** | A visual map with pins on Phoenix metro cities. Customers want to see "my neighborhood" before they call. | Custom SVG or static map |
| **Real Google review snippets** | 3–5 pulled from GBP, with reviewer first name + neighborhood if possible ("Mike D., Ahwatukee"). | GBP export, not generic "5-star service!" |
| **Licensed / Bonded / Insured badge row** | Small icon row: ROC, BBB, Angi Super Service, Nextdoor Neighborhood Favorite, whichever apply. | Client intake + awards list |
| **Local phone number** | Phoenix-area code (602 / 480 / 623) in the header, not a toll-free 800. | Client's actual line |
| **Response-time promise** | "Text back within 1 hour, Mon–Sat" — Phoenix customers compare on response speed. | Client commitment |

## Placement by page region

### Above the fold (hero area)
**Must appear in first viewport on mobile:**
- Local phone number in sticky header (tap-to-call)
- ROC license number (subtle, in header trust strip or under hero CTA)
- One review snippet + star rating (right under headline, not buried)

**Avoid:** long bio text, stock photos, generic "Welcome to..." copy.

### Mid-page trust bar (between hero and services)
A horizontal strip with 3–5 icons:
- Years in business badge ("Since 2009")
- Licensed / Bonded / Insured
- BBB Accredited or ROC #
- 5-star average + review count ("4.9 · 127 reviews")
- Nextdoor Neighborhood Favorite (if applicable)

Keep icons monochrome or brand-tinted; do NOT pull in generic Fiverr badge graphics.

### Services section
Each service card gets a one-line trust line:
- "Same-day service in [city]"
- "All work warrantied 1 year"
- "Flat-rate pricing, no surprise fees"

### About section
This is where **owner photo + story** goes. Not in the hero. The hero is for the pain/CTA; the about section is for the handshake.
- Single owner shot, eyes toward camera or at work
- 2–3 paragraph story (Raul writes this) — include at least one Phoenix-local detail (neighborhood they grew up in, how long they've worked the Valley heat, etc.)
- Crew photo below if applicable

### Before footer (conversion band)
- Service area map with Phoenix metro pins
- Response-time promise callout
- CTA repeat (phone + form)

### Footer
- ROC # (repeated — legal + trust)
- NAP block exactly matching GBP
- Hours (with Phoenix timezone if serving out-of-state)
- Social links (only the platforms they actually use — don't add a dormant Twitter icon)

## Anti-patterns (we don't ship these)
- **Stock photos of suits shaking hands.** Phoenix trade customers assume anyone in a suit is a salesman. Use the client's real truck, real gear, real crew.
- **Fake review carousels.** If a review isn't on GBP, don't display it. Customers cross-check.
- **"Family-owned since 1847" on a business that started in 2015.** Be honest. "New but thorough" beats "fake heritage."
- **Chatbot widgets with "Hi! I'm Sarah!"** — these erode trust for small local shops. Use a real text-to-phone link instead.
- **Generic BBB logos without the accreditation.** Only use the logo if they're actually accredited — BBB will send a takedown.

## Per-industry emphasis
Not every trust signal matters equally. Lead with:

- **HVAC / plumbing / electrical:** ROC #, years, 24/7 response, warranty
- **Pool service / landscaping:** service area map, recurring-customer count, before/after photos
- **Auto / mobile mechanic:** service-area map (where they'll come to you), flat-rate pricing, response time
- **Handyman:** bonded/insured, service variety, fast response
- **Food trucks / restaurants:** location map or schedule, IG link with real food photos, hours, menu PDF or link
- **Pet grooming / mobile services:** service area map, photos of pets (owner-supplied, consent noted), insurance
- **Painting / roofing / fencing:** ROC #, warranty, portfolio gallery, financing availability if offered

## Handoff to Matt
When I deliver a mockup, `handoff.md` will list:
1. Which trust signals are in the design and where
2. Which data fields the client must supply (ROC #, year founded, response-time promise, service area, social proof count)
3. Which trust signals are wired to JSON-LD (Matt's `seo-local-business.md` covers `LocalBusiness` schema — this doc covers the visual layer)

If the client can't supply a signal (e.g., brand new business, no reviews yet), I'll call it out and we'll scope a review-collection sprint with Emily in the first 30 days post-launch.
