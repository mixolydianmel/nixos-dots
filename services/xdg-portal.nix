{ config, pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
      niri = {
        default = [
          "gtk"
          "niri"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [
          "wlr"
        ];
        "org.freedesktop.impl.portal.Screenshot" = [
          "wlr"
        ];
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
    ];
  };
}
