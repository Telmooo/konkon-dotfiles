# System Commands
abbr -a -- ssys sudo systemctl
abbr -a -- sysu systemctl --user
abbr -a -- bye systemctl poweroff
abbr -a -- rebye systemctl reboot

# CLI overrides

if type -q eza
    abbr -a -- ls   "eza --group-directories-first --icons"
    abbr -a -- ll   "eza -lah --group-directories-first --icons --git"
    abbr -a -- la   "eza -a --group-directories-first --icons"
    abbr -a -- lt   "eza --tree --level=2 --icons"
end

if type -q bat
    abbr -a -- cat bat
end

if type -q fd
    abbr -a -- find fd
end

if type -q rg
    abbr -a -- grep rg
end

if type -q btop
    abbr -a -- top btop
end

if type -q zoxide
    abbr -a -- cd z
    abbr -a -- cdi zi
end

# Network
abbr -a -- scan-ports "ss -tlnp"
if type -q nmap
    abbr -a -- scan-ports-remote "nmap -p- --open"
end
