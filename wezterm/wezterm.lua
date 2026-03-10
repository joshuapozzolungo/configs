local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Aci (Gogh)"
config.font = wezterm.font("MesloLGS Nerd Font Mono", { weight = "Bold" })
config.font_size = 12.5
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
