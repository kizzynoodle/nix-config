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
    w3m

    # Media
    lutris
    ankama-launcher
    spotify
    spotify-player
    playerctl
    vlc
    obs-studio

    # Desktop stuff
    wttrbar

    # Programming
    texlive.combined.scheme-full
    pandoc
  ];
}
