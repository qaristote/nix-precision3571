{ pkgs, ... }:

let
  statusPackage =
    pkgs.personal.barista.override { i3statusGo = ./i3status.go; };
in {
  xsession.windowManager.i3.config.bars = [{
    statusCommand = "${statusPackage}/bin/i3status";
    fonts = {
      names = [ "roboto" ];
      size = 11.0;
    };
    colors.background = "#111111";
  }];

  # (Miscellaneous) Tray icons
  services.blueman-applet.enable = true;
}
