# packages.nix
# Kizzy user home manager packages
{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    
    # Office
    libreoffice
    megasync
    xournalpp
    zathura
    
    # Communication
    discord
    telegram-desktop

    # Terminal utils
    kitty
    fastfetch
    eza

    # Media
    lutris
    spotify

    # Programming
    texlive.combined.scheme-full

  ];
}
