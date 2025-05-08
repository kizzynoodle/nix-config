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
      # Show relative line numbers
      number = true;
      relativenumber = true;

      # Set tab to 2 spaces
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };
  };
}
