{ config, ... }:

{
  time.timeZone = "Europe/Paris";
  location = {
    latitude = 48.856614;
    longitude = 2.3522219;
  };

  i18n = {
    defaultLocale = "fr_FR.utf8";
    extraLocaleSettings.LANG = "en_US.utf8";
  };
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };
}
