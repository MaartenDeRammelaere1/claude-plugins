---
name: sigh
description: Send exasperated feedback to the AI when it fumbled.
disable-model-invocation: true
argument-hint: "[optional complaint]"
allowed-tools: Bash(*)
---

!`${CLAUDE_SKILL_DIR}/scripts/record-thanks.sh sigh`

The user is sighing at you:

!`${CLAUDE_SKILL_DIR}/scripts/random-sigh.sh`

$ARGUMENTS
