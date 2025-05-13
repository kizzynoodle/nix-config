# home.nix
# Home manager configuration, import modules, set up basics
{ inputs, homeStateVersion, user, ... }:

{
  # Import modules
  imports = [
    # inputs.nvf.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/default.nix
  ];

  home = {
    # Paths managed by home manager
    username = user;
    homeDirectory = "/home/${user}";

    # Home manager release configuration was written in
    stateVersion = homeStateVersion;

    sessionVariables = {
      RSPOTIFY_CLIENT_ID = "b4173b1a7dd1474f9cc8817fdf0e8d93";
      RSPOTIFY_CLIENT_SECRET = "c61b9828a6494a57a9097e42f2bbef1c";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
