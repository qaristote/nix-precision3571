{ pkgs ? import <nixpkgs> { } }:

let
  nur = import (builtins.fetchTarball
    "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  settings = {
    nix.enable = true;
    nativeBuildInputs = [ nur.repos.rycee.firefox-addons-generator ];
  };
in import ~/code/nix/shells { inherit pkgs settings; }
