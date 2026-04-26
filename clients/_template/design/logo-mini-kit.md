# Logo & Wordmark Mini-Kit — Phoenix Small-Biz Clients

**Owner:** Stevie | **Used at:** Stage 2 Mockup, when client has no usable logo

## The problem this solves

Most of our Gate 2 pipeline is Yelp-only Phoenix small businesses (handymen, mobile detailers, fencing, pool service, mobile notaries). 80%+ of them do not have a real logo — at best they have a stretched JPG, a generic clip-art wrench, or a phone-camera shot of a vinyl truck decal. Asking them to "send your logo" stalls handoff for days and produces unusable assets.

**Rule:** If the client cannot produce an SVG or 1500px+ PNG with a transparent background within 24 hours of the kickoff call, Stevie ships a wordmark-based mini-kit using this guide. We do not block dev on logo work.

## What we ship (no AI, no clip art, ever)

For every client without a usable logo, deliver three SVG files in `clients/<name>/design/brand/`:

1. **`wordmark-primary.svg`** — Business name set in the chosen brand typeface, kerned by hand, locked color tokens. This is the logo for 90% of placements (header, footer, email, invoice).
2. **`wordmark-stacked.svg`** — Same wordmark but two lines (e.g., "Cardinals" / "Fencing") for square placements (favicon, GBP profile, social avatar).
3. **`mark.svg`** — Optional. A 1–2 letter monogram or a simple trade glyph (a wrench silhouette, a paw shape, a single drop), only if the wordmark alone does not solve the favicon/avatar case. Never ship a generic stock icon.

Do not ship full illustrative logos in the mini-kit. If the client wants a "real logo," that's a separate engagement priced as a brand sprint — and we say so on the kickoff call.

## Type stack (pick one per client; do not mix)

Pair the typeface to the trade vibe. Use only system-licensed or Google Fonts faces — no purchased licenses for the mini-kit tier.

| Vibe | Trade examples | Typeface | Weight |
|---|---|---|---|
| Trustworthy / mature | HVAC, plumbing, electrical, garage door | Manrope or Inter | 700 |
| Hands-on / rugged | Fencing, concrete, landscaping, paving | Bricolage Grotesque or Archivo | 800 |
| Friendly / personal | Handyman, mobile notary, pet grooming, massage | DM Sans or Plus Jakarta Sans | 600 |
| Premium / clean | Mobile detailing, med spa, barber, food truck | Sora or Outfit | 600 |

**Locked rule:** No script fonts (illegible at small sizes), no all-caps for wordmarks longer than two words (tracking gets ugly on mobile), no drop shadows.

## Color application

Pull the primary + accent from `clients/<name>/design/design-system.md`. Wordmark always ships in three color variants:

- `wordmark-primary.svg` — primary brand color on transparent
- `wordmark-onlight.svg` — solid dark token (`text-900`) for light backgrounds
- `wordmark-ondark.svg` — solid light token (`text-50`) for dark hero overlays

Never ship gradient wordmarks. Never ship the wordmark on a colored bounding box — let it sit on the page background.

## Favicon + avatar pipeline

Every client kit produces:

- `favicon.svg` (24×24 logical, drawn at 256×256 actual, optimized via SVGO)
- `apple-touch-icon.png` (180×180, transparent or solid brand color)
- `gbp-avatar.png` (1200×1200, square crop of stacked wordmark on solid brand color)
- `og-default.png` (1200×630, wordmark + city tag — e.g., "Cardinals Fencing · Phoenix, AZ")

Matt pulls these from `clients/<name>/design/brand/exports/` during build. Naming is fixed so the dev pipeline does not branch per-client.

## Truck / signage carryover

A real Phoenix small-biz constraint: their truck wrap, yard sign, and shirt embroidery already exist and probably look nothing like a clean wordmark. Do not redesign their truck. The mini-kit lives on screens. If the client asks "will this match my truck?" the honest answer is: it doesn't have to — most customers find you online before they ever see your truck, and this is the version they'll judge you by.

If the client pushes back hard, capture their existing truck logo as a high-res photo, vectorize it cleanly (no auto-trace artifacts), and add it as `truck-mark-legacy.svg`. Use it only on the About page in a "see our trucks around town" context — never as the site's primary mark.

## Anti-patterns (do not ship)

- AI-generated logos (Midjourney, Stable Diffusion, Looka) — always look like a stock badge mashup
- Clip-art trade icons (the wrench-and-pipe combo, the cartoon paw, the smiling sun)
- Logos with a tagline baked into the SVG ("Cardinals Fencing — Quality You Can Trust") — taglines belong in copy, not the mark
- Skewed / stretched type — even if the client's existing JPG looks that way
- Stock badges ("Family Owned Since 2012" wrapped in a circle) — those go in the trust bar, not the logo

## Handoff hook

Add to every `handoff.md`'s Asset Inventory section:

```
- [ ] Brand mini-kit shipped (wordmark-primary, wordmark-onlight, wordmark-ondark, favicon, apple-touch-icon, gbp-avatar, og-default)
- [ ] Client confirmed wordmark direction (one-line approval in comms/)
- [ ] Original client-supplied "logo" (if any) archived in design/brand/legacy/ — never used in build
```

Matt blocks dev start on a green Asset Inventory. The mini-kit guarantees that line is green within 24 hours of kickoff, which is the whole point.
