{
  inputs = {
    my-nixpkgs.url = "github:qaristote/my-nixpkgs";
  };

  outputs = { self, nixpkgs, my-nixpkgs, nixos-hardware, home-manager }:
    let
      system = "x86_64-linux";
      overlays-module = { ... }: {
        nixpkgs.overlays = [ my-nixpkgs.overlays.personal ];
      };
      homeModules = [ my-nixpkgs.homeModules.personal ./home ];
      nixosModules =
        [ overlays-module my-nixpkgs.nixosModules.personal ./nixos ];
    in {
      nixosConfigurations.latitude-7490 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit nixos-hardware home-manager homeModules; };
        modules = nixosModules;
      };

      homeConfigurations.qaristote = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}";
        modules = homeModules;
      };
    };
}
