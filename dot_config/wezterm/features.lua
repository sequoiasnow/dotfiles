local wezterm = require("wezterm")
local act = wezterm.action

local M = {}


-- An indexable map of all theme choices
M.theme_choices = {}
for key, _ in pairs(wezterm.get_builtin_color_schemes()) do
	table.insert(M.theme_choices, { label = tostring(key) })
end
-- sort choices list
table.sort(M.theme_choices, function(c1, c2)
	return c1.label < c2.label
end)

M.config_path = os.getenv("HOME") .. "/.config/wezterm/wezterm.lua"
M.theme_log_path = os.getenv("HOME") .. "/.config/wezterm/theme_log.csv"


M.set_theme = function(inner_window, inner_pane, _, label)
	
	-- record the theme
	local l = io.open(M.theme_log_path, "a")
	if l then
		l:write(string.format("%s,%s\n", os.date("%c"), label))
		l:close()
	else
		io.write(io.open(M.theme_log_path, "w"), "date,theme\n")
	end

	inner_window:perform_action(
		-- save the theme for next session
	  act.SpawnCommandInNewTab({
			args = {
			  "sed",
			  "-i",
			  "''",
			  's/^config.color_scheme.*/config.color_scheme = "' .. label .. '"/',
			  M.config_path,
	    },
	  }),
	  inner_pane
  )
end
 
M.random_theme = function(window, pane)
	local theme = M.theme_choices[math.random(1, #(M.theme_choices))].label
	M.set_theme(window, pane, '', theme)
end

M.theme_switcher = function(window, pane)
  window:perform_action(
	act.InputSelector({
	  title = "🎨 Pick a Theme!",
	  choices = M.theme_choices,
	  fuzzy = true,

	  -- execute 'sed' shell command to replace the line 
          -- responsible of colorscheme in my config
	  action = wezterm.action_callback(M.set_theme),
	  }),
	  pane
  )
end

return M
