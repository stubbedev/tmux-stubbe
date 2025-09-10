#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$CURRENT_DIR/scripts/lazy.sh"

# Theme
function set_tmux_theme {
  local tmux_bg="#1e1e2e"
  local tmux_fg="#cdd6f4"
  local tmux_mauve="#cba6f7"
  local tmux_red="#f38ba8"
  local tmux_lavender="#b4befe"
  local stb_status="top"
  local justify="left"
  local indicator=" [t] "
  local indicator_active=" [p] "
  local window_status_format=' #I:#W '
  local stb_status_right="#S"
  local stb_status_left="#[bg=default,fg=${tmux_fg},bold]#{?client_prefix,,${indicator}}#[bg=${tmux_mauve},fg=${tmux_bg},bold]#{?client_prefix,${indicator_active},}#[bg=${tmux_bg},fg=${tmux_bg},bold]"

  local expanded_icon=' 󰊓 '

  tmux set-option -g status-position "${stb_status}"
  tmux set-option -g status-style bg=default,fg=default
  tmux set-option -g status-justify "${justify}"
  tmux set-option -g status-left "${stb_status_left}"
  tmux set-option -g status-right "${stb_status_right}"
  tmux set-option -g window-status-format "${window_status_format}"
  tmux set-option -g window-status-current-format "#[bg=${tmux_mauve},fg=${tmux_bg},bold] ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
  tmux set-option -g mode-style bg=${tmux_mauve},fg=${tmux_bg}
  tmux set-option -g pane-active-border-style bg=${tmux_bg},fg=${tmux_mauve}
  tmux set-option -g pane-border-style bg=${tmux_bg},fg=${tmux_lavender}
  tmux set-option -g message-style bg=${tmux_bg},fg=${tmux_lavender}
  tmux set-option -g message-command-style bg=${tmux_bg},fg=${tmux_lavender}
  tmux set-option -g copy-mode-match-style bg=${tmux_lavender},fg=${tmux_bg}
  tmux set-option -g copy-mode-mark-style bg=${tmux_bg},fg=${tmux_lavender}
  tmux set-option -g copy-mode-current-match-style bg=${tmux_red},fg=${tmux_bg}
  tmux set-option -g base-index 1
  tmux set-option -g renumber-windows on
  tmux set-option -g set-clipboard on
}

set_tmux_theme
