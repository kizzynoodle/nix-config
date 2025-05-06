{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
  ];

  home = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    username = "kizzy";
    homeDirectory = "/home/kizzy";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
  
    # The home.packages option allows you to install Nix packages into your
    # environment.
    stateVersion = "24.11"; # Please read the comment before changing.
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    
    # Office
    libreoffice
    neovim
    megasync
    xournalpp
    zathura
    
    # Communication
    discord
    telegram-desktop

    # Desktop utils
    kitty
    fastfetch

    # Programming
    texlive.combined.scheme-full

  ];

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

  # Git
  programs.git = {
    enable = true;
    userName = "kizzy";
    userEmail = "kizzytastic@gmail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
