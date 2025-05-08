# options.nix
# Nixvim global option settings
{ 
  # Let Home manager manage Neovim
  programs.nixvim = {
    enable = true;

    # Set as default editor
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    colorschemes.gruvbox.enable = true;
    plugins.lualine.enable = true;

    # Set global options
    globals = {
      mapleader = "º";
    };

    # Set local options
    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2; # Tab width should be 2
    };
  };
}
