# nvf.nix
# Basic nfv setup
{ pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    
    settings.vim = {

      # Set alias
      viAlias = true;
      vimAlias = true;

      # Plugins
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      utility.sleuth.enable = true;
      utility.leetcode-nvim.enable = true;
      utility.motion.hop.enable = true;
      utility.multicursors.enable = true;
      utility.snacks-nvim.enable = true;
      visuals.fidget-nvim.enable = true;
      visuals.indent-blankline.enable = true;
      visuals.nvim-cursorline.enable = true;

      # LSP
      languages = {
        enableLSP = true;
        enableTreesitter = true;

        nix.enable = true;
      };
    };
  };
}
