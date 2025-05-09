# plasma.nix
# Default settings for plasma and its login manager
{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # Specific app rules
    wireplumber.enable = true;
    wireplumber.extraConfig = {
      "pulse.rules" =  {
        # Discord notification sound fix
        matches = [ { "application.process.binary" = "Discord"; } ];
        actions = {
          "update-props" = {
            "pulse.min.quantum" = "1024/48000"; #21ms
          };
        };
      };
    };
  };
}
