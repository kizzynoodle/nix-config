# shell.nix
# Shell configuration for home manager, default shell and plugins
{ user, ... }:

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
      # Use eza instead of ls for icons
      ls = "eza --icons";
      # Aliases for updating different configurations
      "desktop-switch" =
        "sudo nixos-rebuild --upgrade --flake /home/${user}/.nix-config/#desktop switch";
      "yoga-switch" =
        "sudo nixos-rebuild --upgrade --flake /home/${user}/.nix-config/#yoga switch";
      # To enable bash which in turn enables starship and fish
      "nix-shell" = "nix-shell --command bash";
    };
  };

  # Enable starship
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      # Default deleted icon not available in Nerd Fonts
      git_status = { deleted = ""; };
    };
  };
}
