local mainMod = "SUPER"

local ipc = "qs -c noctalia-shell ipc call"

---------------
--- GENERAL ---
---------------

hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))                -- Lock screen
hl.bind(mainMod .. " + CONTROL + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))     -- Reload Hyprland

--------------------
--- APPLICATIONS ---
--------------------

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))                                           -- Open terminal
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(runApp .. " " .. fallbackTerminal))          -- Open terminal (fallback)
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(runApp .. " " .. fileManager))                       -- Open GUI file manager
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(terminalExec .. " " .. termFileManager))     -- Open TUI file manager
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(runApp .. " " .. browser))                           -- Open browser
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(runApp .. " " .. fallbackBrowser))           -- Open browser (fallback)
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(menu))                                          -- Application launcher
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(runApp .. " " .. visualEditor))                      -- Open Code editor
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(terminalExec .. " " .. editor))              -- Open editor (terminal)

hl.bind(mainMod .. " + SHIFT_R + SPACE", hl.dsp.exec_cmd(ipc .. " bar toggle"))                 -- Toggle status bar


-----------------------
--- WINDOW MOVEMENT ---
-----------------------

-- Move window focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move focused window
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })      -- LMB
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })    -- RMB

------------------
--- WORKSPACES ---
------------------

for i = 1, 10 do
    local key = i % 10
    -- Switch to workspace N
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    -- Move active window to workspace N
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-------------
--- MEDIA ---
-------------

-- Media keys for volume

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Media keys for LCD brightness

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-------

-- Defaults
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
