{ config, pkgs, ... }:
{
  lf = {
    enable = false;
    settings = {
      number = true;
      relativenumber = true;

      ratios = [
        1
        2
        3
      ];
      tabstop = 4;
    };
    previewer.source = ../configs/lf/pv.sh;
    keybindings = {
      e = ''$nvim "$f"'';
      T = "push $touch<space>";
      M = "push $mkdir<space>";
      A = ''&zathura "$f"'';
      D = '':delete "$f"'';
      w = "$nu";
    };
  };
}
