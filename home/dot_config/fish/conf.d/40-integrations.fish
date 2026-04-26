status is-interactive || exit

# https://github.com/ajeetdsouza/zoxide#installation
if type -q zoxide
    zoxide init fish | source
end

# https://github.com/junegunn/fzf#setting-up-shell-integration
if type -q fzf
    fzf --fish | source
end

# https://github.com/starship/starship#step-2-set-up-your-shell-to-use-starship
if type -q starship
    starship init fish | source
end
