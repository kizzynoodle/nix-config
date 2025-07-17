# hyprland.nix
# Necessary xdg portal changes for Hyprland
{ pkgs, inputs, ... }:

{
  # Enable through NixOS systemwide, configure through Home Manager
  programs.hyprland = {
    # Enable hyprland as a NixOS module
    enable = true;

    # Use Hyprland flake package
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # Screen sharing, folder navigation, etc.
  xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
}
