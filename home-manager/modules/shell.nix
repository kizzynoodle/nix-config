# shell.nix
# Shell configuration for home manager, default shell and plugins
{ config, lib, user, ... }:

{
  home.sessionVariables = { EDITOR = "nvim"; };

  # Fish
  programs.fish = {
    enable = true;

    # Enable starship at launch
    interactiveShellInit = ''
      # Start starship
      starship init fish | source

      # viMode
      fish_vi_key_bindings

      # Disable fish greeting
      set fish_greeting
    '';

    # Shell alises
    shellAliases = {
      ls = "eza --icons";
      "desktop-switch" =
        "sudo nixos-rebuild --upgrade --flake /home/${user}/.nix-config/#desktop switch";
      "yoga-switch" =
        "sudo nixos-rebuild --upgrade --flake /home/${user}/.nix-config/#yoga switch";
    };
  };

  # Enable starship
  # TODO: Set orange as main highlight color
  programs.starship = {
    enable = true;
    settings = { add_newline = false; };
  };
}
