{ nixos-hardware, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Community-curated hardware configuration
    nixos-hardware.nixosModules.common-cpu-intel
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.common-pc-ssd
  ];

  personal.hardware = {
    usb.enable = true;
    disks.crypted = "/dev/disk/by-uuid/10aefeb6-e479-43cb-9848-53bd788a77ee";
    firmwareNonFree.enable = true;
    keyboard.keyMap = "fr";
    backlights = {
      screen = "intel_backlight";
      keyboard = "dell::kbd_backlight";
    };
    sound.enable = true;
  };

  # https://wiki.archlinux.org/title/Dell_Latitude_7280
  boot.kernelParams = [ "intel_idle.max_cstate=4" ];
}
