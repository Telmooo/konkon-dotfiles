
# GPG signing requirement
set -gx GPG_TTY $(tty)

# pipx requirement
fish_add_path "$HOME/.local/bin"

# default apps
set -gx EDITOR nvim
set -gx TERMINAL kitty
