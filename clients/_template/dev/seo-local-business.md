# Local Business SEO — Astro Snippet Pack

Copy-paste-ready Astro components for the SEO fundamentals every Phoenix small-business site needs. Drop these into `src/components/seo/` on each client build.

**Use with:** `clients/_template/dev/astro-starter.md` for the base scaffold.

---

## 1. `<SEO />` — Page-level meta component

Covers title, description, canonical, Open Graph, Twitter card. One component, every page.

```astro
---
// src/components/seo/SEO.astro
export interface Props {
  title: string;
  description: string;
  image?: string;
  canonical?: string;
  type?: "website" | "article";
}

const {
  title,
  description,
  image = "/og-default.jpg",
  canonical = Astro.url.href,
  type = "website",
} = Astro.props;

const site = Astro.site ?? new URL(canonical);
const ogImage = new URL(image, site).href;
---

<title>{title}</title>
<meta name="description" content={description} />
<link rel="canonical" href={canonical} />

<meta property="og:title" content={title} />
<meta property="og:description" content={description} />
<meta property="og:image" content={ogImage} />
<meta property="og:url" content={canonical} />
<meta property="og:type" content={type} />

<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content={title} />
<meta name="twitter:description" content={description} />
<meta name="twitter:image" content={ogImage} />
```

**Client title pattern:** `<Page> | <Business Name> — <City> <Service>`
Example: `Pool Repair | A's Pool Service — Phoenix Pool Cleaning & Repair`

---

## 2. `<LocalBusinessSchema />` — JSON-LD structured data

Injects Google's expected `LocalBusiness` schema. Pull values from a per-client `src/data/business.ts` so a single edit updates every page.

```astro
---
// src/components/seo/LocalBusinessSchema.astro
export interface Props {
  business: {
    name: string;
    type?: string;              // "HVACBusiness" | "Plumber" | "Electrician" | "LocalBusiness"
    telephone: string;
    url: string;
    streetAddress?: string;
    city: string;               // "Phoenix"
    region?: string;            // "AZ"
    postalCode?: string;
    priceRange?: string;        // "$$"
    areaServed: string[];       // ["Phoenix", "Tempe", "Mesa"]
    image?: string;
    rating?: { value: number; count: number };
    hours?: string[];           // ["Mo-Fr 08:00-17:00"]
  };
}

const { business } = Astro.props;

const schema = {
  "@context": "https://schema.org",
  "@type": business.type ?? "LocalBusiness",
  name: business.name,
  telephone: business.telephone,
  url: business.url,
  ...(business.image && { image: business.image }),
  ...(business.priceRange && { priceRange: business.priceRange }),
  ...(business.streetAddress && {
    address: {
      "@type": "PostalAddress",
      streetAddress: business.streetAddress,
      addressLocality: business.city,
      addressRegion: business.region ?? "AZ",
      postalCode: business.postalCode,
      addressCountry: "US",
    },
  }),
  areaServed: business.areaServed.map((c) => ({ "@type": "City", name: c })),
  ...(business.rating && {
    aggregateRating: {
      "@type": "AggregateRating",
      ratingValue: business.rating.value,
      reviewCount: business.rating.count,
    },
  }),
  ...(business.hours && { openingHours: business.hours }),
};
---

<script type="application/ld+json" set:html={JSON.stringify(schema)} />
```

**Per-client data file:**
```ts
// src/data/business.ts
export const business = {
  name: "A's Pool Service and Repairs",
  type: "LocalBusiness",
  telephone: "+1-602-555-0100",
  url: "https://aspoolservice.com",
  city: "Phoenix",
  region: "AZ",
  priceRange: "$$",
  areaServed: ["Phoenix", "Scottsdale", "Tempe", "Mesa", "Chandler"],
  rating: { value: 5.0, count: 38 },
  hours: ["Mo-Sa 07:00-18:00"],
};
```

---

## 3. `sitemap.xml` + `robots.txt`

Use `@astrojs/sitemap`:

```js
// astro.config.mjs
import sitemap from "@astrojs/sitemap";
export default defineConfig({
  site: "https://example.com",
  integrations: [sitemap()],
});
```

```txt
# public/robots.txt
User-agent: *
Allow: /
Sitemap: https://example.com/sitemap-index.xml
```

---

## 4. GBP / NAP Consistency Rule

Every Phoenix local-business site must have **NAP (Name, Address, Phone)** identical to Google Business Profile — single source in `src/data/business.ts`, rendered in:
- Footer (every page)
- Contact page
- LocalBusiness JSON-LD
- `<meta name="geo.region">` and `<meta name="geo.placename">`

Any drift and Google ranks the GBP listing above the site.

---

## 5. Pre-ship SEO Audit

Before flagging Gate 3b complete, Matt verifies:

- [ ] Each page has unique title + meta description (no templated duplicates)
- [ ] `<h1>` contains primary service + city
- [ ] Schema validates at https://validator.schema.org
- [ ] GBP category matches `schema:type` (e.g., `Plumber` → "Plumber" GBP category)
- [ ] Lighthouse SEO score ≥ 95
- [ ] All service-area cities linked from footer as plain-text anchors

**Owner:** Matt. Update when Google's schema guidance shifts (last reviewed 2026-04-17).
