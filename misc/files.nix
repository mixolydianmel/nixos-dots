{ config, pkgs, ... }:
{
  # Link misc files
  home.file = { };

  # Link xdg config files (~/.config/<file>)
  xdg.configFile = {
    "niri/config.kdl".source = ../configs/niri/config.kdl;
    "xkb/shaw-imperial.xkb".source = ../configs/xkb/shaw-imperial.xkb;
  };
}
