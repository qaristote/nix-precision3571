{ pkgs }:

{
  fontawesome = pkgs.callPackage ./fontawesome.nix { };
  material-design-icons = pkgs.callPackage ./material-design-icons.nix { };
}
