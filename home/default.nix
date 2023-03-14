{ config, lib, pkgs, ... }:

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

  home.packages = lib.optional config.programs.starship.enable pkgs.nerdfonts;
}
