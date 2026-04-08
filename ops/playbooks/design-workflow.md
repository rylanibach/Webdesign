# Playbook: Design Workflow

**Owner:** Stevie | **Triggered by:** Kyle after a lead becomes an active client

## Two-stage, approval-gated process

```
Client brief arrives
      │
      ▼
  STAGE 1: Wireframe
  Stevie creates wireframe.md
      │
      ▼
  [GATE 3a — Owner approves direction]
      │
      ▼
  STAGE 2: Full Mockup
  Stevie builds mockup/ + handoff.md
      │
      ▼
  [GATE 3b — Owner approves build]
      │
      ├──────────────────┐
      ▼                  ▼
  Matt builds       Raul writes copy
  (parallel)        (parallel)
      │                  │
      └──────────────────┘
                │
                ▼
          Kyle: pre-launch review
```

---

## Stage 1: Wireframe

**File:** `clients/<name>/design/wireframe.md`

### What to include
- Page list (Home, Services, About, Contact — add others as needed)
- For each page: section order, section name, content type (text, image, form, etc.), CTA placement
- Navigation structure
- Mobile vs desktop differences if significant
- Notes on conversion priority (what should the visitor do first?)

### Format (text-based is fine)
```markdown
# Wireframe — [Business Name]

## Pages
- Home
- Services
- About
- Contact

## Home
1. Nav — logo left, phone number right, "Get a Quote" button
2. Hero — headline, subheadline, [primary CTA button], hero image right
3. Trust bar — 3 icons: licensed, insured, X years in Phoenix
4. Services — 3-column grid, each with icon + name + 1-line description
5. Social proof — 3 Google reviews, star rating, review count
6. About — short paragraph + owner photo
7. Final CTA — "Ready to get started?" + phone + form
8. Footer — nav links, address, phone, license number
```

### Gate 3a queue entry
After completing wireframe, append to `ops/approvals/queue.md`:
```
- [ ] GATE 3a | <Business Name> | Wireframe ready — approve direction | clients/<name>/design/wireframe.md
```

---

## Stage 2: Full Mockup

**Files:** `clients/<name>/design/mockup/` + `clients/<name>/design/handoff.md`

### Mockup files
- `mockup/home.md` or `mockup/home.html` — visual design for each page
- Include: color palette, typography choices, spacing, imagery direction
- Use the appropriate taste skill before starting (`minimalist-skill`, `brutalist-skill`, etc.)

### handoff.md (required for Matt)
```markdown
# Dev Handoff — [Business Name]

## Color tokens
- Primary: #XXXXXX
- Secondary: #XXXXXX
- Text: #XXXXXX
- Background: #XXXXXX

## Type scale
- H1: 48px / 600 weight / [font name]
- H2: 32px / 600 weight
- Body: 16px / 400 weight
- Small: 14px

## Breakpoints
- Mobile: 375px
- Tablet: 768px
- Desktop: 1280px

## Components
- [ ] Nav with mobile hamburger
- [ ] Hero with CTA button
- [ ] Trust bar (3 icons)
- [ ] Services grid (3-col desktop, 1-col mobile)
- [ ] Review cards
- [ ] Contact form
- [ ] Footer

## Assets needed
- Logo (provide file or note "client to supply")
- Hero image (direction: [describe])
- Service icons (style: [describe])
- Owner photo (client to supply)

## Animations / interactions
- Scroll fade-in on trust bar and services grid
- Form validation (inline errors)
```

### Gate 3b queue entry
After completing mockup + handoff.md:
```
- [ ] GATE 3b | <Business Name> | Full mockup + handoff ready — approve to start build | clients/<name>/design/mockup/
```
