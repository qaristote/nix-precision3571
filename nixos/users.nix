{ home, home-manager, ... }:

{
  imports = [ home-manager.nixosModules.home-manager ];

  personal.user = {
    enable = true;
    name = "qaristote";
  };

  home-manager = {
    users.qaristote = home.qaristote;
    useGlobalPkgs = false;
    useUserPackages = true;
  };
}
