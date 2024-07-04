{pkgs, ...}:
###########################################################
#
# Wezterm Configuration
#
#   1. Increase Font Size: `cmd + shift + =` | `cmd + shift + +`
#   2. Decrease Font Size: `cmd + shift + -` | `cmd + shift + _`
#   3. And Other common shortcuts such as Copy, Paste, Cursor Move, etc.
#
# Default Keybindings: https://wezfurlong.org/wezterm/config/default-keys.html
#
###########################################################
{
  # wezterm has catppuccin theme built-in,

  programs.wezterm = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = let
      fontsize =
        if pkgs.stdenv.isLinux
        then "13.0"
        else "14.0";
    in ''
      -- Pull in the wezterm API
      local wezterm = require 'wezterm'

      -- This table will hold the configuration.
      local config = {}

      -- In newer versions of wezterm, use the config_builder which will
      -- help provide clearer error messages
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      wezterm.on('toggle-opacity', function(window, pane)
        local overrides = window:get_config_overrides() or {}
        if not overrides.window_background_opacity then
          overrides.window_background_opacity = 0.93
        else
          overrides.window_background_opacity = nil
        end
        window:set_config_overrides(overrides)
      end)

      wezterm.on('toggle-maximize', function(window, pane)
        window:maximize()
      end)

      -- This is where you actually apply your config choices
      config.color_scheme = "Catppuccin Mocha"
      config.font = wezterm.font_with_fallback {
        "Iosevka",
        "Mononoki",
      }

      config.hide_tab_bar_if_only_one_tab = true
      config.scrollback_lines = 10000
      config.enable_scroll_bar = true
      config.term = 'wezterm'

      config.keys = {
        -- toggle opacity(CTRL + SHIFT + B)
        {
          key = 'B',
          mods = 'CTRL',
          action = wezterm.action.EmitEvent 'toggle-opacity',
        },
        {
          key = 'M',
          mods = 'CTRL',
          action = wezterm.action.EmitEvent 'toggle-maximize',
        },
      }
      config.font_size = ${fontsize}

      config.default_prog = { '${pkgs.zsh}/bin/zsh'}
      return config
    '';
  };
}