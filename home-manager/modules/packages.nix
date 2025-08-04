# packages.nix
# Kizzy user home manager packages
{ pkgs, ... }:
let
  # mytex = pkgs.texlive.combine {
  #   inherit (pkgs.texlive) scheme-full;
  #   inherit (pkgs.texlive) collection-latexrecommended;
  #   inherit (pkgs.texlive) collection-latexextra; inherit (pkgs.texlive) collection-fontsrecommended;
  #   inherit (pkgs.texlive) collection-fontsextra;
  #   inherit (pkgs.texlive) collection-bibtexextra;
  #   inherit (pkgs.texlive) collection-langcyrillic;
  # };

  mytex = pkgs.texliveFull.withPackages (
    ps: with ps; [
      scheme-full
      collection-latexrecommended
      collection-latexextra
      collection-fontsrecommended
      collection-fontsextra
      collection-bibtexextra
      collection-langcyrillic
      lastpage
    ]
  );
in
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # Office
    libreoffice
    gimp
    megasync
    mupdf
    sxiv
    xournalpp
    zathura

    # Communication
    discord
    telegram-desktop

    # Terminal utils
    bc
    btop
    eza
    fastfetch
    kitty
    megacmd
    neovim-remote
    lunarvim
    ranger
    rustfmt
    speedtest-cli
    unzip
    w3m
    yt-dlp
    zscroll

    # Media
    lutris
    ankama-launcher
    bs-manager
    spotify
    spotify-player
    playerctl
    vlc
    obs-studio

    # Desktop stuff
    wttrbar
    chromium
    protonmail-bridge
    protonmail-bridge-gui
    protonmail-desktop
    proton-pass
    mullvad-browser

    # Programming
    mytex
    pandoc
    python3Full

    # Formatters
    codespell
    nixfmt-rfc-style
    shfmt
    stylua
    jq
    nodePackages.prettier

    # Video editing
    kdePackages.kdenlive
    davinci-resolve

    # Hardware
    autokey
    input-remapper
    piper
    unetbootin
  ];
}
