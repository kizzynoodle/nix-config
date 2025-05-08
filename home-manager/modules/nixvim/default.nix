# default.nix
# Import nixvim configs here
{
  imports = [
    # Import this first (to enable nixvim)
    ./options.nix

    # Import other options after
    ./plugins.nix
    ./keymaps.nix
  ];
}
