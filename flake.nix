# flake.nix
# NixOS and Home Manager configuration flake
{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #    nvf = {
    #      url = "github:notashelf/nvf";
    #      inputs.nixpkgs.follows = "nixpkgs";
    #    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      homeStateVersion = "24.11";
      user = "kizzy";
      hosts = [
        {
          hostname = "yoga";
          stateVersion = "24.11";
        }
        {
          hostname = "desktop";
          stateVersion = "24.11";
        }
      ];

      makeSystem = { hostname, stateVersion }:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs hostname stateVersion homeStateVersion user;
          };

          modules = [
            ./hosts/${hostname}/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.nixvim.nixosModules.nixvim
          ];
        };
    in {
      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${host.hostname}" =
            makeSystem { inherit (host) hostname stateVersion; };
        }) { } hosts;
    };
}
