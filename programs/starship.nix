{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };
}
