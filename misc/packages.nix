{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    beeper
    # (blender.override {
    #   stdenv = pkgs.gcc13Stdenv;
    #   cudaSupport = true;
    # })
    calcurse
    fastfetch
    fd
    ffmpeg-full
    gamemode
    gimp
    grim
    imagemagick
    imv
    inkscape
    jdk21
    libsForQt5.qt5.qtwayland
    lutris
    mpv-unwrapped
    niri
    nvtopPackages.full
    p7zip
    pass-wayland
    pfetch
    prismlauncher
    pulsemixer
    qpwgraph
    qt6.qtwayland
    ripdrag
    sc-im
    slack
    slurp
    spotify
    steam
    ueberzugpp
    vesktop
    winePackages.wayland
    wl-clipboard
    xdg-desktop-portal-wlr
    xwayland-satellite
  ];
}
