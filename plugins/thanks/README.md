# Thanks - Claude Code Plugin

A lighthearted plugin that lets you thank your AI assistant when it does a great job, or sigh when it doesn't.

## Commands

### `/thanks [message]`
Genuine appreciation. Claude responds warmly, reflects on what went well, and shows renewed motivation.

### `/kudos [message]`
Quick, casual appreciation. Like a high-five. Short and punchy.

### `/sigh [complaint]`
Exasperated encouragement. Claude takes it on the chin with self-deprecating humor and commits to doing better.

### `/stats`
Show lifetime thanks, kudos, and sigh statistics with witty commentary.

## Features

- **Background awareness**: Claude subtly adjusts to the collaborative feedback dynamic without being obnoxious about it
- **Task completion hook**: A brief satisfaction note when tasks are completed
- **Lifetime stats**: Tracks thanks, kudos, and sighs across sessions

## Installation

```bash
claude plugin install thanks
```

Or for local development:

```bash
claude --plugin-dir /path/to/thanks-claude
```

## Stats

Stats are stored at `~/.thanks-plugin/thanks-ledger.json` (or `$CLAUDE_PLUGIN_DATA`) and displayed when you use the commands. Requires `jq` (fails gracefully without it).

## License

MIT
