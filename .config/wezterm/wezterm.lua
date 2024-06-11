-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_background_opacity = 0.9

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'
config.enable_wayland = false

config.font = wezterm.font('Input Mono')
config.font_size = 12.0

config.keys = {
  {
    key = 'v',
    mods = 'CTRL',
    action = wezterm.action.PasteFrom 'Clipboard'
  },
}

-- and finally, return the configuration to wezterm
return config

