# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, stateVersion, hostname, user, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Specific modules
      ./steam.nix

      # Generic modules
      ../../nixos/default.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];

  networking.hostName = hostname; # Define your hostname.

  # {{{ DRIVES

  fileSystems."/home/${user}/Games" = {
    # device = "/dev/disk/by-uuid/EA9F-F154";
    device = "/dev/nvme0n1p1";
    fsType = "exfat";
    options = [
      "defaults"
      "users" # Mount and dismount user perm
      #"noatime"
      #"nodiratime"
      "nofail" # No system fail if driver doesn't mount
      "uid=1000"
      "gid=100"
      "utf8"
      #"dmask=027"
      #"fmask=007"
      "rw"
      "exec"
      "umask=000"
      "x-gvfs-show" # Show disk in file explorer
      "X-mount.mkdir" # Make directory if it doesn't exist
    ];
  };

  # }}}

  # {{{ NVIDIA

  nixpkgs.config.nvidia.acceptLisence = true;

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Set Nvidia as primary video driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # Some settings for nvidia
  hardware.nvidia = {
    modesetting.enable = true;

    # Power management stuff disabled
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Newer graphics card has open source Nvidia driver
    open = true;

    # Enable Nvidia settings
    nvidiaSettings = true;

    # Latest package for graphics card (might have to change this as they keep updating)
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  # }}}

  system.stateVersion = stateVersion; # Did you read the comment?

}
