{ config, pkgs, lib, ... }:

{
  imports = [ ./bar ./keybindings.nix ./startup.nix ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      assigns = {
        "8: media" = [{ class = "^Steam$"; }];
        "9: social" = [
          { class = "^Mail$"; }
          { class = "^thunderbird$"; }
          { class = "^Signal$"; }
        ];
      };

      window.border = 0;
      gaps = {
        inner = 15;
        outer = 5;
      };
    };
  };

  home.file.".config/i3/i3status.sh" = {
    text = ''
      #!${pkgs.bash}/bin/sh
      ${pkgs.i3status}/bin/i3status | while :
      do
        read line
        echo "☼ $(${pkgs.brightnessctl}/bin/brightnessctl -m | cut -d',' -f4) |\
             $line" || exit 1
      done
    '';
    executable = true;
  };
}
