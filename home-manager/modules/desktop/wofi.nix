# wofi.nix
{ user, ... }:

{
  programs.wofi = {
    settings = {
      style = "/home/${user}/.nix-config/home-manager/modules/desktop/wofi.css";
    };
  };
}
