{ config, pkgs, ... }:
{
  cava = {
    enable = true;
    settings = {
      general.framerate = 60;
      input.method = "pipewire";
      color = {
        gradient = 1;
      };
    };
  };
}
