{ config, pkgs, ... }:
{
  programs.alacritty =
    let
      fontFamily = "JetBrainsMono Nerd Font";
    in
    {
      enable = true;
      settings = {
        window.opacity = 1.0;
        font = {
          normal = {
            family = fontFamily;
            style = "Regular";
          };
          bold = {
            family = fontFamily;
            style = "Bold";
          };
          italic = {
            family = fontFamily;
            style = "Italic";
          };
          bold_italic = {
            family = fontFamily;
            style = "Bold Italic";
          };
          size = 18.0;
        };

        colors = {
          primary = {
            background = "#1e2127";
            foreground = "#abb2bf";
          };
          normal = {
            black = "#5c6370";
            red = "#e06c75";
            green = "#98c379";
            yellow = "#e5c07b";
            blue = "#61afef";
            magenta = "#c678dd";
            cyan = "#56b6c2";
            white = "#abb2bf";
          };
          bright = {
            black = "#5c6370";
            red = "#e06c75";
            green = "#98c379";
            yellow = "#e5c07b";
            blue = "#61afef";
            magenta = "#c678dd";
            cyan = "#56b6c2";
            white = "#ffffff";
          };
        };
      };
    };
}
