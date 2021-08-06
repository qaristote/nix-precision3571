{ config, lib, ... }:

with lib;
let wallpaper = config.home.wallpaper;
in {
  options.home.wallpaper = mkOption {
    type = types.nullOr types.path;
    default = null;
    description = ''
      Path to the desktop wallpaper.
    '';
    example =
      literalExample "${config.home.homeDirectory}/images/wallpaper.jpg";
  };

  # config.home.file.".background-image".source = mkIf (wallpaper != null) wallpaper;
}
