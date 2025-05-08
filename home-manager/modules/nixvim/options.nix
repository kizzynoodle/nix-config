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

    globalOpts = {
      number = true;
      relativenumber = true;
    };
  };
}
