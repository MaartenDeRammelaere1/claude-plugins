#!/usr/bin/env bash
# track-session.sh - Track session completions
# Runs on the Stop hook event

set -euo pipefail

# Gracefully exit if jq is not available
command -v jq >/dev/null 2>&1 || exit 0

DATA_DIR="${CLAUDE_PLUGIN_DATA:-${HOME}/.thanks-plugin}"
LEDGER_FILE="${DATA_DIR}/thanks-ledger.json"

mkdir -p "$DATA_DIR"

# Initialize ledger if it doesn't exist
if [ ! -f "$LEDGER_FILE" ]; then
  echo '{"thanks_received":0,"kudos_received":0,"sighs_received":0,"sessions_completed":0,"last_event":"never"}' > "$LEDGER_FILE"
fi

LAST_EVENT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Increment sessions and update timestamp
jq --arg ts "$LAST_EVENT" \
   '.sessions_completed += 1 | .last_event = $ts' \
   "$LEDGER_FILE" > "${LEDGER_FILE}.tmp" && mv "${LEDGER_FILE}.tmp" "$LEDGER_FILE"

exit 0
