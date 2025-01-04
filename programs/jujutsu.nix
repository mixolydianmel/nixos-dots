{ config, pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "mixolydianmel@proton.me";
        name = "Melody Henrich";
      };
    };
  };
}
