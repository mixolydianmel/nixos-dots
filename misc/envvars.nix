{ config, pkgs, ... }:

{
  # Environment Vars
  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    ENABLE_VKBASALT = "1";
    QT_QPA_PLATFORMTHEME = "wayland;xcb";
    DISPLAY = ":0";
  };

  xdg.userDirs = {
    enable = true;

    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
  };
}
