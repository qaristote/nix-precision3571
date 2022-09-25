{ pkgs ? import <nixpkgs> { } }:

let settings = { golang.enable = true; };
in import ~/.config/venv-manager { inherit pkgs settings; }
