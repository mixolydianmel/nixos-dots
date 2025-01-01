{ config, pkgs, ... }:
{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 38.3;
    longitude = -77.5;
    temperature = {
      day = 6500;
      night = 1850;
    };
  };
}
