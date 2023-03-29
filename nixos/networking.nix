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

  environment.etc."ssl/certs/ens.pem".source = pkgs.fetchurl {
    url = "https://www.tuteurs.ens.fr/internet/USERTrust_RSA_Certification_Authority.pem";
    sha256 = "sha256:ij28uSqxxid2R/4quFNrXJgqu/2x8d9XKOAbkGq6lTo=";
  };
}
