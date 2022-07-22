{ ... }:

{
  services.picom = {
    enable = true;
    fade = true;
    fadeDelta = 4;
    activeOpacity = 1.0;
    inactiveOpacity = 0.9;
    menuOpacity = 0.8;
    shadow = true;
    settings.blur.method = "gaussian";
  };
}
