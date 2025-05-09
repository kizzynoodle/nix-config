# hyprland.nix
# Enable hyprland and use git repo package for it
{ inputs, pkgs, ... }:

{
  programs.hyprland = {
    # Enable hyprland as a NixOS module
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # Screen sharing, folder navigation, etc.
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # TODO: Install the following programs
  # - A status bar
  # - A notification daemon
  # - A search daemon for programs (like rofi)
}
