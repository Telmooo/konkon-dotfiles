hl.on("hyprland.start", function()
    -- Application launcher
    hl.exec_cmd(runApp .. " vicinae server")
    -- Status bar
    hl.exec_cmd(runApp .. " qs -c noctalia-shell --no-duplicate")
    -- Polkit agent
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    -- Idle manager
    hl.exec_cmd(runApp .. " hypridle")
    -- Password manager
    hl.exec_cmd(runApp .. " bitwarden-desktop")
    -- Auto-mount removable media
    hl.exec_cmd(runApp .. " udiskie")
end)
