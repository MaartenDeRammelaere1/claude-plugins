---
name: sigh
description: Send exasperated feedback to the AI when it fumbled.
disable-model-invocation: true
argument-hint: "[optional complaint]"
allowed-tools: Bash("${CLAUDE_PLUGIN_ROOT}/scripts/record-thanks.sh" *) Bash("${CLAUDE_PLUGIN_ROOT}/scripts/random-sigh.sh")
---

!`"${CLAUDE_PLUGIN_ROOT}/scripts/record-thanks.sh" sigh`

The user is sighing at you:

!`"${CLAUDE_PLUGIN_ROOT}/scripts/random-sigh.sh"`

$ARGUMENTS
