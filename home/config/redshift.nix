{ ... }:

{
  services.redshift = {
    enable = true;
    tray = true;
    temperature = {
      day = 2500;
      night = 2500;
    };
    latitude = "48.856614";
    longitude = "2.3522219";
    settings = { redshift = { transition = 0; }; };
  };
}
