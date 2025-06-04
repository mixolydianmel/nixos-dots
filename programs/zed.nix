{ config, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "TOML"
    ];
    userSettings = {
      telemetry = {
        metrics = false;
      };
      vim_mode = false;
      ui_font_size = 24;
      buffer_font_size = 32;
      theme = {
        mode = "dark";
        dark = "One Dark";
        light = "One Light";
      };
      lsp = {
        rust-analyzer.binary.path = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      };
    };
  };
}
