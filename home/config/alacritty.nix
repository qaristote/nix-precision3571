{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
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
