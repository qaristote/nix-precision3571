{ config, pkgs, ... }:

{
  networking.hostName = "latitude-7490";

  # NetworkManager
  environment.systemPackages = with pkgs; [ networkmanager ];
  networking.networkmanager = {
    enable = true;
    unmanaged = [ "interface-name:ve-*" ];
  };

  # Hosts
  networking.hosts = {
    "10.3.141.1" = [ "raspberrypi.local" ];
    # "10.233.1.2" = [ "searx.aristote.fr" "quentin.aristote.fr" "aristote.fr" ];
  };

  # DHCP
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # NAT
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
  };
  networking = {
    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "tun0";
    };
  };

  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      # Syncthing
      22000
    ];
    allowedTCPPortRanges = [
      # KDEConnect
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPorts = [
      # Syncthing
      22000
      21027
      # Wireguard
      # 51820
    ];
    allowedUDPPortRanges = [
      # KDE Connect
      {
        from = 1714;
        to = 1764;
      }
    ];
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
