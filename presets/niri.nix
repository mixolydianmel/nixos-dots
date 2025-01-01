{ inputs, pkgs, ... }:
{
  imports = [
    ../misc/envvars.nix # Environment variables
    ../misc/packages.nix # Unmanaged packages
    ../misc/gtk.nix # GTK theming
    ../misc/files.nix # External files

    # --- User Programs ---
    # ../programs/ags.nix
    # inputs.ags.homeManagerModules.default  # Required for above
    # ../programs/alacritty.nix
    ../programs/bottom.nix
    # ../programs/cava.nix
    # ../programs/eww.nix
    ../programs/firefox.nix
    ../programs/foot.nix
    ../programs/fuzzel.nix
    ../programs/fzf.nix
    # ../programs/gh.nix
    ../programs/helix.nix
    # ../programs/hyprland.nix
    # ../programs/jq.nix
    # ../programs/lf.nix
    ../programs/neovim.nix
    ../programs/nushell.nix
    ../programs/obs-studio.nix
    ../programs/ripgrep.nix
    ../programs/starship.nix
    ../programs/zathura.nix

    # --- User Services ---
    ../services/gammastep.nix
    ../services/mako.nix
    ../services/poweralertd.nix
    ../services/pueue.nix
  ];

  # Mute news
  news.display = "silent";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
