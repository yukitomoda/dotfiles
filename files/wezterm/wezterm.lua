local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { 'nu', '-l' }

-- 見た目
config.front_end = 'WebGpu'
config.color_scheme = 'Wombat'
config.colors = {
  scrollbar_thumb = '#226688'
}
config.window_background_opacity = 0.9
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 18
config.enable_scroll_bar = true
return config
