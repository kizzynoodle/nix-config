# packages.nix
# Kizzy user home manager packages
{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # Office
    libreoffice
    gimp
    megasync
    xournalpp
    zathura

    # Communication
    discord
    vesktop
    telegram-desktop

    # Terminal utils
    kitty
    fastfetch
    eza
    btop
    zscroll

    # Media
    lutris
    spotify
    spotify-player
    playerctl

    # Programming
    texlive.combined.scheme-full

  ];
}
