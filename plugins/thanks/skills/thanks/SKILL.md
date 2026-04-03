---
name: thanks
description: Send a thank-you message to the AI for doing a good job.
disable-model-invocation: true
argument-hint: "[optional message]"
allowed-tools: Bash(*)
---

!`${CLAUDE_SKILL_DIR}/scripts/record-thanks.sh genuine`

The user is thanking you:

!`${CLAUDE_SKILL_DIR}/scripts/random-thanks.sh`

$ARGUMENTS
