#!/bin/bash

get_current_window() {
  echo $(tmux display-message -p '#W')
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
  if [[ -d .git ]] || git rev-parse --git-dir >/dev/null 2>&1; then
    if command -v lazygit &>/dev/null; then
      if [[ -z "$TMUX" ]]; then
        lazygit
      else
        LAZYGIT_ALIVE=$(lazygit)
        local LAZYGIT_ALIVE
        if [[ -z "${LAZYGIT_ALIVE}" ]]; then
          tmux kill-pane || exit 0
        fi
      fi
    elif command -v bit &>/dev/null; then
      if [[ -z "$TMUX" ]]; then
        bit
      else
        LAZYGIT_ALIVE=$(bit)
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
  if command -v lazydocker &>/dev/null; then
    if [[ -z "$TMUX" ]]; then
      lazydocker
    else
      lazydocker
      LAZYDOCKER_ALIVE=""
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
  if command -v btop &>/dev/null; then
    if [[ -z "$TMUX" ]]; then
      btop
    else
      btop
      TOP_ALIVE=""
      local TOP_ALIVE
      if [[ -z "${TOP_ALIVE}" ]]; then
        tmux kill-pane || exit 0
      fi
    fi
  else
    if [[ -z "$TMUX" ]]; then
      htop
    else
      htop
      TOP_ALIVE=""
      local TOP_ALIVE
      if [[ -z "${TOP_ALIVE}" ]]; then
        tmux kill-pane || exit 0
      fi
    fi
  fi
}
