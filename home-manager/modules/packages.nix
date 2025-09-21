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
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.packages = with pkgs; [

    # Office
    libreoffice
    gimp
    megasync
    mupdf
    sxiv
    xournalpp
    (pkgs.zathura.override { plugins = with pkgs.zathuraPkgs; [ zathura_pdf_mupdf ]; })

    # Communication
    discord
    telegram-desktop
    element-desktop
    signal-desktop
    # TODO: install matrix and element

    # Terminal utils
    bc
    btop
    eza
    fastfetch
    kitty
    kitty-img
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
    starsector
    bs-manager
    spotify
    spotify-player
    spotify-qt
    spotify-cli-linux
    psst
    playerctl
    vlc
    obs-studio
    milkytracker
    freetube

    # Desktop stuff
    wttrbar
    brightnessctl
    celeste
    redact
    protonmail-bridge
    protonmail-bridge-gui
    protonmail-desktop
    chromium
    mullvad-browser

    # Encryption stuff
    proton-pass
    protonvpn-gui
    wireguard-tools

    # Programming
    mytex
    pandoc
    # texlive.combined.scheme-full
    python3
    # python3Full
    # python314Full

    # Formatters
    codespell
    nixfmt-rfc-style
    shfmt
    stylua
    jq
    nodePackages.prettier

    # LSP
    ltex-ls

    # Video editing
    kdePackages.kdenlive
    blueman
    kdePackages.bluedevil
    # davinci-resolve

    # Hardware
    autokey
    input-remapper
    piper
    unetbootin

    # Remarkable
    remarkable-mouse
    rmview
    rmfuse

    # Internet
    qbittorrent-enhanced
  ];
}
