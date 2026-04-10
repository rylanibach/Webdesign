# Design System — Phoenix Small Business Websites

Reusable design tokens and patterns for client sites. Copy to `clients/<name>/design/design-system.md` and customize per client.

---

## Color Palettes (Starting Points)

Pick one palette per client, then customize the primary color to match their brand.

### Trades (HVAC, Plumbing, Electrical, Landscaping)
| Token | Value | Use |
|---|---|---|
| `primary` | `#1E40AF` (blue-800) | CTAs, nav, headings |
| `primary-light` | `#3B82F6` (blue-500) | Hover states, links |
| `accent` | `#F59E0B` (amber-500) | Badges, highlights, trust signals |
| `surface` | `#F8FAFC` (slate-50) | Page background |
| `surface-alt` | `#FFFFFF` | Card backgrounds |
| `text` | `#1E293B` (slate-800) | Body text |
| `text-muted` | `#64748B` (slate-500) | Captions, secondary text |

### Services (Med Spa, Dental, Salon, Gym)
| Token | Value | Use |
|---|---|---|
| `primary` | `#7C3AED` (violet-600) | CTAs, nav |
| `primary-light` | `#A78BFA` (violet-400) | Hover states |
| `accent` | `#EC4899` (pink-500) | Highlights |
| `surface` | `#FAFAF9` (stone-50) | Background |
| `text` | `#292524` (stone-800) | Body |

### Restaurants / Retail
| Token | Value | Use |
|---|---|---|
| `primary` | `#DC2626` (red-600) | CTAs, nav |
| `primary-light` | `#F87171` (red-400) | Hover |
| `accent` | `#16A34A` (green-600) | Fresh/organic signals |
| `surface` | `#FFFBEB` (amber-50) | Warm background |
| `text` | `#1C1917` (stone-900) | Body |

---

## Typography Scale

| Element | Size (rem) | Weight | Line Height |
|---|---|---|---|
| Hero headline | 2.5 / 3 (mobile/desktop) | 800 | 1.1 |
| Section heading (h2) | 1.875 | 700 | 1.2 |
| Sub-heading (h3) | 1.25 | 600 | 1.3 |
| Body | 1 | 400 | 1.6 |
| Small / caption | 0.875 | 400 | 1.5 |

**Font stack:** `Inter, system-ui, sans-serif` (Google Fonts, swap display). Override per client if they have a brand font.

---

## Spacing Scale

Base unit: `0.25rem` (4px). Use Tailwind spacing utilities.

| Use | Value |
|---|---|
| Section padding (vertical) | `py-16` (4rem) mobile, `py-24` (6rem) desktop |
| Card padding | `p-6` (1.5rem) |
| Content max-width | `max-w-6xl` (72rem) |
| Grid gap | `gap-6` or `gap-8` |

---

## Component Patterns

### Hero
- Full-width, min-height `60vh` on desktop
- Dark overlay on background image (`bg-black/50`)
- Headline + subhead + CTA button centered or left-aligned
- Phone number in top-right corner (sticky header)

### Service Cards
- White card with subtle shadow (`shadow-sm`)
- Icon (Heroicons or Lucide) + title + short description
- Hover: slight lift (`hover:-translate-y-1 hover:shadow-md`)

### Trust Bar
- Horizontal strip below hero or above footer
- Logos/badges: licensed, bonded, insured, BBB, Google rating
- Gray-scale logos for visual consistency

### CTA Band
- Full-width contrasting background (use `primary`)
- Centered: headline + phone + button
- Repeat at bottom of every page

### Testimonial Cards
- Quote in italics, name + city below
- Star rating (filled stars in `accent` color)
- 3-column grid or horizontal scroll on mobile

---

## Responsive Breakpoints

| Name | Width | Notes |
|---|---|---|
| `sm` | 640px | Large phones |
| `md` | 768px | Tablets |
| `lg` | 1024px | Small laptops |
| `xl` | 1280px | Desktop |

Design mobile-first. Test at 320px minimum.

---

## Accessibility Checklist

- [ ] Color contrast: AA minimum (4.5:1 body text, 3:1 large text)
- [ ] Focus indicators on all interactive elements
- [ ] Alt text on every image
- [ ] Semantic HTML: proper heading hierarchy, landmark roles
- [ ] Touch targets: minimum 44x44px
- [ ] Reduced motion: respect `prefers-reduced-motion`
