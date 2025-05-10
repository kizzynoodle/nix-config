# keymaps.nix
{
  programs.nixvim.keymaps = [
    # TODO:
    {
      action = "<cmd>NvimTreeToggle<cr>";
      key = "<C-t>";
      options = { silent = true; };
    }
  ];
}
