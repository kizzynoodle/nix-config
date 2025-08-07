# steam.nix
# Steam config for gaming setup
{
  config,
  pkgs,
  lib,
  ...
}:
{

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    # package = pkgs.steam.override {
    # withPrimus = true;
    # extraPkgs = pkgs: [ bumblebee glxinfo ];
    # };
  };

  programs.gamemode.enable = true;

  # TODO:
  # Install mangohud
}
