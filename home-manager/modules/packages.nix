# packages.nix
# Kizzy user home manager packages
{ pkgs, ... }: {
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
    ranger
    yt-dlp
    megacmd
    speedtest-cli

    # Media
    lutris
    spotify
    spotify-player
    playerctl
    vlc
    ankama-launcher

    # Programming
    texlive.combined.scheme-full
    pandoc
  ];
}
