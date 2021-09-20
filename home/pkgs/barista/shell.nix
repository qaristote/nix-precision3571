{ pkgs ? import <nixpkgs> { } }:

let
  settings = {
    nix.enable = true;
    golang.enable = true;
  };
in import ~/code/nix/shells { inherit pkgs settings; }
