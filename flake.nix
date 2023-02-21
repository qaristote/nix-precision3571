{
  inputs = {
    my-nixpkgs.url = "git+file:///home/qaristote/code/nix/my-nixpkgs";
  };

  outputs = { self, nixpkgs, my-nixpkgs, nixos-hardware, home-manager }:
    let
      system = "x86_64-linux";
      overlays-module = { ... }: {
        nixpkgs.overlays = [ my-nixpkgs.overlays.personal ];
      };
    in {
      nixosConfigurations.latitude-7490 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit nixos-hardware home-manager;
          home.qaristote = import ./home;
        };
        modules = [ overlays-module my-nixpkgs.nixosModules.personal ./nixos ];
      };
      homeConfigurations.qaristote = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}";
        modules = [ overlays-module ./home ];
      };
    };
}
