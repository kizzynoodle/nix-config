# hyprland.nix
# Necessary xdg portal changes for Hyprland
{ pkgs, inputs, ... }:

{
  programs.hyprland = {
    # Enable hyprland as a NixOS module
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # Screen sharing, folder navigation, etc.
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
