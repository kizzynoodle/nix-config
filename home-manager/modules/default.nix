{
  imports = [
    # Home manager packages
    ./packages.nix

    # Specific package modules
    ./kitty.nix
    ./git.nix
    ./nvf.nix
    ./shell.nix
    ./stylix.nix
  ];
}
