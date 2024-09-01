local wezterm = require 'wezterm'
local colors = require 'looks'

local config = wezterm.config_builder()

colors.apply_to_config(config)
config.set_environment_variables = {
    TERM = "wezterm"
}
config.keys = {
    {
      key = 'F',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.Search({ CaseInSensitiveString = '' })
    }
}
-- config.skip_close_confirmation_for_processes_named = {
--     'bash',
--     'sh',
--     'zsh',
--     'fish',
--     'tmux',
--     'nu',
--     'vim',
--     'v',
--     'nvim',
--     'lvim',
-- }

config.window_close_confirmation = 'NeverPrompt'

return config
