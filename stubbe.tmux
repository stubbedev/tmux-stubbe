#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

$CURRENT_DIR/scripts/lazy.sh

# Theme
function set_tmux_theme {
	bg="#a6da95"
	stb_status="top"
	justify="left"
	indicator=" [t] "
	indicator_active=" [p] "
	window_status_format=' #I:#W '
	stb_status_right="#S"
	stb_status_left="#[bg=default,fg=black,bold]#{?client_prefix,,${indicator}}#[bg=${bg},fg=black,bold]#{?client_prefix,${indicator_active},}#[bg=default,fg=black,bold]"

	expanded_icon=' 󰊓 '
	stb_status_right_extra="$stb_status_right"
	stb_status_left_extra="$stb_status_left"

	tmux set-option -g status-position "${stb_status}"
	tmux set-option -g status-style bg=default,fg=default
	tmux set-option -g status-justify "${justify}"
	tmux set-option -g status-left "${stb_status_left_extra}"
	tmux set-option -g status-right "${stb_status_right_extra}"
	tmux set-option -g window-status-format "${window_status_format}"
	tmux set-option -g window-status-current-format "#[bg=${bg},fg=#000000] ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
}

set_tmux_theme
