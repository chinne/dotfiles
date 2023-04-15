local wezterm = require 'wezterm'
local act = wezterm.action

return {
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000},
  -- test
  --leader = { key = 'Caps_Lock', timeout_milliseconds = 1000},
  keys = {
    {
      key = 'c',
      mods = 'CTRL',
      action = wezterm.action_callback(function(window, pane)
        local has_selection = window:get_selection_text_for_pane(pane) ~= ''
        if has_selection then
          window:perform_action(
            act.CopyTo 'ClipboardAndPrimarySelection',
            pane
          )

          window:perform_action(act.ClearSelection, pane)
        else
          window:perform_action(
            act.SendKey { key = 'c', mods = 'CTRL' },
            pane
          )
        end
      end),
    },
    -- block mode in vim?
    --{ key = 'v', mods = 'CTRL', action = wezterm.action.Paste },
    {
      key = 'f',
      mods = 'LEADER',
      action = wezterm.action.TogglePaneZoomState,
    },
    {
      key = '\\',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain' },
    },
    {
      key = 'h',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'k',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'j',
      mods = 'LEADER',
      action = act.ActivatePaneDirection 'Down',
    },

  },
  --window_decorations = 'None',
  window_frame = {
    border_left_width = '0.5cell',
    border_right_width = '0.5cell',
  },
  tab_bar_at_bottom = true,
  enable_scroll_bar = true,
  scrollback_lines = 3500,
  adjust_window_size_when_changing_font_size=false,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = 'Catppuccin Frappe',
  font = wezterm.font('JetBrains Mono'),
  font_size = 14,
}
