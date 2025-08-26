{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      background-color = "#1e1e1eff";
      text-color = "#d4d4d4ff";

      border-size = 1;
      border-radius = 15;
      border-color = "#606060ff";

      width = 400;
      padding = "10,20";
      outer-margin = "10,0";

      default-timeout = 5000;

      font = "Geist 14";
    };
  };
}
