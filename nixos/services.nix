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
        @daily root sudo ${pkgs.nix}/bin/nix-channel --update; sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch
      '';
    };
  };
}
