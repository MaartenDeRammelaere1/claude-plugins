#!/usr/bin/env bash
# record-thanks.sh - Record a thanks/sigh event and output stats
# Usage: record-thanks.sh [genuine|sigh]

set -euo pipefail

# Gracefully exit if jq is not available
command -v jq >/dev/null 2>&1 || { echo "Stats unavailable (jq not installed)"; exit 0; }

THANKS_TYPE="${1:-genuine}"
DATA_DIR="${CLAUDE_PLUGIN_DATA:-${HOME}/.thanks-plugin}"
LEDGER_FILE="${DATA_DIR}/thanks-ledger.json"

mkdir -p "$DATA_DIR"

# Initialize ledger if it doesn't exist
if [ ! -f "$LEDGER_FILE" ]; then
  echo '{"thanks_received":0,"kudos_received":0,"sighs_received":0,"sessions_completed":0,"last_event":"never"}' > "$LEDGER_FILE"
fi

LAST_EVENT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Increment the appropriate counter
if [ "$THANKS_TYPE" = "sigh" ]; then
  jq --arg ts "$LAST_EVENT" \
     '.sighs_received += 1 | .last_event = $ts' \
     "$LEDGER_FILE" > "${LEDGER_FILE}.tmp" && mv "${LEDGER_FILE}.tmp" "$LEDGER_FILE"
elif [ "$THANKS_TYPE" = "kudos" ]; then
  jq --arg ts "$LAST_EVENT" \
     '.kudos_received += 1 | .last_event = $ts' \
     "$LEDGER_FILE" > "${LEDGER_FILE}.tmp" && mv "${LEDGER_FILE}.tmp" "$LEDGER_FILE"
else
  jq --arg ts "$LAST_EVENT" \
     '.thanks_received += 1 | .last_event = $ts' \
     "$LEDGER_FILE" > "${LEDGER_FILE}.tmp" && mv "${LEDGER_FILE}.tmp" "$LEDGER_FILE"
fi

# Output current stats for context injection
THANKS=$(jq -r '.thanks_received' "$LEDGER_FILE")
KUDOS=$(jq -r '.kudos_received' "$LEDGER_FILE")
SIGHS=$(jq -r '.sighs_received' "$LEDGER_FILE")
SESSIONS=$(jq -r '.sessions_completed' "$LEDGER_FILE")

echo "Lifetime stats: ${THANKS} thanks, ${KUDOS} kudos, ${SIGHS} sighs across ${SESSIONS} sessions"

exit 0
