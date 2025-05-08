# shell.nix
# Shell configuration for home manager, default shell and plugins
{ pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
  };


  # Fish
  programs.fish = {
    enable = true;

    # Enable starship at launch
    interactiveShellInit = ''
      # Start starship
      starship init fish | source

      # viMode
      fish_vi_key_bindings
    '';

    # Shell alises
    shellAliases = {
      ls = "eza --icons";
    };
  };

  # Enable starship
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
}
