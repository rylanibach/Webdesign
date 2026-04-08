# Playbook: Lead Discovery

**Owner:** Emily | **Runs:** 08:45 PT daily

## Goal
Find Phoenix-area small businesses with weak or missing websites and add qualified ones to the pipeline for owner approval.

## Search strategy

### Queries to run (rotate daily)
Emily uses `WebSearch` with queries like:
- `"HVAC company" "Phoenix AZ" -site:yelp.com` → check each result's website
- `"plumber" "Tempe AZ" site:google.com/maps`
- `"restaurant" "Mesa AZ" no website`
- `"auto repair" "Chandler AZ"` → look for outdated sites
- `"med spa" "Scottsdale AZ"` → check mobile-friendliness

### Industries to rotate through
1. HVAC / heating & cooling
2. Plumbing
3. Electrical
4. Landscaping / lawn care
5. Pool service
6. Dentists / orthodontists
7. Med spas / aesthetics
8. Auto repair / detailing
9. Gyms / personal training
10. Restaurants / food trucks
11. Cleaning services
12. Pest control

### Cities to rotate through
Phoenix, Scottsdale, Tempe, Mesa, Chandler, Gilbert, Glendale, Peoria, Surprise, Avondale

## Scoring rubric

| Score | Criteria |
|-------|----------|
| **High** | No website at all, or 404/error when you visit it |
| **High** | Site loads but is completely non-mobile (desktop-only, tiny text on phone) |
| **Medium** | Site is mobile but looks like it was built in 2010–2015 |
| **Medium** | No Google Business Profile, or GBP not linked to a website |
| **Low** | Decent site but zero SEO — not ranking for obvious local terms |
| **Skip** | Modern site with good mobile + good GBP — not a fit right now |

## Adding to pipeline
For each High or Medium lead, add a row to `leads/pipeline.md`:
```
| <Business Name> | <City> | <Industry> | <Site issue> | New | Emily | <today's date> | <score: High/Medium> |
```

## Queuing for approval
For each **High** lead added, append to `ops/approvals/queue.md` under Gate 1:
```
- [ ] GATE 1 | <Business Name> | <City> | <Issue: no site / broken / non-mobile> | leads/pipeline.md
```

Limit: queue no more than 3 new Gate 1 items per day to avoid overwhelming the owner.
