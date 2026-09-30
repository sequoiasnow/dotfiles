-- Pull in the wezterm API
local wezterm = require 'wezterm'
local features = require 'features'

-- This will hold the configuration. 
local config = wezterm.config_builder()


-- Set te default program to tmux (will still automatically load ZSH)
config.default_prog = { '/opt/homebrew/bin/tmux' }
 
-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.line_height = 1.1
config.color_scheme = "SweetTerminal (Gogh)"

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
config.window_background_opacity = 0.8
config.text_background_opacity = 0.2

-- Add config to have a custom keybinding to pull up the theme picker
config.keys = {
  {
	  key    = "r",
	  mods   = "CMD|SHIFT",
	  action = wezterm.action_callback(function(window, pane)
		  features.random_theme(window, pane)
	  end),
  },
  {
	  key    = "t",
	  mods   = "CMD|SHIFT",
	  action = wezterm.action_callback(function(window, pane)
		  features.theme_switcher(window, pane)
	  end),
  },
}

-- Finally, return the configuration to wezterm:
return config
