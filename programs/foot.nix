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
        background = "1e2127";
        foreground = "abb2bf";

        regular0 = "5c6370";
        regular1 = "e06c75";
        regular2 = "98c379";
        regular3 = "e5c07b";
        regular4 = "61afef";
        regular5 = "c678dd";
        regular6 = "56b6c2";
        regular7 = "abb2bf";

        bright0 = "5c6370";
        bright1 = "e06c75";
        bright2 = "98c379";
        bright3 = "e5c07b";
        bright4 = "61afef";
        bright5 = "c678dd";
        bright6 = "56b6c2";
        bright7 = "abb2bf";
      };
    };
  };
}
