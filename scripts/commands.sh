#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/utils.sh"

toggle_lazygit_window() {
  if [[ -d .git ]] || git rev-parse --git-dir > /dev/null 2>&1; then
    local lazygit_window_name="lazygit"
    local current_window=$(get_current_window)
    local current_path=$(tmux display-message -p -F "#{pane_current_path}")

    if [ "$current_window" = "$lazygit_window_name" ]; then
      tmux last-window
      return
    fi

    if [ "$(check_if_window_exists "$lazygit_window_name")" -eq 1 ]; then
      tmux select-window -t "$lazygit_window_name"
    else
      tmux new-window -c "$current_path" -n "$lazygit_window_name"
      tmux select-window -t "$lazygit_window_name"
      tmux send-keys -t "$lazygit_window_name" "~/.stubbe/bin/tslg" C-m
    fi
  else
    exit 0
  fi
}

if [[ "$1" == "toggle_lazygit_window" ]]; then
	toggle_lazygit_window
fi

toggle_htop_window() {
  local htop_window_name="htop"
  local current_window=$(get_current_window)
  local current_path=$(tmux display-message -p -F "#{pane_current_path}")

  if [ "$current_window" = "$htop_window_name" ]; then
    tmux last-window
    return
  fi

  if [ "$(check_if_window_exists "$htop_window_name")" -eq 1 ]; then
    tmux select-window -t "$htop_window_name"
  else
    tmux new-window -c "$current_path" -n "$htop_window_name"
    tmux select-window -t "$htop_window_name"
    tmux send-keys -t "$htop_window_name" "~/.stubbe/bin/htop_wrapper" C-m
  fi
}

if [[ "$1" == "toggle_htop_window" ]]; then
	toggle_htop_window
fi

toggle_lazydocker_window() {
  if [[ -d .git ]] || git rev-parse --git-dir > /dev/null 2>&1; then
    local lazydocker_window_name="lazydocker"
    local current_window=$(get_current_window)
    local current_path=$(tmux display-message -p -F "#{pane_current_path}")

    if [ "$current_window" = "$lazydocker_window_name" ]; then
      tmux last-window
      return
    fi

    if [ "$(check_if_window_exists "$lazydocker_window_name")" -eq 1 ]; then
      tmux select-window -t "$lazydocker_window_name"
    else
      tmux new-window -c "$current_path" -n "$lazydocker_window_name"
      tmux select-window -t "$lazydocker_window_name"
      tmux command-prompt -p "Authorize: " "send-keys -t \"$lazydocker_window_name\" \"echo %1 | sudo -S \$(which lazydocker)\" C-m"
      # tmux send-keys -t "$lazydocker_window_name" "~/.stubbe/bin/tsld" C-m
    fi
  else
    exit 0
  fi
}

if [[ "$1" == "toggle_lazydocker_window" ]]; then
	toggle_lazydocker_window
fi
