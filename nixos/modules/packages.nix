# packages.nix
# Environment packages at system level
{
  config,
  pkgs,
  lib,
  user,
  ...
}:
with pkgs;
let
  patchDesktop =
    pkg: appName: from: to:
    lib.hiPrio (
      pkgs.runCommand "$patched-desktop-entry-for-${appName}" { } ''
        ${coreutils}/bin/mkdir -p $out/share/applications
        ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
      ''
    );
  GPUOffloadApp =
    pkg: desktopName:
    patchDesktop pkg desktopName "^Exec="
      "Exec=/home/${user}/.nix-config/hosts/thinkpad/nvidia-offload ";
in
{
  nix = {
    # Delete older generations automatically
    gc.automatic = true;

    settings = {
      # Deduplicate files in Nix store automatically
      auto-optimise-store = true;

      # Enable experimental features (such as flakes, home manager, etc.)
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Enable Cachix to avoid rebuilding Hyprland
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };

  # Enable networking package (network manager)
  networking.networkmanager.enable = true;

  # Some programs
  programs = {
    firefox.enable = true;
    nixvim.enable = true;
  };

  # VirtualBox, with guest additions and extension pack
  users.extraGroups.vboxusers.members = [ "${user}" ];
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
      enableKvm = true;
      addNetworkInterface = false;
    };
    guest = {
      enable = true;
      dragAndDrop = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # SDDM config
    kdePackages.sddm-kcm

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
    (GPUOffloadApp steam "steam")
    protonup
    protontricks
    wineWowPackages.waylandFull
    winetricks
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
    hyprpolkitagent
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    networkmanagerapplet

    # Media stuff
    pavucontrol
    qjackctl
    mpv

    # Fonts
    nerd-fonts.terminess-ttf
  ];
}
