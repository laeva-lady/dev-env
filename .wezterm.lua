-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = false
config.font_size = 16
config.color_scheme = 'AdventureTime'

-- Finally, return the configuration to wezterm:
return config
