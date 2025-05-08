# kitty.nix
# Home manager kit config settings

{ lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      dynamic_background_opacity = true;
      background_opacity = "0.9";
      background_blur = 1;
    };
  };
}
