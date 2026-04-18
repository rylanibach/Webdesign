# Deploy Playbook — Cloudflare Pages + Astro

**Owner:** Matt | **Applies to:** every site we ship | **Companion to:** `astro-starter.md`, `pre-launch-checklist.md`, `seo-local-business.md`

Our default stack terminates at Cloudflare Pages. Fast, free tier handles our traffic, preview URLs per PR, instant rollbacks, and Cloudflare's global edge is already there. This doc is the repeatable flow from first commit to client-owned production domain.

## Why Cloudflare Pages (vs. Vercel / Netlify)
- **Free tier fits us:** unlimited bandwidth, 500 builds/month. A Phoenix small-biz site gets <100k req/mo; we'll never pay.
- **Preview URL per branch:** send clients a link without touching prod.
- **Instant rollback:** one click to re-point production at any prior deployment.
- **Turnstile + Workers live next to Pages:** form spam protection comes for free; we don't bolt on a third-party captcha.
- **Edge logs:** 24h request log for debugging 404s / form submit failures.

## One-time setup (per Cloudflare account)
1. Create Cloudflare account for the agency (if not already).
2. Add a placeholder zone or delegate — we deploy per-client under subdomains during dev, then point client's real domain at launch.
3. Install the `wrangler` CLI locally: `npm i -g wrangler` → `wrangler login`.

## New-client project setup
Run once per client, after Gate 3b is approved and Matt has the worktree:

```bash
# Inside the client worktree
npm create astro@latest -- --template minimal --typescript strict
cd <client-slug>
npx astro add tailwind sitemap

# Git
git init
git add -A
git commit -m "Initial Astro scaffold"

# Push to GitHub (new private repo under agency org)
gh repo create hands-off-design/<client-slug> --private --source=. --push
```

## Wire up Cloudflare Pages

**Option A — Dashboard (first time, visual confirmation):**
1. Cloudflare dashboard → Workers & Pages → Create → Connect to Git
2. Pick the repo → `main` branch
3. Framework preset: Astro
4. Build command: `npm run build`
5. Output directory: `dist`
6. Environment variables: add any client-specific (Formspree endpoint, API keys, etc.)

**Option B — CLI (once you've done it):**
```bash
wrangler pages project create <client-slug> --production-branch main
# In repo: wrangler.toml pointing to project, then git push triggers deploy
```

Preview URL ships automatically: `https://<client-slug>.pages.dev`

## Preview-per-PR workflow
- Every PR gets a preview at `<commit-sha>.<client-slug>.pages.dev`
- Share that URL with the client for sign-off before merging
- **Rule:** never merge to `main` until client has replied "approved" in `clients/<name>/comms/`

## Custom domain cutover (launch day)
This is the irreversible-feeling step. Follow the checklist in `pre-launch-checklist.md` first.

1. **Client still owns the domain.** Don't transfer. We point DNS only.
2. In Cloudflare Pages project → Custom domains → Add `www.clientdomain.com` and `clientdomain.com`
3. Cloudflare gives 2 DNS records (CNAME for www, A/AAAA or CNAME-flattened for apex).
4. **If client's DNS is already on Cloudflare:** add records in their zone. Instant.
5. **If client's DNS is elsewhere (GoDaddy, etc.):** two options:
   - **Recommended:** walk the client through moving DNS to their own Cloudflare account (free), add us as a collaborator. They keep control; we get edge features.
   - **Fallback:** add the records in whatever DNS host they use. Slower edge features, but works.
6. SSL provisions automatically (~5 min). Verify `https://clientdomain.com` resolves before telling the client it's live.
7. Set up 301 redirect from apex → www (or vice versa — pick one and stick to it across HTML canonicals).

## Forms (Formspree + Turnstile)
1. Client creates a Formspree account (or we manage under the agency umbrella — preferred for lean clients).
2. Get the Formspree endpoint → set as env var `PUBLIC_FORMSPREE_ENDPOINT` in Cloudflare Pages.
3. Add Cloudflare Turnstile site key for bot protection → env var `PUBLIC_TURNSTILE_SITE_KEY`.
4. Test from the preview URL, not localhost — Formspree rejects unverified origins.

## Performance budget (enforced per deploy)
We ship to people on 4G in the Phoenix suburbs. Budget is non-negotiable:

| Metric | Budget | How we enforce |
|---|---|---|
| LCP (Largest Contentful Paint) | ≤ 2.0s on 4G | Lighthouse CI on PR |
| CLS | ≤ 0.05 | Lighthouse CI |
| INP | ≤ 200ms | Lighthouse CI |
| Total page weight | ≤ 500KB gzipped (home page) | `astro build` output inspection |
| JS on initial load | ≤ 50KB gzipped | Astro default is tiny; we only blow this with bad islands |
| Hero image | ≤ 150KB, WebP, pre-sized | Astro `<Image>` component |

### Lighthouse CI setup (one-time per repo)
Add `.lighthouserc.json`:
```json
{
  "ci": {
    "collect": { "url": ["http://localhost:4321/"], "numberOfRuns": 3 },
    "assert": {
      "assertions": {
        "categories:performance": ["error", { "minScore": 0.9 }],
        "categories:accessibility": ["error", { "minScore": 0.95 }],
        "categories:seo": ["error", { "minScore": 0.95 }],
        "largest-contentful-paint": ["error", { "maxNumericValue": 2000 }],
        "cumulative-layout-shift": ["error", { "maxNumericValue": 0.05 }]
      }
    }
  }
}
```

GitHub Action in `.github/workflows/lighthouse.yml`:
```yaml
name: Lighthouse CI
on: [pull_request]
jobs:
  lhci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 20 }
      - run: npm ci && npm run build && npx http-server dist -p 4321 &
      - run: npx @lhci/cli autorun
```

PR will fail if any budget is blown. Matt fixes before merging.

## Rollback
If prod breaks post-launch:
1. Cloudflare Pages → Deployments → find last good one → "Rollback to this deployment"
2. DNS doesn't change. Users hit the rolled-back build in seconds.
3. File a git revert or fix-forward in a PR, don't amend on main.

## Post-launch monitoring (week 1)
- **Day 1:** verify forms submit end-to-end (send test from client's own phone, not ours)
- **Day 1:** GSC + Bing Webmaster — submit sitemap
- **Day 3:** Lighthouse score on live domain (edge caching can shift numbers from local)
- **Day 7:** check Cloudflare analytics for 404s, block bad bots if needed

## Client handoff (when we're stepping back)
Give the client:
1. Admin access to their own Cloudflare account (they should always own it, not the agency)
2. GitHub repo access (collaborator or transfer, depending on engagement terms)
3. Formspree login
4. A 1-page "how to update content" doc in `clients/<name>/comms/maintenance-guide.md`

Never keep the client locked to us for DNS or hosting. Our leverage is speed and taste, not platform captivity.
