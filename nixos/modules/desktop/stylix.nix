# stylix.nix
# Global stylization for NixOS

{ pkgs, ... }:

{
  # Theming
  stylix = {
    enable = true;
    autoEnable = true;
    image = ./wallpaper2.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";

    targets = {
      plymouth.enable = true;
      grub = {
        enable = true;
        useWallpaper = true;
      };
    };

    # Font
    fonts = {

      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };

      serif = {
        package = pkgs.roboto;
        name = "Roboto";
      };

      sansSerif = {
        package = pkgs.roboto;
        name = "Roboto";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 12;
        terminal = 11;
        popups = 10;
        desktop = 10;
      };
    };

    # Cursor
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };

    # Opacity
    opacity = {
      applications = 1.0;
      terminal = 0.8;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}
