{ ... }:

{
  users.users.qaristote = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "audio"
      "networkmanager"
    ];
  };

  home-manager = {
    users.qaristote = import /home/qaristote/.config/nixpkgs;
    useGlobalPkgs = false;
    useUserPackages = true; # to enable fontconfig inside home-manager
  };
}
