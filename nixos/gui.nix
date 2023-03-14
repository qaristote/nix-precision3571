{ config, pkgs, nixpkgs, ... }:

{
  personal.gui = {
    enable = true;
    xserver.enable = true;
    i3.enable = true;
    stylix.enable = true;
  };

  services.xserver = {
    displayManager.lightdm = {
      greeters.gtk = {
        extraConfig = ''
          user-background = false
        '';
      };
    };
  };
}
