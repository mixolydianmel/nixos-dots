{ config, pkgs, ... }:
{
  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    dawnTime = "04:00-06:00";
    duskTime = "21:00-23:00";
    temperature = {
      day = 6500;
      night = 2000;
    };
  };
}
