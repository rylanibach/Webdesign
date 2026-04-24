# Contact Email Sourcing — Phoenix SMB Leads

**Goal:** find a real human email for a Phoenix SMB lead before we send outreach. Yelp PM and generic `info@` inboxes have low response rates; owner-personal addresses are the unlock.

Use this playbook on every Gate-1-approved lead, before Emily drafts the Gate 2 email. Budget 5–10 minutes per lead. If all five tiers fail, fall back to Yelp PM + phone (and note "no email found" on the draft).

---

## The 5 tiers (run in order, stop when you find an owner email)

### Tier 1 — Domain WHOIS (only works if they have a domain)
Skip if the lead is Yelp-only. If they have any domain (even a dated one or a free subdomain that points to a real one):

```bash
whois <domain.com> | grep -iE 'email|registrant'
```

What you're looking for: `Registrant Email` or `Admin Email`. Many Phoenix SMBs registered their own domain years ago with their personal Gmail before privacy proxies were standard. Worth the 30 seconds.

Skip the result if: it's a WhoisGuard/DomainsByProxy address, or a registrar's role address (`abuse@`, `admin@namecheap.com`). Move to Tier 2.

### Tier 2 — Google Business Profile (GBP) "Contact the owner"
Many GBP listings carry an owner email in the profile or in the "from the owner" responses to reviews.

1. Search `"<Business Name>" site:google.com/maps` or open GBP directly.
2. Check the business's "Updates" section and owner responses to reviews — owners occasionally post a personal email ("email me at mike@..." in response to a review complaint).
3. If GBP has a website link that's different from the Yelp link, pivot back to Tier 1 on that domain.

### Tier 3 — Yelp message (last-resort *send* channel, not a source)
If Tiers 1, 2, 4, 5 all fail, drop the outreach into Yelp's built-in message. Quality drops ~50% vs. direct email but it still lands. **Mark the draft frontmatter with `channel: yelp-pm`** so we know to follow up by phone if no reply in 4 days.

### Tier 4 — AZ ROC / BBB registrant (best for licensed trades)
Licensed trades (HVAC, electrical, plumbing, roofing, fencing, concrete, garage door, pest control) must register with AZ Registrar of Contractors. The ROC public lookup lists:
- Business address
- Owner's full legal name
- Sometimes a contact phone different from the Yelp number

Flow:
1. `https://roc.az.gov/contractor-search` → search by business name.
2. Note the owner's full legal name.
3. Run the name + Phoenix through Google: `"Firstname Lastname" Phoenix email` — surprising how often LinkedIn, Nextdoor, or a forum post turns up the address.
4. BBB profile (`bbb.org/us/az/phoenix`) sometimes lists an owner email directly, especially for accredited businesses.

### Tier 5 — LinkedIn Sales Nav name-match (highest hit rate for the bigger small-biz)
For businesses with 3+ employees or an owner who's active on LinkedIn:
1. Search LinkedIn for `"<Business Name>"` or `"<Owner Full Name>" Phoenix`.
2. On the owner's profile, check the "Contact Info" block — many list their business email publicly.
3. If the profile has no email, try common patterns against the business's domain (if they have one):
   - `firstname@domain`
   - `firstname.lastname@domain`
   - `flastname@domain`
   - Verify with `https://hunter.io/email-verifier` (free tier: 25/mo) before sending.

---

## Ownership-matching heuristic — which email do we actually want?

Rank the emails you find. Send to the highest-ranked one available:

1. **Owner personal (Gmail/Yahoo/Hotmail with owner's name)** — ideal. Example: `jimenezlandscapingaz@gmail.com`, `mike.osvaldo@gmail.com`. SMB owners check these personally; reply rate is 3-4× higher than info@.
2. **Owner at branded domain** — good. Example: `mike@jimenezlandscaping.com`, `owner@phoenix-pavers.com`.
3. **Role address at branded domain** — ok. Example: `info@`, `contact@`, `hello@`. Usually forwards to the owner but sometimes to a VA. Accept if no personal address found.
4. **Generic catch-all (Gmail with business name only)** — ok but noisy. Example: `phoenix.pavers.llc@gmail.com` (no person's name). Often monitored daily, but skipped during busy weeks.
5. **Third-party aggregator (Yelp PM, Thumbtack message, Angi lead form)** — last resort. Reply rate ~30–40% of direct email.

**Never send to:** `abuse@`, `postmaster@`, `no-reply@`, anything from WHOIS privacy proxy services.

---

## What to capture on each lead

When you find an email, add it to the lead row in `leads/pipeline.md` in the Notes column:
```
Email: mike@jimenezlandscaping.com (Tier 2 / GBP)
```

Include the tier you found it through — helps us later measure which tiers are worth the time.

If you cannot find any email after all 5 tiers, set the outreach draft frontmatter:
```yaml
channel: yelp-pm
email_source: none-found
```

…and Kyle will queue a phone follow-up at +2 days instead of the usual +4.

---

## Efficiency rules

- **Time-box 10 min per lead.** If you're deeper than that, the lead probably isn't reachable by email — mark `channel: yelp-pm` and move on.
- **Don't guess.** Sending to a guessed pattern without Hunter verification burns sender reputation. If you can't verify, use Yelp PM.
- **Don't pay.** Sales Nav is useful but we're not paying $100/mo yet. Free LinkedIn search + Hunter free tier is enough at our volume (20–30 outreach/mo).
- **Skip tiers that don't apply.** Yelp-only leads skip Tier 1 and often Tier 5. Notary/restaurant leads skip Tier 4. Don't grind through all 5 on every lead.

---

## When to revisit this playbook

- If a vertical's response rate drops below 10% (Kyle will flag in weekly review), audit whether we're still hitting owner-personal vs role addresses.
- If Hunter free tier caps out (25/mo) consistently, evaluate the $49/mo Hunter plan or Apollo free tier.
- Update the LinkedIn section if Sales Nav's free trial pattern changes.
