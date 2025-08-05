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

    extraConfig = {
      pipewire = {
        "92-low-latency" = {
          "context.properties" = {
            # Use the default context properties for pipewire.
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 128;
            "default.clock.min-quantum" = 128;
            "default.clock.max-quantum" = 128;
          };
        };
      };

      pipewire-pulse = {
        "92-low-latency" = {
          context.modules = [
            {
              name = "libpipewire-module-protocol-pulse";
              args = {
                pulse.min.req = "128/48000";
                pulse.default.req = "128/48000";
                pulse.max.req = "128/48000";
                pulse.min.quantum = "128/48000";
                pulse.max.quantum = "128/48000";
              };
            }
          ];
          stream.properties = {
            node.latency = "128/48000";
            resample.quality = 1;
          };
        };

        rules = [
          {
            # Discord notification sound fix
            matches = [
              { "application.process.binary" = "Discord"; }
            ];
            actions = {
              "update-props" = {
                "pulse.min.quantum" = "1024/48000"; # 21 ms
                "pulse.max.quantum" = "1024/48000"; # 21 ms
              };
            };
          }
        ];
      };
    };
  };
}
