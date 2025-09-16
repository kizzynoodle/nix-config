# plasma.nix
# Default settings for plasma and its login manager
{ ... }:
{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    # TODO: Uncomment the following line to use a custom theme.
    theme = "breeze";
    # theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  services.desktopManager.plasma6.enable = true;

  # Enable KWallet even outside of KDE Plasma
  security.pam.services.sddm-password.enableKwallet = true;
  # security.pam.services.sddm.enableKwallet = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

}
