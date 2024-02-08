-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = {}

-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
config.color_scheme = 'Catppuccin Frappe'
config.font = wezterm.font_with_fallback({
  { family = "Hack Nerd Font", scale=1.1 },
  { family = "JetBrainsMono Nerd Font", scale=1.1 },
})
config.window_background_opacity = 0.9
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 3500

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
    border_left_width = '0.5cell',
    border_right_width = '0.5cell',
  }

return config
