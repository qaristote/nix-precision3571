{...}: {
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
    hosts = {
      "10.3.141.1" = ["raspberrypi.local"];
      "192.168.1.10" = ["dionysos.local"];
      "192.168.1.2" = ["kerberos.local"];
    };

    interfaces = {
      enp0s31f6.useDHCP = true;
      wlp0s20f3.useDHCP = true;
    };
  };

  # NAT
  boot.kernel.sysctl = {"net.ipv4.ip_forward" = 1;};
  networking = {
    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalInterface = "wlp2s0";
    };
  };
}
