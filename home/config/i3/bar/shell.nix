{ pkgs ? import <nixpkgs> { } }:

let settings = { golang.enable = true; pinDerivations.enable = false; };
in import ~/.config/venv-manager { inherit pkgs settings; }
