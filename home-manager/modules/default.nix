{
  imports = [
    # Home manager packages
    ./packages.nix

    # Specific package modules
    ./nixvim/default.nix
    ./kitty.nix
    ./git.nix
    ./shell.nix
    ./stylix.nix
  ];
}
