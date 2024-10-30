#!/bin/bash

get_tmux_option() {
	local option=$1
	local default_value=$2
	local option_value=$(tmux show-option -gqv "$option")

	if [ -z "$option_value" ]; then
		echo $default_value
	else
		echo $option_value
	fi
}

get_current_window() {
	echo $(tmux display-message -p '#W')
}

bind_if_set() {
	local key=$1
	local command=$2
	local option=$(get_tmux_option "$key")

	if [ "$option" != "" ]; then
		tmux unbind-key "$option"
		tmux bind-key "$option" "$command"
	fi
}

check_if_window_exists() {
	local window_name=$1
	result=$(tmux list-windows -F "#{window_name}" | grep -i "$window_name")

	if [ -n "$result" ]; then
		echo 1
	else
		echo 0
	fi
}

function toggle_lazygit {
  if [[ -d .git ]] || git rev-parse --git-dir > /dev/null 2>&1; then
    if command -v lazygit &> /dev/null; then
      if [[ -z "$TMUX" ]]; then
        lazygit
      else
        LAZYGIT_ALIVE=$(lazygit);
        local LAZYGIT_ALIVE
        if [[ -z "${LAZYGIT_ALIVE}" ]]; then
          tmux kill-pane || exit 0
        fi
      fi
    elif command -v bit &> /dev/null; then
      if [[ -z "$TMUX" ]]; then
        bit
      else
        LAZYGIT_ALIVE=$(bit);
        local LAZYGIT_ALIVE
        if [[ -z "${LAZYGIT_ALIVE}" ]]; then
          tmux kill-pane || exit 0
        fi
      fi
    else
      exit 0
    fi
  else
    clear && exit 0
  fi
}


function toggle_lazydocker {
  if command -v lazydocker &> /dev/null; then
    if [[ -z "$TMUX" ]]; then
      sudo $(which lazydocker)
    else
      LAZYDOCKER_ALIVE=$(sudo $(which lazydocker));
      local LAZYDOCKER_ALIVE
      if [[ -z "${LAZYDOCKER_ALIVE}" ]]; then
        tmux kill-pane || exit 0
      fi
    fi
  else
    exit 0
  fi
}


function toggle_htop {
  if [[ -z "$TMUX" ]]; then
    htop
  else
    htop
    HTOP_ALIVE=""
    local HTOP_ALIVE
    if [[ -z "${HTOP_ALIVE}" ]]; then
      tmux kill-pane || exit 0
    fi
  fi
}
