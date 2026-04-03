---
name: stats
description: Show lifetime thanks, kudos, and sigh statistics.
disable-model-invocation: true
allowed-tools: Bash(*)
---

# Thanks Plugin Stats

Here are the user's lifetime feedback stats:

!`"${CLAUDE_PLUGIN_ROOT}/scripts/show-stats.sh"`

## How to respond

Present the stats above in a clean, readable format. Include:

1. **The raw numbers** - thanks, sighs, and sessions
3. **A brief, witty commentary** based on the data:
   - All thanks, no sighs? "A perfect record. Either I'm really good or you're really generous."
   - More sighs than thanks? "Room for improvement. But hey, I'm still here."
   - Balanced? "A healthy mix. Keeps me humble and motivated."
   - No data yet? "A clean slate. Let's see how this goes."
4. **Keep it to 3-5 sentences total**
