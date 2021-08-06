{ config, pkgs, ... }:

let
  backgroundImage = config.home.wallpaper;
  lockscreen = pkgs.personal.lockscreen.override { inherit backgroundImage; };
in {
  xsession.enable = true;

  # Look and feel
  xsession.pointerCursor = {
    name = "Numix-Cursor-Light";
    package = pkgs.numix-cursor-theme;
  };
  dconf.enable = true;
  home.packages = with pkgs; [ gnome3.dconf ];
  gtk = {
    enable = true;
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.breeze-icons;
    };
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  # Session managment
  services.screen-locker = {
    enable = backgroundImage != null;
    lockCmd = "${lockscreen}/bin/lockscreen.sh";
    inactiveInterval = 5;
  };
}
