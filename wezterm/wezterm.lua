local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 14.0

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = "Gruvbox dark, medium (base16)"

return config
