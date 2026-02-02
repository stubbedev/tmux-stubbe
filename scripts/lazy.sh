#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMANDS_FILE="$CURRENT_DIR/commands.sh"

main() {
  tmux set-environment -g TMUX_STUBBE_COMMANDS_FILE "$COMMANDS_FILE"
  tmux set-hook -g session-created[50] "run-shell -b \"#{TMUX_STUBBE_COMMANDS_FILE} session_init\""
  tmux run-shell -b "$COMMANDS_FILE session_init"
  tmux bind -n M-g run-shell -b "#{TMUX_STUBBE_COMMANDS_FILE} toggle_lazygit_window"
  tmux bind -n M-a run-shell -b "#{TMUX_STUBBE_COMMANDS_FILE} toggle_sysmon_window"
  tmux bind -n M-A run-shell -b "#{TMUX_STUBBE_COMMANDS_FILE} toggle_lazydocker_window"
}

main
