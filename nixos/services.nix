{ lib, config, pkgs, ... }:

{
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  systemd.services = {
    nix-gc-remove-dead-roots = {
      enable = true;
      description = "Remove dead symlinks in /nix/var/nix/gcroots";

      serviceConfig.Type = "oneshot";

      script = "find /nix/var/nix/gcroots -xtype l -delete";

      before = lib.mkIf config.nix.gc.automatic [ "nix-gc.service" ];
      wantedBy = lib.mkIf config.nix.gc.automatic [ "nix-gc.service" ];
    };

    nixos-upgrade.unitConfig = {
      CPUWeight = 1;
    };
  };

  # virtualisation.docker.enable = true;
}
