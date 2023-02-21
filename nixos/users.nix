{ home-manager, homeModules, ... }:

{
  imports = [ home-manager.nixosModules.home-manager ];

  personal.user = {
    enable = true;
    name = "qaristote";
  };

  home-manager = {
    users.qaristote = { ... }: { imports = homeModules; };
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
