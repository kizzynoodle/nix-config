# configuration.nix
# This is a NixOS configuration file for a Lenovo Yoga C930
# - Touchpad support
# - Touch screen suppport
{
  imports = [ # Local host system configurations
    ./hardware-configuration.nix

    # Generic modules
    ../../nixos/default.nix
  ];

  # Bootloader.
  # TODO: Change to grub instead of systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-cb953345-5fb0-4291-b1c8-e530923a98ce".device =
    "/dev/disk/by-uuid/cb953345-5fb0-4291-b1c8-e530923a98ce";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
}
