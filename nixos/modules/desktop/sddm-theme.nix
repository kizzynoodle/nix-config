# sddm-theme.nix
{ pkgs }:
let
  image = pkgs.fetchurl {
    url =
      "https://gruvbox-wallpapers.pages.dev/wallpapers/anime/wallhaven-2e2xyx.jpg";
    sha256 = "1zw1a8x20bp9mn9lx18mxzgzvzi02ss57r4q1lc9f14fsmzphnlq";
  };
  # image = ./wallpaper.png;
in pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  # version = "1.2";
  # dontBuild = true;
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
  '';
}
