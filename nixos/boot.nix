{ config, pkgs, ... }:

{
  personal.boot.grub.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
