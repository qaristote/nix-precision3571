{ config, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi = { canTouchEfiVariables = true; };
    grub = {
      enable = true;
      version = 2;
      efiSupport = true;
      enableCryptodisk = true;
      device = "nodev";
      # extraEntries =
      #   # Recovery mode
      #   # Generate the image with generate-recovery.sh
      #   ''
      #   menuentry "NixOS - Recovery" {
      #   search --set=drive1 -fs-uuid 330B-45DE 
      #          linux ($drive1)//kernels/recovery-linux-bzImage loglevel=4
      #          initrd ($drive1)//kernels/recovery-initrd
      #   }
      #   '';
    };
  };

  # Decrypt disk
  boot.initrd.luks.devices = {
    sda3_crypt = {
      name = "sda3_crypt";
      device = "/dev/disk/by-uuid/ba5dc9cd-3a73-4a01-880b-8720844307ae";
      preLVM = true;
    };
  };
}
