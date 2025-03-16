{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Melody Henrich";
    userEmail = "mixolydianmel@proton.me";
  };
}
