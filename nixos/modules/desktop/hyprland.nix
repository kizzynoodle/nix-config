# hyprland.nix
# Enable hyprland and use git repo package for it
{ inputs, pkgs, ... }:

{
  # wayland.windowManager.hyprland = {
  programs.hyprland = {
    # Enable hyprland as a NixOS module
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # Screen sharing, folder navigation, etc.
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
