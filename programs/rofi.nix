{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = false; # true;

    pass = {
      enable = true;
      package = pkgs.rofi-pass-wayland;
    };

    terminal = "${pkgs.kitty}/bin/kitty";
  };
}
