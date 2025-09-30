{ config, pkgs, ... }:
{
  # Link misc files
  home.file = { };

  # Link xdg config files (~/.config/<file>)
  xdg.configFile = {
    "niri/config.kdl".source = ../configs/niri/config.kdl;
    "xkb/shaw-jafl.xkm".source = ../configs/xkb/shaw-jafl.xkm;
    "xkb/shaw-jafl.xkb".source = ../configs/xkb/shaw-jafl.xkb;
  };
}
