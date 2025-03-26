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

        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "error";
        };

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
          # display-inlay-hints = true;
        };
      };

      keys = {
        normal = {
          space."." = "file_picker_in_current_buffer_directory";
          space.q = ":q";
          space.l = ":reflow";
          esc = [ "collapse_selection" "keep_primary_selection" ];
          "H" = ":buffer-previous";
          "L" = ":buffer-next";
        };
      };
    };
    themes = {
      onedark-nobg = {
        "inherits" = "onedark";
        "ui.background" = "none";
      };
    };
    languages = {
      grammar = [
        {
          name = "asciidoc";
          source = {
            git = "git@github.com:cathaysia/tree-sitter-asciidoc.git";
            rev = "a94558880d2d5d51659c1d9c2579f21af273cb3d";
            subpath = "tree-sitter-asciidoc";
          };
        }
      ];

      language = [
        {
          name = "asciidoc";
          language-id = "asciidoc";
          scope = "source.adoc";
          injection-regex = "adoc";
          file-types = ["adoc"];
          comment-tokens = ["//"];
          block-comment-tokens = { start = "////"; end = "////"; };
          grammar = "asciidoc";
        }
      ];
    };
    extraPackages = with pkgs; [
      # --- Language Servers ---
      # c / c++
      clang-tools
      # lldb

      # c-sharp
      omnisharp-roslyn
      netcoredbg

      # cmake
      cmake-language-server

      # docker-compose
      docker-compose-language-service
      yaml-language-server

      # dockerfile
      dockerfile-language-server-nodejs

      # glsl
      glsl_analyzer

      # go
      gopls
      golangci-lint-langserver

      # html
      superhtml
      vscode-langservers-extracted # Also does CSS, JSON, and ESLint

      # markdown
      marksman
      markdown-oxide

      # nix
      nil
      nixd

      # rust
      rust-analyzer
      rustfmt

      # typescript
      typescript-language-server

      # typst
      tinymist
    ];
  };
}
