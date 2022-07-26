{ lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [ "i915.dc_enable=0" ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f5809224-8478-474f-b25d-dde1ada37957";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/330B-45DE";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/8a6efcde-2361-40d5-a341-62188c014618";
    fsType = "ext4";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/0cf1b50c-670c-4dc6-bb91-fc45d6148028"; }];

  hardware.firmware = with pkgs; [ firmwareLinuxNonfree ];
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  programs.steam.enable = true;
}
