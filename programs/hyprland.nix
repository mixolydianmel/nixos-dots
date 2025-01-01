# Deprecated: Maintainer is a weirdo and I'm moving on
{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    systemd.enable = true;
    xwayland.enable = true;

    package = pkgs.hyprland;

    settings = {
      monitor = [
        "HDMI-A-1,preferred,auto-right,1"
        "eDP-1,preferred,auto-left,1"
        ",highrr,auto,1"
      ];

      env = [
        "EDITOR,nvim"
        "WLR_NO_HARDWARE_CURSORS,1"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "ENABLE_VKBASALT,1"
        "QT_QPA_PLATFORMTHEME,wayland;xcb"
      ];

      "$mainMod" = "SUPER";

      xwayland = {
        force_zero_scaling = true;
      };

      exec-once = [
        "swww-daemon &"
        "pueued &"
        "swww clear 1e2127"
        "ags &"
      ];

      input = {
        kb_layout = "us";
        kb_options = "compose:ralt";

        follow_mouse = "1";

        touchpad = {
          natural_scroll = "no";
        };

        sensitivity = "0";
        accel_profile = "flat";
      };

      general = {
        gaps_in = "5";
        gaps_out = "15"; # Top,Right,Bottom,Left
        border_size = "2";
        "col.active_border" = "rgba(b578deff) rgba(d878deff) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "master";

        allow_tearing = false;
      };

      decoration = {
        # rounding = "10";

        blur = {
          enabled = false;
          size = "3";
          passes = "1";
        };

        drop_shadow = "no";
        shadow_range = "4";
        shadow_render_power = "3";
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";

        # bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windowsIn,1,3,default,popin 80%"
          "windowsOut,1,3,default,slide,right"
          "windowsMove,1,2,default,slide"
          "workspaces,1,2,default,fade"
          "border, 0, 10, default"
          "borderangle, 0, 8, default"
          "fade, 0, 7, default"
        ];
      };

      windowrulev2 = "noanim,title:(ueberzug)";

      workspace = [
        "1,monitor:HDMI-A-1,default:true"
        "2,monitor:HDMI-A-1"
        "3,monitor:HDMI-A-1"
        "4,monitor:HDMI-A-1"
        "5,monitor:HDMI-A-1"
        "6,monitor:HDMI-A-1"
        "7,monitor:eDP-1"
        "8,monitor:eDP-1,default:true"
        "9,monitor:eDP-1"
        "10,monitor:eDP-1,"
      ];

      misc = {
        force_default_wallpaper = "0";
        disable_hyprland_logo = true;
      };

      bind = [
        "$mainMod, J, layoutmsg, cyclenext"
        "$mainMod, K, layoutmsg, cycleprev"
        "$mainMod, H, layoutmsg, focusmaster"

        "$mainMod, G, togglegroup"

        "$mainMod SHIFT, J,       layoutmsg, swapnext"
        "$mainMod SHIFT, K,       layoutmsg, swapprev"
        "$mainMod SHIFT, return,  layoutmsg, swapwithmaster"
        "$mainMod SHIFT, M,      exit, "
        "$mainMod SHIFT, Q,      killactive, "
        "$mainMod,       V,      togglefloating, "

        "$mainMod,  return, exec, alacritty -e nu"
        "$mainMod,  W,      exec, firefox"
        "$mainMod,       D,      exec, beeper"
        "$mainMod,       N,      exec, alacritty -e nu -e lf"
        "$mainMod,       C,      exec, alacritty -e nu -e calcurse"
        ''$mainMod,       P,      exec, grim -g "$(slurp)" ~/Pictures/screenshots/$(date +"%Y-%m-%d_%H%M%S.png") && wl-copy < ~/Pictures/screenshots/$(date +"%Y-%m-%d_%H%M%S.png")''
        ''$mainMod CTRL,  P,      exec, grim ~/Pictures/screenshots/$(date +"%Y-%m-%d_%H%M%S.png") && wl-copy < ~/Pictures/screenshots/$(date +"%Y-%m-%d_%H%M%S.png")''
        "$mainMod,       S,      exec, spotify"
        "$mainMod SHIFT, D,      exec, hyprctl dispatch exec $(tofi-run)"
        "$mainMod SHIFT, P,      exec, alacritty -e nu -e pulsemixer"
        "$mainMod SHIFT, S,      exec, alacritty -e nu -e btm"

        "$mainMod SHIFT, A,      exec, ~/.scripts/passmenu.bash"
        "$mainMod SHIFT, escape, exec, ~/.scripts/powerctrl.bash"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "$mainMod, I, togglespecialworkspace, magic"
        "$mainMod SHIFT, I, movetoworkspace, special:magic"

        # Fullscreen
        "$mainMod, F, fullscreen"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      cursor = {
        no_hardware_cursors = true;
      };
    };
  };
}
