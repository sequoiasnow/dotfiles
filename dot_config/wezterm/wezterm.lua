-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.line_height = 1.1
config.color_scheme = 'Oxocarbon Dark (Gogh)'
config.enable_tab_bar = false

config.font = wezterm.font('MonaspiceKr NFM Medium') 
config.font_size = 13

-- no window padding, cause eww
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- no tab bars or the like, we use tmux for tiling, so the menu is
-- not relevant.
config.window_decorations = 'RESIZE'

-- I have way too much love of a transparent window
config.window_background_opacity = 0.7

-- Finally, return the configuration to wezterm:
return config
