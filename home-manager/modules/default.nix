{
  imports = [
    # Home manager packages
    ./packages.nix

    # Nixvim or NVF
    # ./nvf.nix
    ./nixvim/default.nix

    # Desktop modules
    ./desktop/default.nix

    # Specific package modules
    ./kitty.nix
    ./zathura.nix
    ./git.nix
    ./shell.nix
    ./stylix.nix

    # Mounted file systems
    ./ssh.nix
  ];
}
