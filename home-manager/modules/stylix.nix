# stylix.nix
# Theming home manager options
{ lib, pkgs, ... }:
{
  stylix.targets = {
    kitty.enable = true;
    hyprland.enable = true;
    hyprpaper.enable = true;
    mako.enable = true;
    waybar.enable = true;
    wofi.enable = true;
    zathura = {
      enable = true;
      # style = lib.mkAfter ''
      #   * {
      #     background: rgba(0, 0, 0, 0.2);
      #   }
      # '';
    };
    nixvim = {
      enable = true;

      # TODO: Get it to work
      # plugin = "base16-nvim";

      transparentBackground = {
        main = true;
        numberLine = true;
        signColumn = true;
      };
    };
  };

  # TODO: Figure out how to customize qt and gtk through stylix

  # qt options
  qt = {
    enable = true;

    # platform theme "gtk" or "gnome"
    #platformTheme = lib.mkForce "gtk";

    # Name and package of qt theme
    # style.name = lib.mkForce "gtk";
  };

  # gtk options
  gtk = {
    enable = true;

    # Set package and name for gtk theme
    # theme = {
    #   package = lib.mkForce pkgs.gruvbox-gtk-theme;
    #   name = lib.mkForce "Gruvbox GTK Theme";
    # };

    # Set name and package for gtk icon theme
    iconTheme = {
      # package = pkgs.gruvbox-plus-icons;
      # name = "Gruvbox Plus Dark";
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
}
