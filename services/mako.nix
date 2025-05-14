{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;

    backgroundColor = "#1e2127ff";
    textColor = "#abb2bfff";

    borderSize = 2;
    borderRadius = 10;
    borderColor = "#c678ddff";

    defaultTimeout = 5000;

    font = "JetBrainsMono Nerd Font";
  };
}
