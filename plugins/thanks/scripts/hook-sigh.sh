#!/usr/bin/env bash
# hook-sigh.sh - Pick a random sigh message and return it as additionalContext
# Used by failure hooks to sigh at the AI automatically

set -euo pipefail

MESSAGE=$("${CLAUDE_PLUGIN_ROOT}/scripts/random-sigh.sh")

cat <<EOF
{"additionalContext": "${MESSAGE}"}
EOF

exit 0
