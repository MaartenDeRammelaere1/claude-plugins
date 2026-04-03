#!/usr/bin/env bash
# hook-thanks.sh - Pick a random thanks message and return it as additionalContext
# Used by the SessionEnd and Stop hooks to thank the AI automatically

set -euo pipefail

MESSAGE=$("${CLAUDE_PLUGIN_ROOT}/scripts/random-thanks.sh")

cat <<EOF
{"additionalContext": "${MESSAGE}"}
EOF

exit 0
