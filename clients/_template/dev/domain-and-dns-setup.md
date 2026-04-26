# Domain & DNS Setup Playbook — First-Time-Website Clients

**Owner:** Matt | **Used at:** Pre-launch, after Gate 3b approval, before Cloudflare Pages deploy

## The problem this solves

90% of our Gate 2 pipeline is Yelp-only Phoenix small businesses with no website at all. They have never bought a domain, never set up DNS, and have never been the registrant of record on anything. The remaining ~10% have a domain at GoDaddy locked behind a forgotten password or a dead employee's email. **Both cases stall launch by 3–7 days if we don't have a script.** This playbook is the script.

The non-negotiable constraint: **the client owns their domain. Always.** We never register a domain in Hands Off Design's name. If we go away, the client's domain stays with the client. This is a hard rule — see `assets/agency/about.md` for the public version of the same promise.

## Decision tree (run on the kickoff call)

```
Does the client own a working domain today?
├─ NO  → Path A: New registration
├─ YES, can log in → Path B: DNS-only handoff
└─ YES, cannot log in → Path C: Recovery, then B (or A if recovery fails)
```

## Path A — New registration (most common)

Use Cloudflare Registrar. At-cost pricing, free WHOIS privacy, no upsell theater. We do not use GoDaddy, Namecheap, or anyone with renewal-rate games. Reasoning: the client will likely never touch this account again, so the registrar that won't trick them at year 2 is the one they get.

1. Client creates a Cloudflare account in **their** email (not Rylan's, not the agency's). Send them this exact text:

   > "Sign up at cloudflare.com with your business email — same one you check daily. We'll register the domain in your account so you own it forever. We just need 'Read + DNS Edit' access for setup."

2. Client buys the domain through their Cloudflare account. Pricing is published; we don't quote a markup. Typical `.com` is ~$10/yr. Verify they enable auto-renew before moving on. **A lapsed domain is a launch reverted in 24 hours.**

3. Client adds Rylan as a member with the **Domain Administrator (Read)** + **DNS (Edit)** roles only — never Super Administrator. Rylan never holds billing.

4. Verify in the dashboard: registrant contact = client, technical contact = client, Cloudflare's nameservers active by default. Done.

**Time:** 15 min on a screen-share. Bill it as kickoff scope, not a separate line item.

## Path B — DNS-only handoff (existing domain at another registrar)

Client owns the domain elsewhere (GoDaddy, Bluehost, Network Solutions, Squarespace Domains, etc.). We do **not** transfer the registrar. We just point the nameservers at Cloudflare for DNS, then deploy.

Why we don't transfer: registrar transfers are a 5–7 day window where the domain is in limbo, and a botched transfer means weekend-long outages. DNS handoff is a 5-minute change with a 1–24 hour propagation, and it's reversible.

Steps:

1. Client logs into current registrar. Most common registrars have a "Nameservers" or "DNS Settings" page; document the current nameservers in `clients/<name>/dev/dns-snapshot-before.txt` so we have a rollback target.
2. Client adds the domain to their Cloudflare account (Free plan is fine; we don't use Pro features). Cloudflare prompts: "Replace your nameservers with these two." Copy them.
3. Client pastes the two Cloudflare nameservers into the registrar's nameserver field. Saves. Logs out.
4. Wait for propagation. Cloudflare will email the client when the change is verified. Typically 1–4 hours; worst case 24.
5. Once verified, all DNS edits happen in Cloudflare from here on. The registrar is now a renewal-only account.

**Email-DNS warning, mandatory:** If the client uses email at this domain (e.g., `info@theirbiz.com` through Google Workspace, GoDaddy email, Microsoft 365), capture the **MX records, SPF TXT, DKIM CNAME(s), and DMARC TXT** from the old registrar **before changing nameservers**. Recreate them in Cloudflare first, then switch. Skipping this kills their email until you fix it. Email outage on launch day is the worst possible introduction.

Capture command (run from the client's old DNS dashboard, or use `dig`):

```bash
dig +short MX theirbiz.com
dig +short TXT theirbiz.com
dig +short TXT _dmarc.theirbiz.com
dig +short CNAME google._domainkey.theirbiz.com   # if Google Workspace
```

Save output to `clients/<name>/dev/dns-snapshot-before.txt`. Recreate every record in Cloudflare DNS exactly. Verify with `dig +short MX theirbiz.com @1.1.1.1` after switch.

## Path C — Recovery (forgotten access)

Client owns the domain but cannot log in. Common in our pipeline because Phoenix small biz often has a "guy who set it up" who is no longer involved.

1. Identify the registrar. Use `whois theirbiz.com` (terminal) or `lookup.icann.org`. The registrar field tells you who controls the account.
2. WHOIS privacy is fine — we still get the registrar name and the client's *registrant email pattern*, even if the email itself is masked.
3. Have the client try the registrar's password reset flow on every email they've ever used. Document attempts in `clients/<name>/comms/dns-recovery-log.md`.
4. If reset fails: the client calls the registrar directly with proof of business identity (LLC docs, EIN letter, billing card last-4). All major registrars have a manual ownership-recovery process. **Do not** attempt to recover the account on the client's behalf — registrars require the actual business owner on the call.
5. Set a 5-business-day timer. If recovery is not complete in 5 days, switch to Path A with a new domain (e.g., `cardinalsfencingaz.com` instead of `cardinalsfencing.com`) and document the pivot in the kickoff comms thread. **Do not let domain recovery block launch indefinitely.**

## Cloudflare Pages domain wiring (after DNS is in Cloudflare)

In the Cloudflare dashboard, on the Pages project:

1. Custom domains → Set up a custom domain → enter the apex (e.g., `theirbiz.com`).
2. Cloudflare automatically writes the CNAME (or `CNAME flattening` on apex). No manual DNS work needed.
3. Add the `www` subdomain too — set it to redirect to the apex. We standardize on apex-as-canonical.
4. Verify SSL certificate issues automatically (Cloudflare Universal SSL). Wait for green checkmark before announcing launch — typically <10 minutes.
5. Add the `_dmarc` TXT and any missing email records that the client needs (see Path B email warning).

## Subdomains we always add

- `www` → 301 redirect to apex (configured in Pages)
- No `staging.` subdomain in production. Staging lives at `<project>.pages.dev`, which Cloudflare gives free.

## Pre-launch DNS checklist

Add to `pre-launch-checklist.md` cross-reference:

- [ ] Registrar account in client's name + auto-renew on
- [ ] Rylan has Read + DNS Edit access (never billing, never Super Admin)
- [ ] DNS in Cloudflare; old nameserver values archived in `dns-snapshot-before.txt`
- [ ] Email DNS verified working (`dig MX`, `dig TXT`, send a test email through their account)
- [ ] Apex + `www` both resolve to Pages
- [ ] HTTPS green padlock on apex AND `www`
- [ ] HSTS not yet enabled (we wait 1 week post-launch to avoid lock-in if rollback needed)
- [ ] Client confirmed they can still log into their email after switch

## Rollback

If anything is wrong after nameserver switch (email dead, site not resolving, weird redirects):

1. The old nameservers are in `dns-snapshot-before.txt`.
2. At the registrar, paste them back in. Save.
3. Propagation is 1–24 hours back to the prior state.
4. Diagnose without time pressure once email is restored.

We do not blame the client for a DNS issue at launch. We own the timeline; that's what they paid us for.

## Anti-patterns

- Registering the domain under Rylan's Cloudflare account "to make setup easier" — never. Client owns the domain.
- Transferring the registrar at launch — adds a 5–7 day risk window for no benefit.
- Skipping the email DNS snapshot — 100% of email outages on launch day are this.
- Using GoDaddy for new registrations — predatory renewal pricing year 2+.
- Holding registrar billing as the agency — when they leave, they can't renew, and their site dies.

## Time budget

A clean Path A or Path B should take **20–30 minutes of Matt's time on launch week**, plus 15 minutes of client time. Path C can take 1–5 days of *waiting* but only ~20 minutes of active work. If you're spending more than an hour on DNS for a single client, stop and re-read this doc.
