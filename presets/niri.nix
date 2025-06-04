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
    ../programs/bat.nix
    ../programs/bottom.nix
    # ../programs/cava.nix
    # ../programs/eww.nix
    # ../programs/firefox.nix
    ../programs/foot.nix
    ../programs/fuzzel.nix
    ../programs/fzf.nix
    # ../programs/gh.nix
    ../programs/git.nix
    ../programs/helix.nix
    # ../programs/hyprland.nix
    # ../programs/jq.nix
    # ../programs/jujutsu.nix
    # ../programs/lf.nix
    # ../programs/librewolf.nix
    # ../programs/neovim.nix
    ../programs/nix-index.nix
    ../programs/nushell.nix
    # ../programs/obs-studio.nix
    ../programs/ripgrep.nix
    ../programs/starship.nix
    ../programs/zathura.nix
    # ../programs/zed.nix
    ../programs/zen-browser.nix
    inputs.zen-browser.homeModules.beta
    # ../programs/floorp.nix

    # --- User Services ---
    ../services/gammastep.nix
    ../services/mako.nix
    ../services/poweralertd.nix
    # ../services/pueue.nix
    ../services/xdg-portal.nix
  ];

  # Mute news
  news.display = "silent";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
