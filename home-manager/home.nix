# home.nix
# Home manager configuration, import modules, set up basics
{ inputs, homeStateVersion, user, ... }:

{
  # Import modules
  imports = [
    inputs.nvf.homeManagerModules.default
    ./modules/default.nix
  ];

  home = {
    # Paths managed by home manager
    username = user;
    homeDirectory = "/home/${user}";

    # Home manager release configuration was written in
    stateVersion = homeStateVersion;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
