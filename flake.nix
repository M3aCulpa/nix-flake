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

  outputs = {
    self,
    darwin,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;

    darwinConfig = {
      system.configurationRevision = self.rev or self.dirtyRev or null;
      nixpkgs.hostPlatform = "aarch64-darwin";
      services.nix-daemon.enable = true;
    };

  in {
    darwinConfigurations = {
      mbp = darwin.lib.darwinSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          darwinConfig
          ./hosts/mbp-work
          ./modules
          inputs.home-manager.darwinModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {inherit inputs outputs;};
              users = {
                "johnathanbenge" = import ./home/darwin;
              };
            };
          }
        ];
      };
    };
  };
}
