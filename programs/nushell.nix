{ config, pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    configFile.source = ../configs/nushell/config.nu;
    environmentVariables = {
      # User Env Vars
      EDITOR="hx";
      DISPLAY=":0";

      # Wayland Env Vars
      WRL_NO_HARDWARE_CURSORS=1;
      LIBVA_DRIVER_NAME="nvidia";
      XDG_SESSION_TYPE="wayland";
      GBM_BACKEND="nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME="nvidia";
      ENABLE_VKBASALT="1";
      QT_QPA_PLATFORMTHEME="wayland;xcb";
    };
  };
}
