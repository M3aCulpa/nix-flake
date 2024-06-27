{
  myvars,
  lib,
  outputs,
}: let
  username = myvars.username;
  hosts = [
    "mbp"
  ];
in
  lib.genAttrs
  hosts
  (
    name: outputs.darwinConfigurations.${name}.config.home-manager.users.${username}.home.homeDirectory
  )