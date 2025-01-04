{ config, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "onedark-nobg";
      editor = {
        line-number = "relative";
        undercurl = true;
        indent-guides.render = true;
        color-modes = true;
        bufferline = "multiple";

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        statusline = {
          left = [ 
            "mode" 
            "spinner" 
            "file-name" 
            "read-only-indicator"
            "file-modification-indicator" 
            "version-control"
          ];
          center = [];
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "file-encoding"
          ];
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
      };

      keys = {
        normal = {
          space."." = "file_picker_in_current_buffer_directory";
          space.w = ":w";
          space.q = ":q";
          esc = [ "collapse_selection" "keep_primary_selection" ];
        };
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
      nixd

      # rust
      rust-analyzer
      rustfmt

      # typst
      tinymist
    ];
  };
}
