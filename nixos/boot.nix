{ config, pkgs, ... }:

{
  personal.boot = {
    grub.enable = true;
    efi.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
