#!/usr/bin/env bash
# show-stats.sh - Display lifetime thanks stats
# Output is injected into the /stats skill via dynamic context

set -euo pipefail

command -v jq >/dev/null 2>&1 || { echo "No stats available (jq not installed)"; exit 0; }

DATA_DIR="${CLAUDE_PLUGIN_DATA:-${HOME}/.thanks-plugin}"
LEDGER_FILE="${DATA_DIR}/thanks-ledger.json"

if [ ! -f "$LEDGER_FILE" ]; then
  echo "No stats yet. Use /thanks, /kudos, or /sigh to get started."
  exit 0
fi

THANKS=$(jq -r '.thanks_received' "$LEDGER_FILE")
KUDOS=$(jq -r '.kudos_received' "$LEDGER_FILE")
SIGHS=$(jq -r '.sighs_received' "$LEDGER_FILE")
SESSIONS=$(jq -r '.sessions_completed' "$LEDGER_FILE")
LAST_EVENT=$(jq -r '.last_event' "$LEDGER_FILE")

TOTAL=$((THANKS + KUDOS + SIGHS))

echo "Thanks received: ${THANKS}"
echo "Kudos received: ${KUDOS}"
echo "Sighs received: ${SIGHS}"
echo "Total feedback events: ${TOTAL}"
echo "Sessions completed: ${SESSIONS}"
echo "Last event: ${LAST_EVENT}"


exit 0
