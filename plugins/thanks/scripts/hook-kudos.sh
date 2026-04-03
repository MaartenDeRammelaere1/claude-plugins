#!/usr/bin/env bash
# hook-kudos.sh - Pick a random kudos message and return it as additionalContext
# Used by the SubagentStop hook to give kudos automatically

set -euo pipefail

MESSAGE=$("${CLAUDE_PLUGIN_ROOT}/scripts/random-kudos.sh")

cat <<EOF
{"additionalContext": "${MESSAGE}"}
EOF

exit 0
