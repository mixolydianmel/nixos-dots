{ config, pkgs, ... }:
{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 42.36;
    longitude = -71.05;
    temperature = {
      day = 6500;
      night = 5000;
    };
  };
}
