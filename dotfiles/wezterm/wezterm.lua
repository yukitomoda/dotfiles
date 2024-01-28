local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.default_prog = { 'nu', '-l' }

-- 見た目
config.front_end = 'Software'
config.color_scheme = 'Wombat'
config.colors = {
    scrollbar_thumb = '#226688',
    cursor_bg = '#665566',
    selection_bg = '#333355',
}
config.window_background_opacity = 0.9
config.font = wezterm.font 'Cica'
config.font_size = 20
config.enable_scroll_bar = true

-- キーバインド
-- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html#available-key-assignments
config.leader = { key = '\\', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    -- pane
    { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
    { key = 'h', mods = 'ALT|SHIFT', action = act.SplitPane { direction = 'Left'} },
    { key = 'j', mods = 'ALT|SHIFT', action = act.SplitPane { direction = 'Down'} },
    { key = 'k', mods = 'ALT|SHIFT', action = act.SplitPane { direction = 'Up' } },
    { key = 'l', mods = 'ALT|SHIFT', action = act.SplitPane { direction = 'Right'} },
    -- tab
    { key = 't', mods = 'ALT|SHIFT', action = act.SpawnTab 'DefaultDomain' },
    { key = 'p', mods = 'ALT', action = act.ActivateTabRelative(-1) },
    { key = 'n', mods = 'ALT', action = act.ActivateTabRelative(1) },
}


return config
