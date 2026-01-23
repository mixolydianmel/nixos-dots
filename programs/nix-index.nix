{ config, pkgs, ... }:
{
  programs.nix-index = {
    enable = true;
    enableNushellIntegration = true;
  };
}
