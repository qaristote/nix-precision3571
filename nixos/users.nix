{ config, lib, ... }:

let cfg = config.users.users;
in {
  users.users.qaristote = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "audio"
      "networkmanager"
      "docker"
    ];
  };

  home-manager = {
    users.qaristote = (import (/home/qaristote/.config/nixpkgs));
    useGlobalPkgs = false;
    useUserPackages = true; # to enable fontconfig inside home-manager
  };
}
