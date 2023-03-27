{ pkgs, ... }:

{
  personal.nix = {
    enable = true;
    autoUpgrade = true;
    flake = "git+file:///etc/nixos";
    gc.enable = true;
  };

  system.autoUpgrade.flags = pkgs.personal.lib.updateInputFlags [
    "precision-3571/home-manager"
    "precision-3571/my-nixpkgs"
    "precision-3571/nixos-hardware"
    "precision-3571/nixpkgs"
    "precision-3571/stylix"
  ];
}
