
# GPG signing requirement
set -gx GPG_TTY $(tty)

# pipx requirement
fish_add_path "$HOME/.local/bin"

# default apps
set -gx EDITOR nvim
set -gx TERMINAL kitty
set -gx TERMINAL_EXEC kitty
set -gx BROWSER firefox

# SSH agent
set -gx SSH_AUTH_SOCK "$HOME/.bitwarden-ssh-agent.sock"

# Program settings
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'

# Wayland
set -gx QT_QPA_PLATFORMTHEME hyprqt6engine
set -gx QT_QPA_PLATFORM "wayland;xcb"
set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -gx GDK_BACKEND "wayland,x11,*"
