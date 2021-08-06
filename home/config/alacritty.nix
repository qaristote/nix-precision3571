{ config, ... }:

let
  user = config.home.username;
  host = config.networking.hostname;
in {
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        title = "${user}@{hostname}";

        padding = {
          x = 10;
          y = 10;
        };
        dimensions = {
          lines = 75;
          columns = 100;
        };
      };

      font = { size = 8.0; };
    };
  };
}
