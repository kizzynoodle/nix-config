{
  imports = [
    # Home manager packages
    ./packages.nix

    # Specific package modules
    ./kitty.nix
    ./git.nix
    ./shell.nix
    ./stylix.nix

    # Nixvim or NVF
    # ./nvf.nix
    ./nixvim/default.nix

    # Desktop modules
    ./desktop/default.nix
  ];
}
