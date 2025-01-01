{ config, pkgs, ... }:

# FIXME: Deprecated, needs update to use the new file structure.
{
  # User info
  home = {
    username = "melody";
    homeDirectory = "/home/melody";

    stateVersion = "23.11"; # Probably don't change this
  };

  imports = [
    ./envvars.nix
    ./neovim.nix
  ];

  # Install packages
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    cage
    calcurse
    chafa
    fastfetch
    fd
    fff
    ffmpeg-headless
    figlet
    imagemagick
    mono
    mpv-unwrapped
    nodePackages.npm
    pass-wayland
    pfetch
    pulsemixer
    wl-clipboard
  ];

  # Userprogs
  programs = {
    alacritty = {
      enable = true;
      settings = {
        font = {
          normal = {
            family = "BlexMono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "BlexMono Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "BlexMono Nerd Font";
            style = "Italic";
          };
          bold_italic = {
            family = "BlexMono Nerd Font";
            style = "Bold Italic";
          };
          size = 12.0;
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
    bat = {
      enable = true;
      config = {
        theme = "base16";
      };
    };
    btop.enable = true;
    fzf.enable = true;
    gh = {
      enable = true;
      settings = {
        version = 1; # Workaround for https://github.com/nix-community/home-manager/issues/4744
      };
    };
    lf = {
      enable = true;
      settings = {
        number = true;
        relativenumber = true;

        ratios = [
          1
          2
          3
        ];
        tabstop = 4;
      };
      previewer.source = ./lf/pv.sh;
      keybindings = {
        e = "$nvim \"$f\"";
        T = "push $touch<space>";
        M = "push $mkdir<space>";
        A = "&zathura \"$f\"";
        D = ":delete \"$f\"";
      };
    };
    ncspot.enable = true;
    nushell = {
      enable = true;
      configFile.source = ./nushell/config.nu;
      envFile.source = ./nushell/env.nu;
    };
    ripgrep.enable = true;
    starship = {
      enable = true;
      enableNushellIntegration = true;
    };
    zellij = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  news.display = "silent";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
