local wezterm = require("wezterm")

local mux = wezterm.mux

-- full screen on enter
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

local config = wezterm.config_builder()
local act = wezterm.action
config.keys = {
	-- direction
	{
		mods = "CTRL|SHIFT",
		key = "h",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		mods = "CTRL|SHIFT",
		key = "j",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		mods = "CTRL|SHIFT",
		key = "k",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		mods = "CTRL|SHIFT",
		key = "l",
		action = act.ActivatePaneDirection("Right"),
	},

	-- Switch to the default workspace
	{
		mods = "CTRL|SHIFT",
		key = "y",
		action = act.SwitchToWorkspace({
			name = "default",
		}),
	},
	-- Switch to a monitoring workspace, which will have `top` launched into it
	{
		mods = "CTRL|SHIFT",
		key = "u",
		action = act.SwitchToWorkspace({
			name = "monitoring",
			spawn = {
				args = { "top" },
			},
		}),
	},
	-- Create a new workspace with a random name and switch to it
	{
		mods = "CTRL|SHIFT",
		key = "i",
		action = act.SwitchToWorkspace,
	},
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		mods = "CTRL|SHIFT",
		key = "b",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

if wezterm.target_os == "windows" then
  config.default_domain = "WSL:Ubuntu-24.04"
end

config.color_scheme = "Tokyo Night (Gogh)"
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 10
config.window_decorations = "INTEGRATED_BUTTONS"

return config
