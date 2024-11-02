#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

$CURRENT_DIR/scripts/lazy.sh

# Theme
function set_tmux_theme {

  # --> Catppuccin (Mocha)
  local tmux_bg="#1e1e2e"
  local tmux_fg="#cdd6f4"

  # Colors
  local tmux_rosewater="#f5e0dc"
  local tmux_flamingo="#f2cdcd"
  local tmux_rosewater="#f5e0dc"
  local tmux_pink="#f5c2e7"
  local tmux_mauve="#cba6f7"
  local tmux_red="#f38ba8"
  local tmux_maroon="#eba0ac"
  local tmux_peach="#fab387"
  local tmux_yellow="#f9e2af"
  local tmux_green="#a6e3a1"
  local tmux_teal="#94e2d5"
  local tmux_sky="#89dceb"
  local tmux_sapphire="#74c7ec"
  local tmux_blue="#89b4fa"
  local tmux_lavender="#b4befe"

  # Surfaces and overlays
  local tmux_subtext_1="#a6adc8"
  local tmux_subtext_0="#bac2de"
  local tmux_overlay_2="#9399b2"
  local tmux_overlay_1="#7f849c"
  local tmux_overlay_0="#6c7086"
  local tmux_surface_2="#585b70"
  local tmux_surface_1="#45475a"
  local tmux_surface_0="#313244"
  local tmux_mantle="#181825"
  local tmux_crust="#11111b"

	bg="#a6da95"
	stb_status="top"
	justify="left"
	indicator=" [t] "
	indicator_active=" [p] "
	window_status_format=' #I:#W '
	stb_status_right="#S"
	stb_status_left="#[bg=${tmux_bg},fg=${tmux_fg},bold]#{?client_prefix,,${indicator}}#[bg=${tmux_green},fg=${tmux_bg},bold]#{?client_prefix,${indicator_active},}#[bg=${tmux_bg},fg=${tmux_bg},bold]"

	expanded_icon=' 󰊓 '

	tmux set-option -g status-position "${stb_status}"
	tmux set-option -g status-style bg=${tmux_bg},fg=${tmux_fg}
	tmux set-option -g status-justify "${justify}"
	tmux set-option -g status-left "${stb_status_left}"
	tmux set-option -g status-right "${stb_status_right}"
	tmux set-option -g window-status-format "${window_status_format}"
	tmux set-option -g window-status-current-format "#[bg=${tmux_green},fg=${tmux_bg}] ${window_status_format}#{?window_zoomed_flag,${expanded_icon}, }"
  tmux set-option -g status-style fg=black,bg=cyan
  tmux set-option -g pane-active-border-style bg=default,fg=cyan
  tmux set-option -g pane-border-style fg=blue
}

set_tmux_theme
