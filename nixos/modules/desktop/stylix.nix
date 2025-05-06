# stylix.nix
# Global stylization for NixOS

{ pkgs, ... }:

{
  # Themeing
  stylix = {
    enable = true;
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
  };
}
