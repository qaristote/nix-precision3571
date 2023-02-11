{ ... }:

{
  personal.nix = {
    enable = true;
    autoUpgrade = true;
    flake = "git+file:///home/qaristote/code/nix/machines/latitude-7490";
    gc.enable = true;
  };

  system.autoUpgrade.flags =
    let update-input = input: [ "--update-input" input ];
    in update-input "home-manager" ++ update-input "nixos-hardware"
    ++ [ "--impure" ];

  # make auto-upgrade service lightweight
  systemd.services.nixos-upgrade.unitConfig = { CPUWeight = 1; };
}
