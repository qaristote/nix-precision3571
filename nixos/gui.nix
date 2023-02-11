{ config, pkgs, nixpkgs, ... }:

let background-image = config.home-manager.users.qaristote.home.wallpaper;
in {
  personal.gui = {
    enable = true;
    xserver.enable = true;
    i3.enable = true;
  };

  services.xserver = {
    displayManager.lightdm = {
      background = background-image;
      greeters.gtk = {
        extraConfig = ''
          user-background = false
        '';
      };
    };
  };

  programs.steam.enable = true;
}
