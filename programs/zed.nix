{ config, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    # Links to repo names
    # https://github.com/zed-industries/extensions/tree/main/extensions
    extensions = [
      "emmet"
      "superhtml"
      "java"
      "log"
      "make"
      "nix"
      "nu"
      "scss"
      "shader-ls"
      "toml"
      "typst"
      "vscode-dark-plus"
      "vscode-icons"
    ];

    userSettings = {
      theme = {
        mode = "system";
        light = "One Dark";
        dark = "";
      };
      icon_theme = "Zed (Default)";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 18;
      ui_font_family = "Geist";
      ui_font_features = {
        # Disable ligatures:
        calt = false;
      };
      ui_font_size = 18;
      disable_ai = true;
      auto_update = false;
      helix_mode = true;
    };

    # Why would you not do this
    mutableUserKeymaps = false;
    mutableUserSettings = false;
    mutableUserTasks = false;

    extraPackages = with pkgs; [
      # --- Language Servers ---
      # c / c++
      clang-tools
      lldb

      # cmake
      cmake-language-server

      # glsl
      glsl_analyzer

      # go
      gopls
      golangci-lint
      golangci-lint-langserver

      # html
      superhtml
      vscode-langservers-extracted # HTML, CSS, JSON, and ESLint
      emmet-ls
      nodePackages.prettier

      # java
      jdt-language-server

      # markdown
      marksman
      markdown-oxide

      # nix
      nil
      nixd

      # python
      ty

      # rust
      rust-analyzer
      rustfmt
      # lldb already included from cpp

      # typst
      tinymist
      typstyle
    ];
  };
}
