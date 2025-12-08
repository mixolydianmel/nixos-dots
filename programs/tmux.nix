{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-nova
    ];
    extraConfig = ''
      # Set colors to 24-bit
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Set prefix key
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      # Window change bindings to Shift+Alt+(H|L)
      bind -n M-H previous-window
      bind -n M-L next-window
    '';
  };
}
