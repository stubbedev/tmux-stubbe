#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/utils.sh"

toggle_window() {
	local window_name="$1"
	local app_command="$2"
	local current_window=$(get_current_window)
	local current_path=$(tmux display-message -p -F "#{pane_current_path}")

	if [ "$current_window" = "$window_name" ]; then
		tmux last-window
		return
	fi

	if [ "$(check_if_window_exists "$window_name")" -eq 1 ]; then
		tmux select-window -t "$window_name"
	else
		tmux new-window -c "$current_path" -n "$window_name"
		tmux select-window -t "$window_name"
		tmux send-keys -t "$window_name" "source $CURRENT_DIR/utils.sh && $app_command" C-m
	fi
}

toggle_lazygit_window() {
  if [[ -d .git ]] || git rev-parse --git-dir >/dev/null 2>&1; then
    toggle_window "lazygit" "toggle_lazygit"
  fi
}

toggle_sysmon_window() {
  toggle_window "sysmon" "toggle_sysmon"
}

toggle_lazydocker_window() {
  toggle_window "lazydocker" "toggle_lazydocker"
}

case "$1" in
"toggle_lazygit_window")
  toggle_lazygit_window
  ;;
"toggle_sysmon_window")
  toggle_sysmon_window
  ;;
"toggle_lazydocker_window")
  toggle_lazydocker_window
  ;;
esac
