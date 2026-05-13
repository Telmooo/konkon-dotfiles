------------------
---- MONITORS ----
------------------

require("config.monitors")

---------------------
---- MY PROGRAMS ----
---------------------

require("config.apps")

-------------------
---- AUTOSTART ----
-------------------

require("config.autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

require("config.env")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

require("config.general")

require("config.decoration")

require("config.animations")


----------------
----  MISC  ----
----------------

require("config.misc")

---------------
---- INPUT ----
---------------

require("config.input")

require("config.gestures")

---------------------
---- KEYBINDINGS ----
---------------------

require("config.keybinds")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("config.rules")

------------------------
---- USER OVERRIDES ----
------------------------
