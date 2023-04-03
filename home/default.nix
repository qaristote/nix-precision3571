{ config, lib, pkgs, osConfig, ... }:

{
  personal = {
    profiles = {
      dev = true;
      social = true;
      syncing = true;
    };
    identities = {
      work = true;
    };
  };

  accounts.email.accounts.work.primary = true;

  home.file.".spacemacs.d/init.el".source = ./spacemacs.el;

  fonts.fontconfig.enable = true;

  home.packages = lib.optional osConfig.programs.starship.enable pkgs.nerdfonts ++ [ pkgs.evince ];
  home.shellAliases.VIEWER = "evince";
}
