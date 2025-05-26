# configuration.nix
# This is a NixOS configuration file for a desktop system
# - NVIDIA graphics card support
# - Dual boot with Windows
# - Steam support
# - Dual monitor setup
{ config, pkgs, ... }: {
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
      #extraEntries = ''
      #  menuentry "Windows 10" {
      #    insmod part_gpt
      #    insmod fat
      #    search --no-floppy --fs-uuid --set=root 0412DACD12DAC2BA
      #    chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      #  };
      #'';
    };
  };
  # boot.extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];

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
}
