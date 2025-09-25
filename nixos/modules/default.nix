{
  imports = [
    ./desktop/default.nix
    ./locale.nix
    ./packages.nix
    ./pipewire.nix
    ./user.nix
    ./system.nix

    # Mount filesystems
    ./ssh.nix
  ];
}
