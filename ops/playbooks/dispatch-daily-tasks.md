# Dispatch Daily Tasks

How to hand out today's work to the team from your local `claude` session in `~/web-agency`.

## 1. Fill in `ops/today.md`
Each morning (or the night before), edit `ops/today.md` and assign each teammate a client + task + deliverable + priority. Leave anyone blank if they should continue yesterday's work.

## 2. Dispatch via Kyle
In your local session, run:

> "Kyle, read `ops/today.md` and dispatch each assignment to the right teammate. For each non-blank section, invoke the named teammate with their task via the Task tool, wait for their response, and summarize the outputs back to me."

Kyle will:
1. Parse `ops/today.md`
2. Spawn a subagent call for each filled-in teammate (Stevie, Matt, Emily, Raul)
3. Pass them their client folder path, task, and deliverable
4. Collect results and report back

## 3. Single-teammate dispatch
If you only need one person, skip Kyle and invoke directly:

> "Stevie, draft a hero mockup for `clients/acme-hvac/` — warm/local HVAC vibe, include a clear CTA. Save to `clients/acme-hvac/design/hero-v1.md`."

## 4. End-of-day
After dispatching, append a short log line per teammate to `ops/daily-standup.md`: what they shipped, what's blocked, what carries over. This feeds tomorrow's standup + the Friday weekly review.

## Tips
- Keep tasks scoped to ~1 working session each. Break bigger asks into multiple days.
- Always name the client folder explicitly — teammates can't guess which engagement you mean.
- For cross-team work (e.g., Matt needs Stevie's mockup first), note the dependency in the "Notes / Cross-team" section of `today.md`.
