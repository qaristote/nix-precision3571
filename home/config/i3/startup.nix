{ config, pkgs, ... }:

let background-image = config.home.wallpaper;
in {
  xsession.windowManager.i3.config.startup = let
    autostart = { command, always ? false, notification ? false }: {
      inherit command always notification;
    };
  in (if (config.services.redshift.enable) then
    [ (autostart { command = "systemctl --user start redshift"; }) ]
  else
    [ ]) ++ (if background-image != null then
      [
        (autostart {
          command = "${pkgs.feh}/bin/feh --bg-scale ${background-image}";
        })
      ]
    else
      [ ]) ++ (if config.services.screen-locker.enable then
        [
          (autostart {
            command =
              "systemctl --user start xautolock-session.service xss-lock.service";
          })
        ]
      else
        [ ]) ++ (if config.services.emacs.enable then
          [ (autostart { command = "systemctl --user start emacs.service"; }) ]
        else
          [ ]) ++ [
            # Launch frequently used apps
            (autostart { command = "thunderbird"; })
            (autostart { command = "signal-desktop"; })
            (autostart { command = ''i3-msg "workspace 10; exec keepassxc"''; })
          ];
}
