# Analytics & Privacy Playbook

**Owner:** Matt | **Pairs with:** `deploy-cloudflare-pages.md`, `seo-local-business.md`, `pre-launch-checklist.md`

Our default stance: **privacy-first, no cookies, minimal JS, no GDPR banner theater**. Phoenix small-biz clients don't need GA4 and they definitely don't need the cookie popup that tanks their Lighthouse score and pisses off every visitor. This playbook codifies that.

---

## The default stack

| Need | Our default | Alternative | Never |
|---|---|---|---|
| Analytics | Plausible (self-hosted or cloud) | Fathom, Umami | Google Analytics |
| Cookie banner | **None** (we don't set cookies) | — | CookieBot / OneTrust |
| Privacy policy | Custom 1-pager (template below) | — | Generator SaaS with tracking of its own |
| Terms of service | Only if client sells online | — | Boilerplate TOS if not needed |
| Tag manager | **None** | — | GTM |

**Why Plausible over GA4:**
- No cookies → no banner needed under AZ/CA law
- ~1KB script vs. 45KB for GA4
- Simple dashboard the client can actually read
- Costs ~$9/mo at client's traffic — we bundle in the care plan

---

## Plausible setup

### 1. Account & site
- Client signs up for Plausible cloud at plausible.io (not us — they own their data)
- Add `<domain>.com` as a site
- Grant Matt view access during build; revoke at handoff

### 2. Script install (Astro)

`src/layouts/Base.astro`:

```astro
---
const isProd = import.meta.env.PROD;
---
<head>
  <!-- ... -->
  {isProd && (
    <script
      is:inline
      defer
      data-domain={Astro.site?.hostname}
      src="https://plausible.io/js/script.outbound-links.tagged-events.js"
    ></script>
  )}
</head>
```

Only loads in production; dev traffic doesn't pollute stats.

### 3. Events we tag (every client)

| Event | Trigger | Where |
|---|---|---|
| `Phone Click` | tap-to-call link | Every phone CTA |
| `Email Click` | mailto link | Contact section |
| `Form Submit` | successful contact form | Formspree callback |
| `Quote Request` | quote CTA click | Sticky header + hero |
| `Outbound: GBP` | Google reviews link click | Testimonials / footer |

Add `class="plausible-event-name=Phone+Click"` to any trackable element. Zero JS beyond that.

### 4. Goals (client-facing dashboard)
- Set up each event as a Plausible goal
- Client sees "You had 47 phone clicks this week" — not a pivot table of pageviews

---

## When we DO need GA4

Only when:
- Client runs Google Ads and needs conversion import
- Client's brand agency mandates it
- Client has an existing GA property they want to keep

In that case:
- Install **alongside** Plausible (not instead)
- Use GA4 with consent mode v2 and cookieless pings as default
- Still no cookie banner — just document on privacy page

---

## Privacy policy — template

Drop this into `src/pages/privacy.astro`. 90% of clients need nothing more.

```markdown
# Privacy Policy

**Last updated:** [DATE]

[BUSINESS NAME] ("we," "us") operates [DOMAIN].

## What we collect

When you fill out our contact form, we collect your name, phone number, email address, and any details you share about your project. We use this only to contact you about your inquiry.

## What we don't collect

We do not use tracking cookies. We do not sell or share your data. We do not run retargeting ads. We do not have a Facebook pixel.

## Analytics

We use Plausible Analytics to measure site traffic. Plausible is privacy-focused — it does not use cookies, does not collect personal data, and does not track you across sites. Only aggregate numbers (pageviews, referrers, countries) are collected.

## Third-party services

- **Contact form:** submissions are processed by Formspree (formspree.io). Their privacy policy applies.
- **Spam protection:** we use Cloudflare Turnstile, which does not use tracking cookies.
- **Hosting:** this site is hosted on Cloudflare Pages.

## Your rights

Email us at [CONTACT EMAIL] and we'll delete any information we have about you within 7 days.

## Contact

[BUSINESS NAME]
[PHONE]
[EMAIL]
[CITY, AZ]
```

Raul rewrites to match voice on a per-client basis; Matt doesn't ship this raw.

---

## Cookie banner: when to add one

**Never — unless:**
- Client demands GA4 (see above) AND has EU traffic
- Client runs Meta Pixel / retargeting ads

If forced: use a text-only footer disclosure, not a blocking modal. A modal is ~180KB + wrecks LCP. If legal insists on a blocking consent UI, flag to Kyle as a scope change.

---

## Turnstile + Formspree (spam protection)

Already covered in `deploy-cloudflare-pages.md`. Summary:
- Turnstile invisible challenge, site key in `.env`
- Formspree honeypot + Turnstile token validation
- No reCAPTCHA (Google cookies, 400KB JS, privacy mess)

---

## Client handoff checklist

At launch:
- [ ] Plausible account in client's name, Matt has edit, owner has owner role
- [ ] All 5 default events fire (verified via browser devtools network tab)
- [ ] Plausible dashboard link + login saved in `clients/<name>/comms/credentials.md` (password in 1Password, never git)
- [ ] Privacy page live at `/privacy` and linked from footer
- [ ] No cookies set by the site (verify with `document.cookie` in prod — should return `""`)
- [ ] Lighthouse Privacy + Best Practices both 100

---

## Monthly check-in hook

Part of the care plan:
1. Pull top 5 events + pageviews from Plausible
2. Flag if phone clicks dropped >30% month-over-month
3. Flag if form spam spikes (>5/week) — tune Turnstile if so
4. Email client a 3-bullet report (Raul writes the copy template)

This is the "we pay attention after launch" moat that separates us from a one-and-done Wix freelancer.
