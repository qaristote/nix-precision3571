{ config, lib, pkgs, ... }:

let cfg = config.programs.emacs;
in {
  programs.emacs = {
    enable = true;
    # package = pkgs.emacs.overrideAttrs (oldAttrs: rec { nativeComp = true; });
  };
  services.emacs = {
    enable = true;
    client.enable = true;
  };

  home.file.".spacemacs.d/init.el".source = ./dotfiles/spacemacs;

  systemd.user = lib.mkIf cfg.enable {
    services.update-spacemacs = {
      Unit = {
        Description = "Update Spacemacs by pulling the develop branch";
        After = [ "network-online.target" ];
        X-RestartIfChanged = true;
      };

      Service = {
        Type = "oneshot";
        WorkingDirectory = "${config.home.homeDirectory}/.emacs.d/";
        ExecStart =
          "${pkgs.git}/bin/git pull ; ${cfg.package}/bin/emacsclient --eval '(configuration-layer/update-packages)'";
      };

      Install.WantedBy = [ "default.target" ];
    };
    timers.update-spacemacs = {
      Unit = {
        Description = "Run Spacemacs update periodically";
        After = [ "network-online.target" ];
      };

      Timer = {
        Unit = "update-spacemacs.service";
        Persistent = true;
        OnCalendar = "daily";
      };

      Install.WantedBy = [ "default.target" ];
    };
  };
}
