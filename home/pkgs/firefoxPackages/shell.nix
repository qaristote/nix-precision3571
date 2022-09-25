{ pkgs ? import <nixpkgs> { } }:

let
  nur = import (builtins.fetchTarball
    "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  settings = { nativeBuildInputs = [ nur.repos.rycee.mozilla-addons-to-nix ]; };
in import ~/.config/venv-manager { inherit pkgs settings; }
