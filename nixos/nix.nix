{ ... }:

{
  personal.nix = {
    enable = true;
    autoUpgrade = true;
    flake = "git+file:///etc/nixos";
    gc.enable = true;
  };

  system.autoUpgrade.flags =
    let update-input = input: [ "--update-input" input ];
    in update-input "latitude-7490/nixpkgs" ++ update-input "latitude-7490/home-manager" ++ update-input "latitude-7490/nixos-hardware" ++ update-input "latitude-7490/my-nixpkgs";

  # make auto-upgrade service lightweight
  systemd.services.nixos-upgrade.unitConfig = { CPUWeight = 1; };
}
