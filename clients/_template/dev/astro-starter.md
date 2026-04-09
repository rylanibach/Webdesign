# Astro Starter — Dev Scaffold Reference

Default stack for small-business client sites. Copy relevant sections when initializing a new client build.

---

## Stack

| Layer | Choice | Why |
|---|---|---|
| Framework | Astro | Static-first, fast, minimal JS shipped |
| Styling | Tailwind CSS | Utility-first, rapid iteration, small bundle |
| Hosting | Cloudflare Pages | Free tier covers most small-biz traffic, global CDN |
| Forms | Formspree or Cloudflare Turnstile | No backend needed, spam protection included |
| CMS (if needed) | Decap CMS or Sanity (free tier) | Client-editable content without dev involvement |
| Images | Astro `<Image>` + Cloudflare Image Resizing | Auto-optimized, WebP/AVIF, lazy-loaded |

## Init Commands

```bash
npm create astro@latest -- --template minimal clients/<name>/dev/site
cd clients/<name>/dev/site
npx astro add tailwind
npm install
```

## Project Structure

```
src/
  layouts/
    Base.astro          # <html>, <head>, global nav + footer
  pages/
    index.astro         # Home
    services.astro      # Services grid
    contact.astro       # Contact form + map
    404.astro
  components/
    Hero.astro
    ServiceCard.astro
    Testimonial.astro
    CTABand.astro
    Footer.astro
  content/              # MDX or JSON content from Raul
public/
  favicon.svg
  og-image.jpg
```

## Deployment

```bash
# Cloudflare Pages — connect GitHub repo, build command:
npx astro build
# Output dir: dist/
```

## Performance Targets

- Lighthouse: 90+ on all four categories
- LCP < 2.5s, FID < 100ms, CLS < 0.1
- Total page weight < 500 KB (home page)

## Checklist Before Handoff

- [ ] All Raul's copy pulled in (no lorem ipsum)
- [ ] Images optimized and lazy-loaded
- [ ] Contact form tested (submission + spam protection)
- [ ] Mobile responsive at 320px, 768px, 1280px
- [ ] Meta tags, OG image, favicon set
- [ ] Google Analytics / Tag Manager snippet (if client wants)
- [ ] Sitemap and robots.txt generated
- [ ] HTTPS enforced, no mixed content
