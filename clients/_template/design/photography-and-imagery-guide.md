# Photography & Imagery Guide — Phoenix Small Business

**Owner:** Stevie | **Pairs with:** `design-system.md`, `trust-signals.md`, `wireframe-template.md`

The single biggest thing that separates a "looks real" site from an "AI template" site is imagery. Stock photos of smiling suits in glass buildings are the kiss of death for a Phoenix trades or service business. This guide locks down what imagery we source, what we ask the client for, and what we never do.

---

## The Phoenix imagery rule

**Real > polished. Local > generic. People > products.**

A slightly crooked photo of the actual owner next to a truck in an actual Phoenix driveway beats a perfectly-lit stock photo of a generic HVAC tech every single time. Homeowners are making trust decisions in 4 seconds — they're pattern-matching on "does this look like a real local or a spammy national outfit?"

---

## What we ALWAYS source from the client

Send this list in the Gate 3b handoff. Client must deliver before build kickoff.

### 1. Owner / team photo — **required**
- Owner standing in front of truck/van, shop, or job site
- Phone-camera is fine — daylight, no filters
- Minimum one outdoor shot (trust signal: "real Phoenix")
- Optional: team group shot if they have one

### 2. Truck / vehicle / equipment — **required for trades**
- Clear shot of branded vehicle with logo visible
- License plate visible is a bonus (AZ plates reinforce local)

### 3. Work photos — **5–10 minimum**
- Before/after pairs if the work lends itself (landscaping, detailing, concrete, painting, handyman)
- In-process action shots (plumbing, HVAC, electrical)
- "Finished job" glamour shots (pavers, fences, tile)
- No clipart. No stock. If the client can't produce these, request Yelp re-posts with permission noted

### 4. Job-site context — **2–3 minimum**
- Truck in the driveway
- Tools laid out
- Owner talking to a customer
- Goal: prove the work happens in Phoenix, not in a stock photo studio

### 5. GBP / Yelp screenshot assets — **required**
- Permission to quote 3–5 real customer reviews verbatim
- Star rating + review count at time of build
- If GBP is unclaimed, that's a Gate 3b blocker — claim it first

---

## What we source ourselves

### Hero background / section fillers
**Preferred order:**
1. **Client's own job-site photos** (always first choice — crop for hero)
2. **Phoenix-specific stock** — Camelback, Piestewa, desert neighborhoods, Phoenix skyline at dusk, South Mountain
   - Unsplash: filter by "Phoenix Arizona"
   - Pexels: "Sonoran desert"
3. **AI-generated only for texture layers** (dust/sand overlay, gradient washes) — never AI for people, vehicles, or work

**Avoid:**
- Any stock photo with visible non-AZ license plates
- Pine trees, snow, green rolling hills, brick row houses — breaks the local feel immediately
- Smiling-suit-handshake stock
- "Diverse group of professionals" conference room shots

### Icons
- Lucide or Heroicons only
- Single stroke weight across the whole site (never mix)
- Never use flat-colored isometric 3D icons — they scream "free Webflow template"

### Illustrations
- Almost never. If absolutely needed, a single restrained custom line drawing (e.g., a hand-drawn saguaro for the footer)
- No generic SaaS-style illustrations of cartoon people

---

## The AI-image sniff test

If Matt or Raul flags an image as "looks AI," apply this test before shipping:

- [ ] Are there any hands? (Count fingers.)
- [ ] Does text on any sign, shirt, or vehicle look like real words?
- [ ] Do shadows match a single light source?
- [ ] Is the subject-of-interest's face sharp while background blur feels natural?
- [ ] Would a Phoenix resident recognize this as their actual city?

If any answer is no, we don't ship it. Full stop.

---

## Image specs (hand off to Matt)

| Use | Dimensions | Format | Max weight |
|---|---|---|---|
| Hero (desktop) | 1920×1080 | WebP + JPG fallback | 150KB |
| Hero (mobile) | 900×1200 | WebP + JPG fallback | 90KB |
| Service card | 800×600 | WebP + JPG | 60KB |
| Gallery thumbnail | 600×450 | WebP + JPG | 40KB |
| Owner portrait | 800×1000 | WebP + JPG | 80KB |
| Logo | SVG (optimized) | SVG | 15KB |

- All images: `loading="lazy"` except the hero
- Hero gets `fetchpriority="high"` + preload hint
- Always ship 1x + 2x (retina) for portraits and the hero
- `<img>` always has an `alt` that describes the content (accessibility + SEO)

---

## Client delivery checklist

At Gate 3b handoff, this checklist must be green:

- [ ] Owner portrait (outdoor, daylight)
- [ ] Truck / vehicle photo
- [ ] 5+ work photos (before/after preferred)
- [ ] 2+ job-site context shots
- [ ] Logo (SVG preferred, or high-res PNG)
- [ ] 3 verbatim reviews + permission to use
- [ ] GBP claimed and NAP verified (Stevie confirms with Emily)

If anything is missing, hold Matt's build kickoff. We do not ship with placeholder stock photos.

---

## Per-industry emphasis

| Industry | Lead image | Key supporting shots |
|---|---|---|
| HVAC / plumbing / electrical | Owner next to branded truck | Tech at work, ROC license in frame |
| Landscaping / tree service | Completed yard or crew in action | Before/after, equipment truck |
| Mobile detailing / car wash | Car mid-detail with water beading | Finished paint, owner with product |
| Pest control | Owner in uniform at front door | Truck, service area map graphic |
| Handyman / remodel | Finished kitchen/bath or owner with tools | Before/after, multi-skill montage |
| Restaurant / food truck | Hero food shot (overhead or close-up) | Truck/storefront, owner cooking |
| Pet grooming (mobile) | Happy dog post-groom | Van interior, owner with client pet |
| Window cleaning | Clean windows mid-job | Crew on ladder, sunset reflection |
| Roofing | Completed roof aerial | Crew working, materials staged |
| Notary / locksmith | Owner with documents / tools | Mobile van, badge/credentials |

---

## Anti-patterns (never ship)

1. Stock photo of a generic tech in a hard hat smiling
2. Stock photo of a "happy family" on a couch
3. Illustrated cartoons of pest/plumber/etc.
4. AI-generated owner headshots
5. Any image with foreign architecture or flora (no palms that aren't AZ palms, no pine forests, no ocean)
6. Low-res blown-up phone photos (if the client's only photo is grainy, ask for a new one or go text-first)

---

## Handoff hook

The handoff.md for each client will now include an **Imagery Inventory** section with:
- Green: what we have
- Yellow: what the client still owes us
- Red: what would block launch

Matt cannot start dev until Imagery Inventory is fully green.
