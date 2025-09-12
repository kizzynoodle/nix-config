# configuration.nix
# This is a NixOS configuration file for a desktop system
# - NVIDIA graphics card support
# - Dual boot with Windows
# - Steam support
# - Dual monitor setup
{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Specific modules
    ./steam.nix

    # Generic modules
    ../../nixos/default.nix
  ];

  # {{{ BOOTLADER

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

  # Need to set Thunderbolt to "BIOS Assist Mode"
  boot = {
    kernelParams = [
      "acpi_backlight=native"
      # "snd_hda_intel.dmic_detect=0"
    ];
  };

  # }}}

  # {{{ LAPTOP STUFFS

  # Emulate mouse wheel on trackpoint
  hardware.trackpoint.emulateWheel = true;

  # }}}

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

      # Power management enabled on laptop
      powerManagement.enable = true;
      powerManagement.finegrained = true;

      # TODO: Figure out
      nvidiaPersistenced = false;

      # Newer graphics card has open source Nvidia driver
      # Current alpha-quality is buggy, so set false by recommended
      open = false;

      # Enable Nvidia settings
      nvidiaSettings = true;

      # Latest package for graphics card (might have to change this as they keep updating)
      package = config.boot.kernelPackages.nvidiaPackages.latest;

      prime = {

        #sync.enable = true;

        # Offload mode (better for battery)
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        # Bus ID of the Intel GPU
        intelBusId = "PCI:0:2:0";

        # Bus ID of the NVIDIA GPU
        nvidiaBusId = "PCI:1:0:0";
        #nvidiaBusId = "PCI:14:0:0";
      };
    };
  };

  environment = {

    # Add ~/.local/bin/ to $PATH
    localBinInPath = true;

    sessionVariables = {

      # Cursor invisibility problems
      WRL_NO_HARDWARE_CURSORS = "1";
      # Hint electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };
  };

  # Hyprland tweaks for Nvidia
  programs.hyprland = {
    xwayland.enable = true;
  };

  # }}}
}
