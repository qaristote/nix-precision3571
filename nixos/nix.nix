{ pkgs, ... }:

{
  personal.nix = {
    enable = true;
    autoUpgrade = true;
    flake = "git+file:///etc/nixos";
    gc.enable = true;
  };

  system.autoUpgrade.flags = pkgs.personal.lib.updateInputFlags [
    "latitude-7280/home-manager"
    "latitude-7280/my-nixpkgs"
    "latitude-7280/nixos-hardware"
    "latitude-7280/nixpkgs"
    "latitude-7280/stylix"
  ];
}
