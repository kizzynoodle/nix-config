# packages.nix
# Environment packages at system level

{ pkgs, ... }:

{
  # Enable experimental features (such as flakes, home manager, etc.)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking package (network manager)
  networking.networkmanager.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Since default desktop environment is Plasma
    kdePackages.kate

    # Install at system level
    home-manager

    # Utils
    vim 
    wget
    git
  ];
}
