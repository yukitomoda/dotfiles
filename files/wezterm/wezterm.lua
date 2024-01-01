local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { 'nu', '-l' }

-- 見た目
config.color_scheme = 'Wombat'
config.window_background_opacity = 0.85
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 18

return config
