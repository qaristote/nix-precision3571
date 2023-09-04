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

  accounts.email.accounts = {
    work.primary = true;
    university = {
      address = "quentin.aristote@etu.u-paris.fr";
      userName = "quentin.aristote@etu.u-paris.fr";
      realName = "Quentin Aristote";
      imap = {
        host = "outlook.office365.com";
        port = 993;
      };
      smtp = {
        host = "smtp.office365.com";
        port = 587;
        tls.useStartTls = true;
      };
      thunderbird = {
        enable = true;
        profiles = [ "default" ];
      };
    };
  };

  home.file.".spacemacs.d/init.el".source = ./spacemacs.el;

  fonts.fontconfig.enable = true;

  home.packages = lib.optional osConfig.programs.starship.enable pkgs.nerdfonts;
}
