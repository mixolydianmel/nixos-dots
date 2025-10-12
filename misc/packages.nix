{ inputs, config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    beeper
    bottles
    # discord
    fastfetch
    fd
    ffmpeg-full
    gamemode
    # gimp
    # grim
    imagemagick
    imv
    inkscape
    inputs.nix-citizen.packages."${pkgs.system}".star-citizen
    # inputs.zen-browser.packages."${pkgs.system}".twilight
    libreoffice
    # libsForQt5.qt5.qtwayland
    # lutris
    mpv
    musescore
    nb
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
    # slurp
    spotify
    # typst
    # ueberzugpp
    vesktop
    # w3m
    # webcord
    # webcord-vencord
    # winePackages.wayland
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xwayland-satellite
  ];
}
