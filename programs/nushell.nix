{ config, pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    configFile.source = ../configs/nushell/config.nu;
    envFile.source = ../configs/nushell/env.nu;
  };
}
