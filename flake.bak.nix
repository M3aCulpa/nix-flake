{
  description = "JohnnyB's nix config for NixOs and macOS";

  inputs = {
    # official nix package source & unstable distro
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # macOS nix package source
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # age-encrypted (https://github.com/FiloSottile/age) secrets for NixOS
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # private repo with my secrets
    # mysecrets = {
    #   url = "git+ssh://git@github.com/m3aculpa/nix-secrets.git?shallow=1";
    #   flake = false;
    # };

    # my wallpapers
    # wallpapers = {
    #   url = "github:m3aculpa/wallpapers";
    #   flake = false;
    # };

    # # my nix user repository
    # nix-user = {
    #   url = "github:m3aculpa/nix-user";
    # };
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;

    # nix-darwin
    darwinConfig = {
      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
      # Nixpkgs
      nixpkgs.hostPlatform = "aarch64-darwin";
      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
    };
  in {
    darwinConfigurations = {
      mbp = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          darwinConfig
          ./home/darwin
        ];
      };
    };
  };

}
