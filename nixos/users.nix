{config, ...}: {
  personal.user = {
    enable = true;
    name = "qaristote";
    homeManager.enable = true;
  };

  users.groups.plugdev.members = ["qaristote"];
  services.udev.extraRules = ''
    # members of plugdev can use adb on google pixel 6a
    SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4ee0", MODE="0666", GROUP="plugdev"
  '';

  home-manager.extraSpecialArgs.osConfig = config;
}
