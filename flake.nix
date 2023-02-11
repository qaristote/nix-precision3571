{
  inputs = {
    my-nixpkgs = "git+file:///home/qaristote/code/nix/my-nixpkgs";
  };
  outputs = { self, nixpkgs }: {
    nixosConfigurations.latitude-7490 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./nixos/configuration.nix ];
    };
  };
}
