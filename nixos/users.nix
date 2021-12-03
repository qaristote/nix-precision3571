{ config, ... }:

let cfg = config.users.users;
in {
  users.users.qaristote = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "audio"
      "networkmanager"
    ];
  };

  home-manager = {
    users.qaristote = import (cfg.qaristote.home + /.config/nixpkgs);
    useGlobalPkgs = false;
    useUserPackages = true; # to enable fontconfig inside home-manager
  };
}
