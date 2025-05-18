{ config, pkgs, ... }:
{
  programs.zen-browser = {
    enable = true;
    policies = {
      # NOTE: See https://mozilla.github.io/policy-templates/ for more templates
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = true;
      DisablePocket = true;
    };
    nativeMessagingHosts = [pkgs.firefoxpwa];
  };
}
