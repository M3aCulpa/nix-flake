{
  description = "JohnnyB's nix config for NixOS and macOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-darwin, darwin, home-manager, nixos-hardware, agenix, flake-utils, ... }:
    flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"] (system:
      let
        pkgs = import nixpkgs { inherit system; };

        commonConfig = {
          home-manager = {
            enable = true;
            homeDirectory = if system == "aarch64-darwin" || system == "x86_64-darwin" then
              "/Users/johnathanbenge"
            else
              "/home/johnathanbenge";
            username = "johnathanbenge";
          };
        };

        nixosConfig = {
          imports = [
            agenix.nixosModules.agenix
            nixos-hardware.nixosModules.generic
            home-manager.nixosModules.home-manager
          ];

          # Additional NixOS-specific configurations can be added here
          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;
        };

        darwinConfig = {
          imports = [
            darwin.modules.darwin
            home-manager.darwinModules.home-manager
          ];
          system.configurationRevision = self.rev or self.dirtyRev or null;
          services.nix-daemon.enable = true;
          nixpkgs.hostPlatform = system;
        };
      in {
        nixosConfigurations = {
          myNixosSystem = pkgs.lib.nixosSystem {
            inherit system;
            modules = [
              nixosConfig
              commonConfig
              ./home/nixos  # Your custom NixOS-specific configurations
            ];
          };
        };

        darwinConfigurations = {
          mbp = darwin.lib.darwinSystem {
            inherit system;
            modules = [
              darwinConfig
              commonConfig
              ./home/darwin  # Your custom macOS-specific configurations
            ];
          };
        };
      });
}
