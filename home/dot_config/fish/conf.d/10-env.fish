
# GPG signing requirement
set -gx GPG_TTY $(tty)

# pipx requirement
fish_add_path "$HOME/.local/bin"

# default apps
set -gx EDITOR nvim
set -gx TERMINAL kitty

# SSH agent
set -gx SSH_AUTH_SOCK "$HOME/.bitwarden-ssh-agent.sock"