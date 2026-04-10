# Demo Landscaping Templates — Sonoran Green Landscape Co.

Three mockup websites built around the same fictional Phoenix landscaping business, each showing what the client gets at each pricing tier. Open any of these in a browser (double-click the `.html` file) to see the live demo.

## Files

| Tier | File | What it shows |
|---|---|---|
| 🌱 Starter | `starter.html` | 1-page landing. Clean, minimal, gets the job done. |
| 🌳 Growth | `growth.html` | Multi-section site with gallery, testimonials, map, more polish. |
| 🌲 Premium | `premium.html` | Fully-featured with animations, portfolio filter, booking form, blog preview. |

## Fictional business details (consistent across all 3 demos)

- **Name**: Sonoran Green Landscape Co.
- **Location**: Phoenix, AZ (serving the East Valley)
- **Tagline**: "Desert landscaping done right."
- **Services**: Xeriscaping, lawn care, tree trimming, irrigation, paver installation
- **Phone**: (602) 555-0142
- **Email**: hello@sonorangreen.example
- **Est.**: 2014

## How to show these to prospects

**Option 1 — Live preview in their browser:**
1. Open the `.html` file locally in Chrome/Safari
2. Share your screen during a call
3. Walk through what's in Starter, what's added in Growth, what's in Premium

**Option 2 — Host them on Cloudflare Pages (free):**
1. `cd` into this folder
2. `wrangler pages deploy .` (requires Cloudflare account)
3. Share the public URLs

**Option 3 — Send as attachments:**
- HTML files are self-contained, they'll open in any browser

## Image credits

All images are sourced from Unsplash via public direct URLs. They load remotely so the files stay small. If any image fails to load on a prospect call, it's probably because:
- The prospect is offline
- Unsplash is having a bad day
- The photo was removed

Replace the `<img src="...">` URLs with your own photos (or stock from Pexels/Unsplash) before using these in a real pitch.

## Customizing for a specific prospect

To adapt these demos for a real prospect during a call:
1. Find/replace `Sonoran Green Landscape Co.` with their business name
2. Find/replace the services (xeriscaping, lawn care, etc.) with theirs
3. Find/replace the phone number and email
4. Swap the hero image to match their industry (we have a small stock library in `assets/stock-photos/` — or just search Unsplash)

For a real client build, Matt will clone `clients/_template/dev/` instead — these mockups are for **sales demos**, not production.
