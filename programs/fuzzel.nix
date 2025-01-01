{ config, pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";

        anchor = "center";
        layer = "overlay";

        font = "JetBrainsMono Nerd Font:size=14";
        use-bold = "yes";
        dpi-aware = "yes";
        icons-enabled = "no";
      };

      colors = {
        background = "1e2127ee";
        text = "5c6370ff";
        prompt = "c678ddff";
        input = "abb2bfff";
        match = "c678ddff";
        selection = "5c6370ff";
        selection-text = "abb2bfff";
        selection-match = "c678ddff";
        border = "c678ddff";
      };

      border = {
        width = 4;
        radius = 5;
      };
    };
  };
}
