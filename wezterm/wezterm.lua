local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Font settings
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" })
config.font_size = 17.0

-- Appearance settings
config.color_scheme = "Gruvbox dark, medium (base16)"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

return config
