# packages.nix
# Kizzy user home manager packages
{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # Office
    libreoffice
    gimp
    megasync
    mupdf
    xournalpp
    zathura

    # Communication
    discord
    vesktop
    telegram-desktop

    # Terminal utils
    btop
    eza
    fastfetch
    kitty
    megacmd
    neovim-remote
    ranger
    rustfmt
    speedtest-cli
    w3m
    yt-dlp
    zscroll

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

    # Formatters
    codespell
    shfmt
    stylua
    jq
    nodePackages.prettier

    # Video editing
    kdePackages.kdenlive
    protonmail-desktop
    davinci-resolve-studio
  ];
}
