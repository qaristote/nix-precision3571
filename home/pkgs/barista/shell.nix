{ pkgs ? import <nixpkgs> { } }:

let
  settings = {
    nix.enable = true;
    golang.enable = true;
  };
in import ~/documents/nix/shells { inherit pkgs settings; }
