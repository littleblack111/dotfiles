local M          = {}

-- Program defaults
M.term           = "kitty"
M.termLaunch     = M.term .. " -1"
M.termfloat      = "[float on; center on; size (monitor_w*0.4) (monitor_h*0.4); workspace unset] " .. M.term
M.editor         = "zeditor"
-- $browser = thorium-browser
M.browser        = "zen-browser"
M.fileManager    = "thunar"
M.sessionManager = "sddm"

-- Dirs
M.HYPRDIR        = "$HOME/.config/hypr"
M.SCRIPTSDIR     = "$HOME/scripts"
M.rofiexec       = "$HOME/.config/rofi/scripts"

-- Files
M.bgChangerBin   = M.SCRIPTSDIR .. "/walls/awww.sh"
M.bgChanger      = "awww.sh"

-- misc
M.waylandarg     =
"--enable-features=WaylandWindowDecorations,UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform-hint=wayland --enable-wayland-ime"

return M
