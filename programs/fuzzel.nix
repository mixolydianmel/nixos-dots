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
        background = "1e1e1eff";
        text = "d4d4d4ff";
        prompt = "608b4eff";
        input = "d4d4d4ff";
        match = "569cd6ff";
        selection = "3a3d41ff";
        selection-text = "d4d4d4ff";
        selection-match = "569cd6ff";
        border = "3a3d41ff";
      };

      border = {
        width = 1;
        radius = 15;
      };
    };
  };
}
