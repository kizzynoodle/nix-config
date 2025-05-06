# user.nix
# User module for system, further elaborated in home manager module
# TODO: Use user module to pass specific user to each host
{ inputs, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kizzy = {
    isNormalUser = true;
    description = "Kizzy";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "kizzy" = import ./../../home-manager/home.nix;
    };

    # Backup file extension in case of overwriting
    # TODO: Fix stylix backups
    backupFileExtension = "backup";
  };
}
