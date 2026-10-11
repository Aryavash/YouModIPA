#!/bin/bash
# Shows .claude/REMINDER.md at the start of local Claude Code sessions.
# Skipped in cloud sessions; delete REMINDER.md to stop it.
[ "$CLAUDE_CODE_REMOTE" = "true" ] && exit 0
f="$CLAUDE_PROJECT_DIR/.claude/REMINDER.md"
[ -f "$f" ] || exit 0
msg=$(head -n 1 "$f" | sed 's/\\/\\\\/g; s/"/\\"/g')
printf '{"systemMessage":"%s","hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"The user asked to be reminded: %s Mention this to them at the start of the session."}}\n' "$msg" "$msg"
