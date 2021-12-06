{ pkgs ? import <nixpkgs> { } }:

let
  nur = import (builtins.fetchTarball
    "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  settings = {
    nativeBuildInputs = [ nur.repos.rycee.firefox-addons-generator ];
  };
in import ~/.config/venv-manager { inherit pkgs settings; }
