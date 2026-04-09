#!/bin/bash
# Daily all-hands runner — invoked by launchd at 9:00 AM PT daily.
# Runs claude in headless mode from ~/web-agency with the all-hands prompt.
# Output is logged to ops/logs/all-hands-YYYY-MM-DD.log.

set -u

# Ensure claude and git are on PATH (launchd has a minimal PATH by default)
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"

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
  exit $RC
} 2>&1 | tee -a "$LOG_FILE"
