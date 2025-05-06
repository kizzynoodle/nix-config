# packages.nix
# Kizzy user home manager packages
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    
    # Office
    libreoffice
    neovim
    megasync
    xournalpp
    zathura
    
    # Communication
    discord
    telegram-desktop

    # Desktop utils
    kitty
    fastfetch

    # Programming
    texlive.combined.scheme-full

  ];
}
