{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    beeper
    (blender.override {
      cudaSupport = true;
    })
    calcurse
    deadnix
    fastfetch
    fd
    ffmpeg-full
    gamemode
    gimp
    grim
    imagemagick
    inkscape
    jdk22
    libsForQt5.qt5.qtwayland
    lutris
    mpv-unwrapped
    niri
    nixd
    nixfmt-rfc-style
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
    statix
    steam
    swww
    sxiv
    ueberzugpp
    vesktop
    winePackages.wayland
    wl-clipboard
    xdg-desktop-portal-wlr
    xwayland-satellite
    zellij
  ];
}
