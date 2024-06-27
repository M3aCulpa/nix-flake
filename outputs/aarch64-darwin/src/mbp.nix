{
  # NOTE: the args not used in this file CAN NOT be removed!
  # because haumea passes arguments lazily,
  # these arguments are used in the functions like `mylib.nixosSystem`, `mylib.colmenaSystem`, etc.
  inputs,
  lib,
  mylib,
  myvars,
  system,
  genSpecialArgs,
  ...
} @ args: let
  name = "mbp";

  modules = {
    darwin-modules =
      (map mylib.relativeToRoot [
        "secrets/darwin.nix"
        "modules/darwin"
        # host specific
        # "hosts/darwin-${name}"
      ])
      ++ [];
    home-modules = map mylib.relativeToRoot [
      "hosts/darwin-${name}/home.nix"
      "home/darwin"
    ];
  };

  systemArgs = modules // args;
in {
  # macOS's configurations
  darwinConfigurations.${name} = mylib.macosSystem systemArgs;
}