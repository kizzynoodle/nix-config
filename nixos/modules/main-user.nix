# main-user.nix

{ lib, config, pkgs, ... }:

{
  users.users."kizzy" = {
    isNormalUser = true;
    description = "main user";
    shell = pkgs.bash;
  };
}
