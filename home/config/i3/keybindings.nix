{ config, lib, pkgs, ... }:

let
  backgroundImage = config.home.wallpaper;
  lockscreen = pkgs.personal.lockscreen.override { inherit backgroundImage; };
in {
  xsession.windowManager.i3.config = rec {
    modifier = "Mod4";

    keybindings = lib.mkOptionDefault (let
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
      brightnessctlKbd = "${brightnessctl} --device dell:kbd_backlight";
      pactl = "${pkgs.pulseaudio}/bin/pactl";
      rofi = "${pkgs.rofi}/bin/rofi";
    in {
      "${modifier}+Shift+Return" = "exec firefox";
      "${modifier}+Control+Return" = "exec $EDITOR";
      "${modifier}+Shift+e" = "exec i3-msg exit";
      "XF86MonBrightnessUp" = "exec ${brightnessctl} set 5%+";
      "XF86MonBrightnessDown" = "exec ${brightnessctl} set 5%-";
      "XF86AudioRaiseVolume" =
        "exec ${pactl} set-sink-volume @DEFAULT_SINK@ +5%";
      "XF86AudioLowerVolume" =
        "exec ${pactl} set-sink-volume @DEFAULT_SINK@ -5%";
      "XF86AudioMute" = "exec ${pactl} set-sink-mute @DEFAULT_SINK@ toggle";
      "Shift+XF86AudioRaiseVolume" =
        "exec ${pactl} set-source-volume @DEFAULT_SOURCE@ +5%";
      "Shift+XF86AudioLowerVolume" =
        "exec ${pactl} set-source-volume @DEFAULT_SOURCE@ -5%";
      "XF86AudioMicMute" =
        "exec ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle";
      "XF86KbdBrightnessUp" = ''
        exec ${brightnessctlKbd} set \
             $(( $(${brightnessctlKbd} max) - $(${brightnessctlKbd} get) ))
      '';
      "Print" = "exec xfce4-screenshooter";
    } // (if backgroundImage != null then {
      "${modifier}+l" = "exec ${lockscreen}/bin/lockscreen.sh";
    } else
      { }) // (if config.programs.alacritty.enable then {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
      } else
        { }) // (if config.programs.rofi.enable then {
          "${modifier}+d" = ''exec "${rofi} -modi drun,run,window -show drun"'';
          "${modifier}+Shift+d" = "exec ${rofi} -show window";
        } else
          { }) // (if config.services.emacs.client.enable then {
            "${modifier}+Control+r" =
              "exec systemctl --user restart emacs.service";
          } else
            { }));
  };
}
