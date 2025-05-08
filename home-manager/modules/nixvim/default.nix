# default.nix
# Import other configs here
{
  # Let Home manager manage Neovim
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

}
