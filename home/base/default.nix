{ config, pkgs, ... }:
{
  imports =
    [
      ./home.nix
      ./terminal.nix
      ./cloud
      ./dev
      ./editors
      ./shells
      ./utility
    ];
}
