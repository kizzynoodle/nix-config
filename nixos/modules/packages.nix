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

  # Install nixvim
  programs.neovim.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Since default desktop environment is Plasma
    # TODO: Move to user package instead of environment package
    kdePackages.kate

    # Install at system level
    home-manager

    # Utils
    vim 
    wget
    git

    # Disk stuff
    gparted

    # Steam stuff
    # TODO: Make it only local for desktop config
    protonup
    # dxvk

    # Environment system packages
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    mako
    libnotify
    wofi
    hyprpaper
    pavucontrol
    qjackctl
  ];
}
