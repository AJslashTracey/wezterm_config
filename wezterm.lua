local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font configuration
config.font = wezterm.font_with_fallback({
  {
    family = 'JetBrainsMono Nerd Font',
    weight = 'Regular',
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
  },
})

config.font_size = 14.0
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

-- Color scheme with custom background
config.color_scheme = 'Tokyo Night Storm'
config.colors = {
  background = '#000000',
}

-- Window appearance
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Tab bar appearance
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- Cursor customization
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 800

-- Key bindings
config.keys = {
  -- Split panes
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  -- Navigate panes
  { key = 'h', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Down' },
  -- Close pane
  { key = 'w', mods = 'CMD', action = act.CloseCurrentPane { confirm = true } },
  -- Reload configuration
  { key = 'r', mods = 'CMD|SHIFT', action = act.ReloadConfiguration },
  -- Copy/Paste
  { key = 'c', mods = 'CMD', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },
}

-- Shell integration
config.automatically_reload_config = true
config.default_prog = { '/opt/homebrew/bin/fish' }
config.launch_menu = {
  {
    label = '🐟 Fish',
    args = { '/opt/homebrew/bin/fish', '-l' },
  },
  {
    label = '⌨️  Zsh',
    args = { '/bin/zsh', '-l' },
  },
}

-- Scrollback
config.scrollback_lines = 10000
config.enable_scroll_bar = true

-- Terminal bell
config.audible_bell = "Disabled"

-- Working directory
config.default_cwd = wezterm.home_dir

-- URL handling
config.hyperlink_rules = {
  -- Linkify URLs with http/https
  {
    regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
    format = '$0',
  },
  -- Make username/project paths clickable
  {
    regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    format = 'https://www.github.com/$1/$3',
  },
}

return config
