# pipewire.nix
# System wide settings for pipewire 
{
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    extraConfig.pipewire-pulse.rules = [
      {
        # Discord notification sound fix
        matches = [ { "application.process.binary" = "Discord"; } ];
        actions = {
          "update-props" = {
            "pulse.min.quantum" = "1024/48000";
          };
        };
      }
    ];
  };
}
