{ config, pkgs, ... }:
{
  gh = {
    enable = true;
    settings = {
      version = 1; # Workaround for https://github.com/nix-community/home-manager/issues/4744
    };
  };
}
