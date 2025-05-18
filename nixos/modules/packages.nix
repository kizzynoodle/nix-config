# packages.nix
# Environment packages at system level
{ pkgs, ... }: {
  nix = {
    # Delete older generations automatically
    gc.automatic = true;

    settings = {
      # Deduplicate files in Nix store automatically
      auto-optimise-store = true;

      # Enable experimental features (such as flakes, home manager, etc.)
      experimental-features = [ "nix-command" "flakes" ];

      # Enable Cachix to avoid rebuilding Hyprland
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };

  # Enable networking package (network manager)
  networking.networkmanager.enable = true;

  # Install firefox.
  programs.firefox.enable = true;
  # programs.brave.enable = true;
  # programs.librewolf.enable = true;

  # Install nixvim
  programs.nixvim.enable = true;

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

    # Browsers
    librewolf
    brave

    # Utils
    vim
    curl
    wget
    git

    # Disk stuff
    gparted

    # Steam stuff
    # TODO: Make it only local for desktop config
    protonup
    # dxvk

    # Programming
    cargo
    rustc
    clang
    cmake
    nodejs

    # Desktop stuff
    # TODO: Move over to 
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    mako
    libnotify
    wofi
    hyprpaper
    hyprshot
    hyprlock
    hypridle
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects

    # Media stuff
    pavucontrol
    qjackctl
    mpv

    # Fonts
    nerd-fonts.terminess-ttf
  ];
}
