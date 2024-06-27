{
  description = "JohnnyB's nix config for NixOs and macOS";

  outputs = inputs: import ./outputs inputs;

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

    # choose what files and directories to keep between reboots 
    impermanence.url = "github:nix-community/impermanence";

    # generate iso/qcow2/docker =/ ... image from nix config
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # age-encrypted (https://github.com/FiloSottile/age) secrets for NixOS
    agenix = {
      url = "github:ryan4yin/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # git hooks to format nix code before commit
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # maps a directory of nix files into an attribute set - no more manual imports.
    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # private repo with my secrets
    mysecrets = {
      url = "git+ssh://git@github.com/m3aculpa/nix-secrets.git?shallow=1";
      flake = false;
    };

    # my wallpapers
    wallpapers = {
      url = "github:m3aculpa/wallpapers";
      flake = false;
    };

    # my nix user repository
    nix-user = {
      url = "github:m3aculpa/nix-user";
    };
  };
}