{ lib, config, pkgs, ... }:

let
  userService = user: {
    serviceConfig.User = user;
    environment.HOME = config.users.users."${user}".home;
  };
in {
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  systemd.services = {
    direnv-reload = {
      enable = true;
      description = "Update virtual environments of user qaristote";

      restartIfChanged = false;
      unitConfig.X-StopOnRemoval = false;
      serviceConfig.Type = "oneshot";

      environment.NIX_PATH = config.environment.sessionVariables.NIX_PATH;

      path = with pkgs; [ direnv ];
      script =
        "find $HOME -type d -name .nix-gc-roots -execdir direnv exec . true \\;";

      after =
        lib.mkIf config.system.autoUpgrade.enable [ "nixos-upgrade.service" ];
      requiredBy =
        lib.mkIf config.system.autoUpgrade.enable [ "nixos-upgrade.service" ];
    } // (userService "qaristote");
    direnv-prune = {
      enable = true;
      description = "Clean virtual environments of user qaristote";

      serviceConfig.Type = "oneshot";

      path = with pkgs; [ direnv ];
      script = "find $HOME -type d -name .direnv -execdir direnv prune \\;";

      after = [ "direnv-reload.service" ];
      before = lib.mkIf config.nix.gc.automatic [ "nix-gc.service" ];
      requiredBy = lib.mkIf config.nix.gc.automatic [ "nix-gc.service" ];
    } // (userService "qaristote");
  };

  # virtualisation.docker.enable = true;
}
