{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
      size = 18;
    };
    settings = {
      disable_ligatures = false;
      enable_audio_bell = false;

      shell = "${pkgs.nushell}/bin/nu";
      shell_integration = "disabled";

      cursor_shape = "block";      
      url_style = "curly";

      remember_window_size = false;
      window_padding_width = 16;
      cursor_blink_interval = 0;

      # background_opacity = 0.8;
      scrollbar_handle_opacity = 0;
      scrollbar_track_opacity = 0;
      scrollbar_track_hover_opacity = 0;

      confirm_os_window_close = 0;
      sync_to_monitor = false;

      scrollback_lines = 2000;

      # colorscheme
      background = "#1e1e1e";
      foreground = "#d4d4d4";

      color0 = "#1e1e1e";
      color1 = "#f44747";
      color2 = "#608b4e";
      color3 = "#d6ba7d";
      color4 = "#569cd6";
      color5 = "#c586c0";
      color6 = "#4ec9b0";
      color7 = "#808080";

      color8  = "#3a3d41";
      color9  = "#d16969";
      color10 = "#b5cea8";
      color11 = "#dcdcaa";
      color12 = "#9cdcfe";
      color13 = "#e5b6e0";
      color14 = "#6ee9d0";
      color15 = "#d4d4d4";
    };
  };
}
