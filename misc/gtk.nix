{ config, pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.whitesur-gtk-theme;
      name = "WhiteSur-Dark-solid";
    };

    cursorTheme = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
      size = 8;
    };

    iconTheme = {
      package = pkgs.whitesur-icon-theme.override {
        alternativeIcons = true;
        boldPanelIcons = true;
      };
      name = "WhiteSur";
    };

    font = {
      package = pkgs.geist-font;
      name = "Geist";
      size = 12;
    };
  };
}
