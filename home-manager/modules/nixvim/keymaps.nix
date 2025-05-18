# keymaps.nix
{
  programs.nixvim.keymaps = [
    # TODO:
    {
      action = "<cmd>NvimTreeToggle<CR>";
      key = "<C-t>";
      options = { silent = true; };
    }
  ];
}
