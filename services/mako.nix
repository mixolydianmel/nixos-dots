{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      background-color = "#1e2127ff";
      text-color = "#abb2bfff";

      border-size = 2;
      border-radius = 10;
      border-color = "#c678ddff";

      default-timeout = 5000;

      font = "Nacelle 14";
    };
  };
}
