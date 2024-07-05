let
  johnathanbenge = {
    name = "johnathanbenge";
    home = "/Users/johnathanbenge";
  };
in {
  imports = [
    ./configuration.nix

    ../../settings/darwin
  ];

  darwinSettings = {
    enable = true;
    user = johnathanbenge;
  };

  home-manager.users = {
    "${johnathanbenge.name}" = import ../../home/darwin;
  };
}

