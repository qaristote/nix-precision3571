{ pkgs }:

{
  barista = pkgs.callPackage ./barista {};
  lockscreen = pkgs.callPackage ./lockscreen {};
  
  firefoxPackages = import ./firefoxPackages { inherit pkgs; };
  fontMetadata = import ./fontMetadata { inherit pkgs; };
  gitignore = import ./gitignore { inherit pkgs; };
  icons = import ./icons { inherit pkgs; };
}
