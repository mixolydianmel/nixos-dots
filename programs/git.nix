{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Melody Henrich";
        email = "mixolydianmel@proton.me";
      };
    };
  };
}
