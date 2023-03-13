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
    hostName = "latitude-7280";

    interfaces = {
      enp0s31f6.useDHCP = true;
      wlp2s0.useDHCP = true;
    };
  };
}
