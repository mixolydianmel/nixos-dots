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

        {
          name = "typescript";
          language-servers = ["typescript-language-server" "eslint" "emmet-ls"];
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
          auto-format = true;
        }

        {
          name = "tsx";
          language-servers = ["typescript-language-server" "eslint" "emmet-ls"];
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
          auto-format = true;
        }

        {
          name = "javascript";
          language-servers = ["typescript-language-server" "eslint" "emmet-ls"];
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
          auto-format = true;
        }

        {
          name = "jsx";
          language-servers = [ "typescript-language-server" "eslint" "emmet-ls"];
          formatter = {
            command = "prettier";
            args = ["--parser" "typescript"];
          };
          auto-format = true;
        }

        {
          name = "json";
          formatter = {
            language-servers = ["vscode-json-language-server" "eslint"];
            command = "prettier";
            args = ["--parser" "json"];
          };
          auto-format = true;
        }

        {
          name = "html";
          language-servers = ["vscode-html-language-server" "emmet-ls"];
          formatter = {
            command = "prettier";
            args = ["--parser" "html"];
          };
          auto-format = true;
        }

        {
          name = "css";
          language-servers = ["vscode-css-language-server" "emmet-ls"];
          formatter = {
            command = "prettier";
            args = ["--parser" "css"];
          };
          auto-format = true;
        }
      ];

      language-server = {
        emmet-ls = {
          command = "emmet-ls";
          args = ["--stdio"];
        };

        eslint = {
          command = "vscode-eslint-language-server";
          args = ["--stdio"];
          config = {
            codeActionsOnSave = { mode = "all"; "source.fixAll.eslint" = true; };
            format = { enable = true; };
            nodePath = "";
            quiet = false;
            rulesCustomizations = [];
            run = "onType";
            validate = "on";
            experimental = {};
            problems = { shortenToSingleLine = false; };

            codeAction = {
              disableRuleComment = { enable = true; location = "separateLine"; };
              showDocumentation = { enable = false; };
            };
          };
        };

        vscode-json-language-server.config = {
          json = {
            validate = { enable = true; };
            format = { enable = true; };
          };

          provideFormatter = true;
        };

        vscode-css-language-server.config = {
          css = { validate = { enable = true; }; };
          scss = { validate = { enable = true; }; };
          less = { validate = { enable = true; }; };

          provideFormatter = true;
        };
      };
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
      golangci-lint
      golangci-lint-langserver

      # html
      superhtml
      vscode-langservers-extracted # Also does CSS, JSON, and ESLint
      emmet-ls
      nodePackages.prettier

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
