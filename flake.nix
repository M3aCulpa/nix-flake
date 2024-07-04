{
  description = "JohnnyB's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager, agenix, ... }:
      let
        pkgsDarwin = import darwin { system = "aarch64-darwin"; };

        commonConfig = {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            enable = true;
            homeDirectory = "/Users/johnathanbenge";
            username = "johnathanbenge";
          };
        };

        darwinConfig = {
          imports = [
            home-manager.darwinModules.home-manager
          ];
          system.configurationRevision = self.rev or self.dirtyRev or null;
          services.nix-daemon.enable = true;
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
      in {
        darwinConfigurations = {
          mbp = darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
              darwinConfig
              commonConfig
              ./home/darwin
            ];
          };
        };
    };
}
