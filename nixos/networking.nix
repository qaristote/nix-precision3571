{ config, pkgs, ... }:

{
  personal.networking = {
    enable = true;
    bluetooth.enable = true;
    networkmanager.enable = true;
    firewall = {
      syncthing = true;
      kdeconnect = true;
    };
  };

  networking = {
    hostName = "precision-3571";

    interfaces = {
      enp0s31f6.useDHCP = true;
      wlp0s20f3.useDHCP = true;
    };
  };
}
