# FAQ Copy Template — Phoenix Small Business Sites

Reusable FAQ structure and question bank. FAQs convert skeptics and win long-tail SEO — a well-built FAQ earns a "People Also Ask" spot on Google for local queries.

**Use with:** `assets/voice-and-copy-guide.md` and `assets/services-page-copy-template.md`.

---

## When to include an FAQ section

Always on the homepage (6–8 Qs) and always on the dedicated services page (8–12 Qs). Skip FAQs on the About page — wrong intent.

**Why it matters:** Phoenix small-biz sites with FAQ + schema rank for 3–5x more long-tail service queries (e.g., "how much does drain cleaning cost in Phoenix").

---

## The Universal Question Bank

Pick 6–12 that match the business. Always include the first 5 — they're the "skeptic questions" that block conversion.

### Trust & Legitimacy (always include)
- **Are you licensed and insured?** → License #, bonded status, insurance carrier if applicable
- **How long have you been in business?** → Years + "locally owned and family-run" if true
- **Do you service [neighborhood]?** → List every service area city explicitly (good for SEO)
- **How fast can you get here?** → Same-day / next-day / after-hours policy
- **What happens if something goes wrong after the job?** → Warranty / guarantee terms

### Pricing (pick 2–3)
- **Do you charge for estimates?** → Free / flat fee
- **How do you price your work?** → Flat rate / hourly / per project — keep it plain
- **Do you accept credit cards?** → Yes/no + Zelle/Venmo if they take it
- **Do you offer financing?** → Only if true — never invent

### Logistics (pick 2–3)
- **What are your hours?** → State emergency/after-hours availability separately
- **Do I need to be home during the service?** → Important for mobile trades + pet groomers
- **What do I need to do to prepare?** → Drive-thru-friendly list
- **How do I schedule?** → Phone preferred? Online form? Text?

### Service-specific (pick 1–3)
Build these from the client's actual job notes. Ask the owner: "What do customers always ask you on the phone before booking?" — those questions belong here.

Examples by industry:
- **HVAC:** *How often should I replace my air filter in Phoenix?*
- **Pool service:** *How often should my pool be cleaned in summer vs. winter?*
- **Mobile mechanic:** *Can you do repairs in my apartment complex parking lot?*
- **Landscaping:** *Do you haul away trimmings or do I need to dispose?*
- **Handyman:** *Is there a minimum job size?*

---

## Voice & Length Rules

- Q: short, written how a customer would actually type it into Google (not "What is your service area?" — write "Do you service Tempe?")
- A: 2–4 sentences max. Never a paragraph.
- A starts with the answer, then context. "Yes — same-day service across the East Valley. Call before 2 PM and we'll be there today."
- No corporate voice. Match `assets/voice-and-copy-guide.md` — plain-spoken, Phoenix-local.

---

## Skeleton (copy into `clients/<name>/content/home.md` or `services.md`)

```markdown
## Frequently Asked Questions

### Are you licensed and insured?
Yes — AZ ROC #[license] and fully insured. Happy to share a certificate before any work begins.

### How fast can you get here?
Same-day for most Phoenix metro calls placed before noon. Emergency after-hours available — call directly, don't wait for the form.

### Do you service [Tempe / Mesa / Chandler / Gilbert / Scottsdale]?
Yes — we cover all of [list]. If you're not sure, call and ask.

### Do you charge for estimates?
No — estimates are free, on-site, no obligation.

### [Industry-specific Q]
[Short answer.]

### What if something isn't right after the job?
[Warranty terms in plain English.]
```

---

## SEO Add-on: FAQPage Schema

Matt should wrap the FAQ in `FAQPage` JSON-LD (see `clients/_template/dev/seo-local-business.md`). This is what unlocks the "People Also Ask" rankings.

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Are you licensed and insured?",
      "acceptedAnswer": { "@type": "Answer", "text": "Yes — AZ ROC #..." }
    }
  ]
}
```

Raul provides questions + answers as markdown; Matt handles the schema emit.

---

**Owner:** Raul. Customize the service-specific questions for every client — never ship the template questions unchanged.
