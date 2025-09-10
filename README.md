# STUBBE TMUX

A custom tmux configuration with integrated tools for development workflow.

## Features

- **Catppuccin-inspired theme** with custom status bar and pane styling
- **Quick tool access** via keyboard shortcuts:
  - `Alt+g` - Toggle lazygit/bit (git TUI)
  - `Alt+a` - Toggle system monitor (btop/htop)
  - `Alt+A` - Toggle lazydocker (Docker TUI)

## Installation

1. Clone this repository
2. Source the main configuration in your `.tmux.conf`:
   ```bash
   run-shell "/path/to/tmux-stubbe/stubbe.tmux"
   ```
3. Reload tmux configuration: `tmux source-file ~/.tmux.conf`

## Dependencies

Optional tools that enhance functionality:
- `lazygit` or `bit` for git management
- `btop` or `htop` for system monitoring  
- `lazydocker` for Docker management

## Usage

The keyboard shortcuts automatically detect if you're in a git repository and available tools on your system. Windows are toggled intelligently - pressing the same shortcut will return to your previous window.