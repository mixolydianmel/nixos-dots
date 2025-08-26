{ config, pkgs, ... }: {
  services.wluma = {
    enable = true;
    systemd = {
      enable = true;
      target = "niri-session.target";
    };
  };
}
