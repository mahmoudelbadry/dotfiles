-- Pull in the wezterm API
local wezterm = require("wezterm")
--
-- -- This will hold the configuration.
local config = wezterm.config_builder()
config.color_scheme = 'Monokai Soda (Gogh)'
config.font = wezterm.font("Vazir Code Hack")
-- config.font = wezterm.font("Departure Mono")
config.font_size = 13
config.enable_tab_bar = false
config.window_background_opacity = 0.95
config.bidi_enabled = true
config.bidi_direction = "AutoLeftToRight"

return config
