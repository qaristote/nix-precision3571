{ pkgs, config, ... }:

{
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services = {
    fcron = {
      enable = true;
      allow = [ "qaristote" ];
      systab = ''
        # Update the system.
        @daily root ${pkgs.nix}/bin/nix-channel --update; ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch
        # Update virtual environments
        @daily qaristote find /home/qaristote -type d -name .nix-gc-roots -execdir ${pkgs.direnv}/bin/direnv reload \;
      '';
    };
  };
}
