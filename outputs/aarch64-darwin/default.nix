{
  lib,
  inputs,
  ...
} @ args: let
  inherit (inputs) haumea;

  # contains all flake outputs of this system architecture.
  lib = haumea.lib.load {
    src = ./src;
    inputs = args;
  };
  # nix file names are redundant, so we remove it.
  libWithoutPaths = builtins.attrValues lib;

  # Merge all lib into a single attribute set.
  outputs = {
    darwinConfigurations = lib.attrsets.mergeAttrsList (map (it: it.darwinConfigurations or {}) libWithoutPaths);
  };
in
  outputs
  // {
    inherit lib; # for debugging purposes

    # unit tests.
    evalTests = haumea.lib.loadEvalTests {
      src = ./tests;
      inputs = args // {inherit outputs;};
    };
  }