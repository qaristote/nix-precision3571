{lib, ...}: {
  personal.nix = {
    enable = true;
    autoUpgrade = {
      enable = true;
      autoUpdateInputs = [
        "precision-3571/home-manager"
        "precision-3571/my-nixpkgs"
        "precision-3571/nixos-hardware"
        "precision-3571/nixpkgs"
        "precision-3571/stylix"
      ];
    };
    flake = "git+file:///etc/nixos";
    gc.enable = true;
    remoteBuilds = {
      enable = true;
      machines.hephaistos = {
        enable = true;
        domain = "local";
        speedFactor = 1;
        require = false;
      };
    };
  };

  systemd.services.flake-update = {
    preStart = lib.mkAfter ''
      pushd /home/qaristote/code/nix/machines/precision-3571
      git status
      popd
    '';
    environment.HOME = "/root";
  };
}
