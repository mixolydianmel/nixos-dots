{ config, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "onedark-nobg";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
    themes = {
      onedark-nobg = {
        "inherits" = "onedark";
        "ui.background" = "none";
      };
    };
    extraPackages = with pkgs; [
      # --- Language Servers ---
      # c / c++
      clang-tools
      lldb

      # c-sharp
      omnisharp-roslyn
      netcoredbg

      # cmake
      cmake-language-server

      # markdown
      marksman
      markdown-oxide

      # nix
      nil

      # typst
      tinymist
    ];
  };
}
