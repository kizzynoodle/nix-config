# system.nix
# This is a NixOS module that configures the system settings and services
{
  hostname,
  stateVersion,
  pkgs,
  ...
}:
{

  # Hostname and state version defined in the flake.nix file
  networking.hostName = hostname;
  system.stateVersion = stateVersion;

  boot = {
    kernelParams = [
      "kvm.enable_virt_at_load=0"
      # "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    plymouth = {
      enable = true;
      # theme = "rings";
      # themePackages = with pkgs; [
      #   # Install only selected themes
      #   (adi1090x-plymouth-themes.override { theme = "rings"; })
      # ];
    };
    consoleLogLevel = 3;

    initrd.verbose = false;

    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;
  };
}
