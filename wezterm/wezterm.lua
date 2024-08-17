local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Font settings
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" })
config.font_size = 16.0

-- Appearance settings
config.color_scheme = "Gruvbox dark, medium (base16)"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = { left = 10, right = 10, top = 5, bottom = 0 }

config.background = {
	{
		source = {
			Color = "#282828",
		},
		width = "100%",
		height = "100%",
		opacity = 1,
	},
	{
		source = {
			File = wezterm.config_dir .. "/mountain1.jpg",
		},
		opacity = 0.2,
	},
	{
		source = {
			Color = "#282828",
		},
		width = "100%",
		height = "100%",
		opacity = 0.3,
	},
}

return config
