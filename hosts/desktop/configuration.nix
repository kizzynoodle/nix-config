# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, stateVersion, hostname, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Specific modules
    ./steam.nix

    # Generic modules
    ../../nixos/default.nix
  ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    # Grub
    grub = {
      enable = true;
      useOSProber = true;
      # device = "/dev/sda";
      device = "nodev";
      efiSupport = true;
    };
  };
  # boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];

  networking.hostName = hostname; # Define your hostname.

  # {{{ NVIDIA

  nixpkgs.config.nvidia.acceptLisence = true;

  # Set Nvidia as primary video driver
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
        vdpauinfo
        libva
        libva-utils
      ];
    };

    # Some settings for nvidia
    nvidia = {
      modesetting.enable = true;

      # Power management disabled on desktop
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      # TODO: Figure out
      nvidiaPersistenced = false;

      # Newer graphics card has open source Nvidia driver
      # Current alpha-quality is buggy, so set false by recommended
      open = false;

      # Enable Nvidia settings
      nvidiaSettings = true;

      # Latest package for graphics card (might have to change this as they keep updating)
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  environment.sessionVariables = {
    # Cursor invisibility problems
    WRL_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  # Hyprland tweaks for Nvidia
  programs.hyprland = { xwayland.enable = true; };

  # }}}

  system.stateVersion = stateVersion; # Did you read the comment?

}
