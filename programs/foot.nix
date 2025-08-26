{ config, pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "${pkgs.nushell}/bin/nu";
        login-shell = "no";

        term = "xterm-256color";

        font = "JetBrainsMono Nerd Font:size=11";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = 1.0;
        background = "1e1e1e";
        foreground = "d4d4d4";

        regular0 = "1e1e1e";
        regular1 = "f44747";
        regular2 = "608b4e";
        regular3 = "d6ba7d";
        regular4 = "569cd6";
        regular5 = "c586c0";
        regular6 = "4ec9b0";
        regular7 = "808080";

        bright0 = "3a3d41";
        bright1 = "d16969";
        bright2 = "b5cea8";
        bright3 = "dcdcaa";
        bright4 = "9cdcfe";
        bright5 = "e5b6e0";
        bright6 = "6ee9d0";
        bright7 = "d4d4d4";
      };
    };
  };
}
