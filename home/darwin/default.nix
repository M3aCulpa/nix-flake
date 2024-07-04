{ config, pkgs, ... }:
{
  home.homeDirectory = "/Users/johnathanbenge";
  imports =
    [ 
      ../base
    ];
}
