# stylix.nix
# Themeing home manager options
{ lib, pkgs, ... }:

{
  stylix.targets.kitty.enable = true;

  # TODO: Figure out how to customize qt and gtk through stylix

  # qt options
  qt = {
    enable = true;

    # platform theme "gtk" or "gnome"
    # platformTheme = lib.mkForce "gtk3";

    # Name and package of qt theme
    # style.name = lib.mkForce "gtk3";
  };

  # gtk options
  gtk = {
     enable = true;

    # Set package and name for gtk theme
#    theme = {
#      package = lib.mkForce pkgs.adapta-gtk-theme;
#      name = lib.mkForce "Adapta";
#    };
#
#    # Set name and package for gtk icon theme
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
}
