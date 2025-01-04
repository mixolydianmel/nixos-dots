{ config, pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "mixolydianmel@proton.me";
        name = "Melody Henrich";
      };

      signing = {
        sign-all = true;
        backend = "gpg";
        key = "mixolydianmel@proton.me";
      };
    };
  };
}
