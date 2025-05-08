# plugins.nix
# Nixvim plugin import
{
  programs.nixvim.plugins = {
    # Status bar
    lualine.enable = true;
    
    # Icons
    web-devicons.enable = true;

    # Sets tab width based on current file
    sleuth.enable = true;


    # Lazygit
    lazygit.enable = true;

    # Git signs in code
    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    # Nix expressions in neovim
    nix.enable = true;
  };
}
