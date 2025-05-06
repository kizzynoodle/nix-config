# shell.nix
# Shell configuration for home manager, default shell and plugins
{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Bash
  # TODO: 
  programs.bash = {
    enable = true;
  };

  # Enable starship
  # TODO: Add auto completion and other shenanigans
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
}
