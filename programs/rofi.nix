{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;

    pass = {
      enable = true;
      package = pkgs.rofi-pass-wayland;
    };

    terminal = "${pkgs.kitty}/bin/kitty";
  };
}
