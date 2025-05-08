# hyprland.nix
# Enable hyprland and use git repo package for it
{ pkgs, lib, inputs, ... }:

{
  # Enable hyprland as a NixOS module
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # TODO: Install the following programs
  # - A status bar
  # - A notification daemon
  # - A search daemon for programs (like rofi)
}
