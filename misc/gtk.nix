{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    theme = {
      package = pkgs.juno-theme;
      name = "Juno-mirage";
    };
  };
}
