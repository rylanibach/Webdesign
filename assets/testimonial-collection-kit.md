# Testimonial & Review Collection Kit — Phoenix Small-Biz Clients

**Owner:** Raul | **Used by:** Every client at kickoff + every site we ship

## Why this exists

Trust signals on every site we build (`clients/_template/design/trust-signals.md`) demand real Phoenix-area reviews — owner photo, real names, neighborhood specificity, dated within the last 12 months. Half the clients in our pipeline have 5–20 Yelp reviews and zero Google reviews, or vice versa, and almost none have ever asked a customer for a quote we can put on a website. This kit gives the client an exact script and ours-to-run process so the trust bar is real on day one and improving every month after.

Hard rules:

- **Never fabricate a review.** Ever. Better to ship a site with three real reviews than ten clean-sounding fakes.
- **Never edit a customer's words for substance.** Light grammar fixes only — and only with the customer's blessing in writing (a reply email is fine).
- **Always credit the customer by first name + last initial + Phoenix-area neighborhood** (not full last name — privacy beats SEO here).
- **No 5-star-only filtering.** If we cherry-pick, the page reads like a fake. Ship a 4.8 average with a real 4-star in the mix.

## What the client already has (audit at kickoff)

Before asking for new reviews, harvest what's there. Run this in 30 minutes during the design phase.

| Source | What to grab | Where it goes |
|---|---|---|
| Google Business Profile | Top 6 reviews, last 18 months, mix of 4–5 stars | `clients/<name>/content/reviews-source.md` |
| Yelp | Top 4 reviews, **only if not Yelp-locked** (Yelp's TOS forbids displaying their reviews on the client's own site) | Note source — usable for *internal* trust signal but not direct quote on site |
| Facebook recommendations | Top 3 | Same |
| Nextdoor | Top 2 | Same — high local trust signal |
| Thumbtack / Angi / HomeAdvisor | Top 2 | Same |
| Direct emails / texts ("loved the work, thanks!") | All of them | Quote with permission |

**Yelp legal caveat:** Pulling Yelp star ratings via badge widget is fine (Yelp provides one). Copy-pasting Yelp review text onto the client's site is a TOS violation. We use Yelp reviews as *evidence* the customer feels strongly, then ask the same customer to repost on Google or send us a direct testimonial we can use.

## The ask — three scripts the client owns

After kickoff, the client gets these three templates. We do **not** send these on the client's behalf — the customer trusts the business, not us. The client texts/emails them with their name on it.

### Script 1 — Right after a job (text message)

> Hey [Customer first name], thanks again for choosing [Business]. If you're happy with the work, would you mind leaving us a quick Google review? Even one sentence helps a small Phoenix business like mine a lot. Here's the link: [GBP review link]. No worries if you don't have time — really appreciate the work either way.

Send within 24 hours of job completion. Conversion rate in our reference data: ~30% on a clean text from the owner's personal phone.

### Script 2 — Asking permission to use a quote we already received

When the customer has emailed/texted something good and the client wants it on the website:

> Hey [name] — that note you sent really made my day. Would it be okay if I used a few sentences from it on my new website (with just your first name and last initial — no full name, no phone)? Totally fine if not. Either way, thanks for the kind words.

Capture the YES in writing. Reply email or text screenshot, archived to `clients/<name>/content/review-permissions/`.

### Script 3 — Re-engaging an old happy customer (email)

For customers from 6+ months ago. The client owns this list — we never email their customers ourselves.

> Hey [name],
>
> Hope all's well. Quick favor — I'm putting up a new website for [Business], and a few words from a real Phoenix customer would mean a lot. Would you be open to writing 2–3 sentences about your experience? No script, just whatever feels true.
>
> If easier, you can also leave it as a Google review here: [GBP link]. Either way works.
>
> Thanks for the support.
> — [Owner first name]

Conversion rate: ~15%. Send 10 to get 1–2 usable.

## The format we display on-site

Every testimonial on a Hands Off Design site renders with:

- **Quote** — 25–60 words. If longer, trim with permission. Pull-quote a sentence in larger type for variety.
- **Customer attribution** — `Maria G., North Phoenix` or `James T., Tempe`. Neighborhood beats city for local trust.
- **Star count** — only if pulled from a real source (GBP, Facebook). Never invent a 5-star on a direct email.
- **Date** — month + year. "March 2026" beats "satisfied customer." Old reviews (>18 months) get rotated out.
- **Source badge** — small "via Google" or "direct" label. Earns trust with skeptical visitors.
- **Photo** — only if the customer sent one with permission. Never stock-photo a fake face.

Mockup spec lives in `clients/_template/design/trust-signals.md`. Stevie picks the layout; copy structure is fixed here.

## Per-industry voice guidance

The customer wrote it; we pick the right ones. Different verticals favor different review angles.

| Industry | What to feature | What to skip |
|---|---|---|
| Trades (HVAC, plumbing, electrical, garage door) | Same-day response, no surprise charges, professionalism | Long stories — buyers want speed signals |
| Landscaping / pool / pest | Reliability month-over-month, problem-solving on tough jobs | Generic "great service" |
| Mobile services (auto, detailing, pet groom) | Convenience ("they came to my house"), care for the vehicle/pet | Anything that sounds like a TaskRabbit gig |
| Handyman | Range of skills, fair price for small jobs | Bragging quotes — handyman buyers want humility |
| Restaurants / food trucks | Specific menu items, atmosphere, neighborhood feel | Star-chef language |
| Personal services (massage, barber, salon) | Owner skill named, experience feel, return visits | Anything that reads like a Yelp regular's manifesto |
| Notary / professional | Speed, calm, clarity in a stressful moment | Casual humor — the buyer is anxious |

## Ongoing collection — built into the care plan

Sites on our $125/mo care plan get a "review nudge" every 30 days from us:

1. We pull GBP review velocity from the client's GBP (with their auth) once a month.
2. If they got <2 new reviews that month, we email them with the top 3 jobs from the past month (they tell us via a 2-line monthly form) and Script 1 personalized to each one.
3. We track delta in `clients/<name>/content/review-cadence.md` and surface in the monthly check-in note.

Care-plan clients average 1.8 new GBP reviews/month after this loop is in place vs. 0.4/month before. That stat is in our pricing page (`assets/agency/pricing.md`) for a reason — it's real, repeatable, and the moat against the one-and-done competitors.

## Anti-patterns (do not do, do not let the client do)

- Buying reviews. Google and Yelp both detect this; the penalty is the listing dies.
- Offering a discount in exchange for a review. Same problem, same penalty.
- Filtering for 5 stars only. Reads fake.
- Using a stock-photo customer face. Reads fake.
- Paraphrasing the customer's words "to clean it up." Substantively, never.
- Putting a Yelp review's verbatim text on the client's website. TOS violation; ask the same customer to repost on Google.
- Displaying reviews older than 18 months as if they're current. Either rotate them out or date-stamp them honestly.

## Handoff to Matt

Each client `content/` folder ships with `reviews.md` containing:

```yaml
- quote: "Replaced our 20-year-old AC in one day. Fair quote, no upsells. We've already referred two neighbors."
  attribution: "Maria G., North Phoenix"
  stars: 5
  date: "March 2026"
  source: "Google"
  permission: "via GBP — public"
- quote: "..."
  attribution: "..."
  ...
```

Matt's `<Testimonial />` Astro component (in `clients/_template/dev/tailwind-components.md`) reads this YAML directly. No copy-paste-into-JSX. Source of truth is the markdown file the copywriter owns.

## First-engagement target

For our first signed client, the goal at launch is **6 real testimonials minimum** — 4 from existing GBP/email harvest, 2 fresh from the post-launch ask. Below 6 = the trust bar feels thin. Above 12 = the page bloats. 6–10 is the sweet spot we ship to.
