# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, stateVersion, hostname, ... }:

{
  imports =
    [ # Local host system configurations
      # TODO: Replace with desktop config
      ./hardware-configuration.nix

      # Generic modules
      ../../nixos/default.nix
    ];

  # TODO: Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-cb953345-5fb0-4291-b1c8-e530923a98ce".device = "/dev/disk/by-uuid/cb953345-5fb0-4291-b1c8-e530923a98ce";

  # Define hostname
  networking.hostName = hostname;

  # Indicates system version at install.
  system.stateVersion = stateVersion;
}
