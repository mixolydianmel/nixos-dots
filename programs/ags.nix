{ config, pkgs, ... }:
{
  programs.ags = {
    enable = true;
    configDir = ../configs/ags;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
