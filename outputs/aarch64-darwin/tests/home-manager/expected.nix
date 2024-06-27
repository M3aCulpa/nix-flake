{
  myvars,
  lib,
}: let
  username = myvars.username;
  hosts = [
    "mbp"
  ];
in
  lib.genAttrs hosts (_: "/Users/${username}")
