{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
      size = 11;
    };
    themeFile = "VSCode_Dark";
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

      confirm_os_window_close = false;
      sync_to_monitor = false;

      scrollback_lines = 2000;
    };
  };
}
