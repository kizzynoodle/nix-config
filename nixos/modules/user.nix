# user.nix
# User module for system, further elaborated in home manager module
# TODO: Use user module to pass specific user to each host
{ inputs, user, homeStateVersion, pkgs, ... }:

{
  # Enable systemwide for vendor fish completions provided by Nixpkgs
  programs.fish.enable = true;

  # Initialize fish after bash
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" ];
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
