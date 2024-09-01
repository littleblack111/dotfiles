local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.font = wezterm.font 'JetBrains Mono'
    config.enable_tab_bar = false
    config.window_background_opacity = 0.7
end

return module
