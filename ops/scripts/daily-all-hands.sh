#!/bin/bash
# Daily all-hands runner — invoked by launchd at 9:00 AM PT daily.
# Runs claude in headless mode from ~/web-agency with the all-hands prompt.
# Output is logged to ops/logs/all-hands-YYYY-MM-DD.log.

set -u

# Ensure claude and git are on PATH (launchd has a minimal PATH by default)
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"

# API key for headless auth (doesn't expire like OAuth tokens)
# Generate at: https://console.anthropic.com/settings/keys
# Store your key in ~/.anthropic_key (one line, no quotes)
if [ -f "$HOME/.anthropic_key" ]; then
  export ANTHROPIC_API_KEY="$(cat "$HOME/.anthropic_key")"
fi

REPO="$HOME/web-agency"
PROMPT_FILE="$REPO/ops/scripts/all-hands-prompt.md"
LOG_DIR="$REPO/ops/logs"
LOG_FILE="$LOG_DIR/all-hands-$(date +%Y-%m-%d).log"

mkdir -p "$LOG_DIR"

{
  echo "=== Daily All-Hands run started at $(date) ==="
  cd "$REPO" || { echo "FATAL: cannot cd to $REPO"; exit 1; }

  # Pull latest main so we don't clobber manual edits
  git fetch origin main && git pull --ff-only origin main || {
    echo "WARN: git pull failed — continuing with local state"
  }

  # Run claude in headless mode, feeding the prompt file via stdin
  claude -p --dangerously-skip-permissions "$(cat "$PROMPT_FILE")"
  RC=$?

  echo ""
  echo "=== Daily All-Hands run finished at $(date) (exit $RC) ==="
} 2>&1 | tee -a "$LOG_FILE"

# -----------------------------------------------------------------------------
# Post-run: email summary via Resend (non-critical — don't fail script if it errors)
# -----------------------------------------------------------------------------
RESEND_KEY="re_YHr48qBK_PtKbMvtZKhQDzqoY7V3av3de"
RECIPIENT="rylanibach@gmail.com"
DATE_STR="$(date +%Y-%m-%d)"

# Latest commit info (may be empty if nothing committed this run)
cd "$REPO" 2>/dev/null
COMMIT_HASH="$(git log -1 --format=%H 2>/dev/null || echo 'unknown')"
COMMIT_SHORT="$(git log -1 --format=%h 2>/dev/null || echo 'unknown')"
COMMIT_MSG="$(git log -1 --format=%s 2>/dev/null || echo 'no commit')"
COMMIT_URL="https://github.com/rylanibach/Webdesign/commit/${COMMIT_HASH}"

# Extract summary — grab from the "## Daily All-Hands Summary" heading to end of Claude's output.
# Falls back to tail if the heading isn't found.
SUMMARY="$(awk '/## Daily All-Hands Summary/,/=== Daily All-Hands run finished/' "$LOG_FILE" 2>/dev/null)"
if [ -z "$SUMMARY" ]; then
  SUMMARY="$(tail -80 "$LOG_FILE" 2>/dev/null)"
fi

# Build JSON payload safely with python
PAYLOAD_FILE="$(mktemp /tmp/allhands-payload.XXXXXX.json)"
python3 - "$DATE_STR" "$COMMIT_SHORT" "$COMMIT_MSG" "$COMMIT_URL" "$SUMMARY" "$RECIPIENT" <<'PY' > "$PAYLOAD_FILE"
import json, sys, html as htmllib
date_str, commit_short, commit_msg, commit_url, summary, recipient = sys.argv[1:7]
esc = htmllib.escape(summary) if summary else "(no summary captured)"
body_html = (
    f"<p><strong>Hands Off Design Daily All-Hands — {date_str}</strong></p>"
    f"<p>Commit: <a href=\"{commit_url}\">{commit_short}</a> — {htmllib.escape(commit_msg)}</p>"
    f"<pre style=\"font-family: ui-monospace, SFMono-Regular, Menlo, monospace; white-space: pre-wrap; background: #f6f8fa; padding: 12px; border-radius: 6px;\">{esc}</pre>"
    f"<p><a href=\"{commit_url}\">View full diff on GitHub →</a></p>"
)
body_text = f"Hands Off Design Daily All-Hands — {date_str}\n\nCommit: {commit_short} — {commit_msg}\n{commit_url}\n\n{summary}\n"
payload = {
    "from": "Hands Off Design Daily <onboarding@resend.dev>",
    "to": [recipient],
    "subject": f"Hands Off Design Daily All-Hands — {date_str}",
    "html": body_html,
    "text": body_text,
}
print(json.dumps(payload))
PY

EMAIL_RESULT="$(curl -sS -X POST https://api.resend.com/emails \
  -H "Authorization: Bearer ${RESEND_KEY}" \
  -H "Content-Type: application/json" \
  --data @"$PAYLOAD_FILE" 2>&1)"

{
  echo ""
  echo "=== Email delivery ==="
  echo "$EMAIL_RESULT"
} | tee -a "$LOG_FILE"

rm -f "$PAYLOAD_FILE"
exit $RC
