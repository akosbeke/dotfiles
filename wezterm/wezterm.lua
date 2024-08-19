local wezterm = require("wezterm")

local use_wallpaper = true
local dark_opacity = 0.9
local light_opacity = 0.9

local wallpapers_glob = wezterm.config_dir .. "/backdrops/**"

local w = require("utils/wallpaper")
local b = require("utils/background")

local config = wezterm.config_builder()

-- Font settings
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" })
config.font_size = 16.0

-- Appearance settings
config.color_scheme = "Gruvbox dark, medium (base16)"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = { left = 11, right = 10, top = 5, bottom = 0 }
config.macos_window_background_blur = 40

if use_wallpaper then
	config.background = {
		w.get_wallpaper(wallpapers_glob),
		b.get_background(dark_opacity, light_opacity),
	}
else
	config.background = {
		b.get_background(0.7, light_opacity),
	}
end

return config
