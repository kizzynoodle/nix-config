# user.nix
# User module for system, further elaborated in home manager module
# TODO: Use user module to pass specific user to each host
{ inputs, user, homeStateVersion, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs homeStateVersion user; };
    users = {
      "${user}" = import ./../../home-manager/home.nix;
    };

    # Backup file extension in case of overwriting
    # TODO: Fix stylix backups
    backupFileExtension = "backup";
  };
}
