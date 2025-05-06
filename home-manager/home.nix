# home.nix
# Home manager configuration, import modules, set up basics
{ config, pkgs, ... }:

{
  # Import modules
  imports = [
    ./modules/default.nix
  ];

  home = {
    # Paths managed by home manager
    username = "kizzy";
    homeDirectory = "/home/kizzy";

    # Home manager release configuration was written in
    stateVersion = "24.11"; 
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
