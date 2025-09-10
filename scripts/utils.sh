#!/usr/bin/env bash

get_current_window() {
	tmux display-message -p '#W'
}

check_if_window_exists() {
	local window_name=$1
	local result=$(tmux list-windows -F "#{window_name}" | grep -i "$window_name")

	if [ -n "$result" ]; then
		echo 1
	else
		echo 0
	fi
}

toggle_window_app() {
	local command="$1"
	
	if [[ -z "$TMUX" ]]; then
		$command
		return
	fi
	
	$command
	
	if [[ $? -ne 0 ]] || ! pgrep -f "$command" >/dev/null 2>&1; then
		tmux kill-pane 2>/dev/null || exit 0
	fi
}

toggle_lazygit() {
	if [[ ! -d .git ]] && ! git rev-parse --git-dir >/dev/null 2>&1; then
		clear
		return
	fi
	
	if command -v lazygit &>/dev/null; then
		toggle_window_app "lazygit"
	elif command -v bit &>/dev/null; then
		toggle_window_app "bit"
	fi
}

toggle_lazydocker() {
	if command -v lazydocker &>/dev/null; then
		toggle_window_app "lazydocker"
	fi
}

toggle_sysmon() {
	if command -v btop &>/dev/null; then
		toggle_window_app "btop"
	else
		toggle_window_app "htop"
	fi
}
