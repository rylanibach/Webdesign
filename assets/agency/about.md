# Hands Off Design — About Page Copy

Web-page copy for `handsoffdesign.com/about`. Lives here in `assets/agency/` because we eat our own cooking — same page structure as `assets/about-page-copy-template.md` prescribes for clients. If a rule in the template doesn't apply to us, the template is wrong; fix it there.

Voice per `assets/voice-and-copy-guide.md`: direct, Phoenix-local, plainspoken. No founder hero mythology. No "passionate team of innovators."

---

## Hero

**Headline (H1):**
Built for Phoenix small businesses — nothing else.

**Subhead (1 sentence, 18–22 words):**
Hands Off Design builds websites for landscapers, mobile mechanics, handymen, taquerias, and everyone else keeping the Valley running — lean sites that load fast, read clear, and turn phone-scrollers into phone calls.

**Hero visual brief (for Stevie):**
Wide shot, desert-morning light. Phoenix-recognizable backdrop (Camelback or South Mountain silhouette) out of focus; foreground is a laptop open on a small-business site with a real AZ business name visible. No stock handshake, no AI people, no metaphor-laptop. Must be shot in the Valley.

---

## Section 2 — Why we exist

**Section heading (H2):**
Most "small-business websites" aren't built for small business.

**Body (3 short paragraphs, 140 words total):**

Every Phoenix business has the same story about their last website. It was a template that looked nothing like them. It was built by someone who ghosted after launch. It charged $200 a month forever to sit there and do nothing. Or it was never built at all — just a Yelp listing they keep meaning to replace.

We started Hands Off Design because that shouldn't be the default. A fencing crew in Maryvale deserves the same fast, honest, readable website as a chain that spends six figures on Squarespace. The work is the same. The tools are the same. The price should be close to the same.

So we built this agency around four rules: fixed scope, fixed price, real humans, no lock-in. You own everything we build. You can walk away with it anytime.

---

## Section 3 — How we work

**Section heading (H2):**
Four gates, no surprises.

**Body (intro, 30 words):**
Every project moves through a three-gate approval process. You never get billed for work you didn't approve. You never see a "final" that blindsides you. Here's what that looks like:

**Gate list (4 cards, each 20–30 words):**

- **Gate 1 — Lead & scope.**
  You and us agree on what's getting built and what it costs. One page or five. One photoshoot or none. Signed proposal before anyone touches Figma.

- **Gate 2 — Wireframe.**
  Stevie sends a plain wireframe — structure only, no color, no polish. You approve the direction before we invest real design time. Two hours of your attention saves a week of rework.

- **Gate 3a — Mockup.**
  Full visual design with your real content. You see exactly what launches. Two rounds of revisions included in every package.

- **Gate 3b — Launch review.**
  Before we push live: phone-click test, form test, Lighthouse score, mobile sunlight test. You walk through with Kyle. When you say go, we go.

---

## Section 4 — The team

**Section heading (H2):**
Five people. That's it.

**Body intro (20 words):**
Hands Off Design is run by one human (Rylan) plus four specialized agents that handle the rest of the work:

**Team cards (5 cards — keep bios under 35 words each, no fake humility, no "passionate about" filler):**

- **Rylan — Founder & owner.** Based in Phoenix. Ran marketing for local trades before starting Hands Off. Owns every client relationship personally — when you email, it lands in my inbox.

- **Kyle — Project manager.** Runs timelines, gates, and client check-ins. Makes sure nothing ships that you haven't seen and approved. The reason your inbox doesn't fill with status update requests.

- **Stevie — Designer.** Handles wireframes and mockups. Builds to a real style guide per industry (trades look different from food trucks) — no cookie-cutter template feel.

- **Matt — Developer.** Writes the code. Stack is Astro + Tailwind on Cloudflare Pages — fast, cheap, and future-proof. You can walk away with the code and host it yourself any day.

- **Raul — Copywriter.** Writes the words. Phoenix-local voice, no marketing buzzwords, specific numbers wherever possible. If copy on your site sounds like your actual business, that's Raul.

---

## Section 5 — Proof

**Section heading (H2):**
Recent work.

**Body intro (15 words):**
Live Phoenix-area sites we built. Click through — we're proud of these:

**Proof cards (dynamic, pulls from pipeline):**
- Show the 3 most-recent "Active" or "Won" client names, industries, and a live link.
- Under each: a one-line result we can prove ("Phone calls 7/mo → 34/mo in first 60 days"). Never a fabricated stat — if we don't have a real number, show a client testimonial instead.
- If pipeline has no Active/Won clients yet, this section swaps to:
  > **Section heading:** Our own site, built by us.
  > **Body:** You're on it. Same tools, same process, same stack. Every page loads in under 2 seconds. If our site can't prove the pitch, your site can't either.

---

## Section 6 — FAQ

**Section heading (H2):**
Common questions.

**Body:** Pull 6 questions from `assets/faq-copy-template.md` universal bank + these 3 agency-specific:

- **What happens to my site if Hands Off Design disappears?**
  You keep it. The domain is registered in your name (we never register a client domain to ourselves). The code lives in a GitHub repo we transfer to you at launch. Hosting is Cloudflare Pages — you can stay there for free forever or move it. There's nothing for us to hold hostage because we don't hold anything.

- **Do you use AI to build sites?**
  Yes, we use AI to move faster — wireframe iteration, copy drafts, image sourcing, QA scripts. But the design decisions, the client calls, the code review before launch — that's us. Speed from AI, accountability from humans.

- **What if I just need a small fix, not a new site?**
  We do care-plan work ($125/mo covers 1 hour/mo of small fixes). Reach out even if you're not ready for a rebuild — we'd rather fix your existing site than sell you a new one you don't need.

---

## Section 7 — Bottom CTA

**Section heading (H2):**
Let's see if we're a fit.

**Body (25 words):**
Free 15-minute call. We'll look at your current site (or lack of one), tell you honestly what we'd build, and send a fixed-price proposal within 48 hours.

**Primary CTA button:** "Book a free call" → Calendly link
**Secondary (text link):** "Or email Rylan directly: rylan@handsoffdesign.com"

---

## Section 8 — Footer (same as every other page)

NAP (Phoenix AZ), hours, phone, email, socials, ROC # (once we have one), links to Pricing, FAQ, Work.

---

## Image list for Stevie

1. Hero — Phoenix laptop shot, morning light (see hero brief above).
2. Section 3 — minimalist 4-icon row for the gate process (wireframe, sketch, mockup, rocket).
3. Section 4 — 5 team portraits, consistent desert-outdoor backdrop, no studio shots.
4. Section 5 — screenshot of 3 live client sites, rendered on a phone frame (not flat desktop).

## JSON-LD for Matt

`Organization` schema, plus `Person` schema on each team card (for me at least — agents get "Role" labels but no Person schema).

---

## Anti-patterns we're not shipping

Strike if Raul drafts these by reflex:
- "Passionate about helping businesses succeed online" — say what we actually do.
- "Our journey began when..." — no one cares.
- "A full-service digital agency" — we're not. We do websites for Phoenix SMBs.
- "Award-winning" — we have no awards yet, don't lie.
- "Trusted by hundreds of businesses" — we've shipped zero. Don't invent history.

---

## Word budget

About page total: **~550 words**. Template rule is under 800; we're well under. If this page creeps over 700 during revision, cut the founder-exists-because backstory, not the how-we-work grid.
