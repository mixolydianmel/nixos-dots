{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    beeper
    # (blender.override {
    #   cudaSupport = true;
    # })
    bluetui
    # bottles
    # davinci-resolve
    # discord
    duf
    dust
    fastfetch
    fd
    ffmpeg-full
    gamemode
    # gimp
    # imagemagick
    impala
    imv
    inkscape
    libreoffice
    librewolf
    # libsForQt5.qt5.qtwayland
    mpv
    musescore
    # nb
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
    spotify
    # typst
    # ueberzugpp
    # (unityhub.override {
    #   extraPkgs = upkgs: [
    #     upkgs.harfbuzz
    #     upkgs.libogg
    #   ];
    # })
    vesktop
    # w3m
    # webcord
    # webcord-vencord
    # winePackages.wayland
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xorg.libXtst
    xwayland-satellite
  ];
}
