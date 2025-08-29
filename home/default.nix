{pkgs, ...}: {
  personal = {
    profiles = {
      dev = true;
      multimedia = true;
      social = true;
      syncing = true;
    };
    identities = {
      personal = true;
      work = true;
    };
  };

  accounts.email.accounts.personal.primary = true;

  personal.x.i3.devices = {
    wifi = "wlp0s20f3";
    eth = "enp0s31f6";
  };

  programs = {
    bash.bashrcExtra = ''
      function screen (){
        echo -ne "\033]0;screen $@\a"
        sudo ${pkgs.screen}/bin/screen $@
      }
    '';
  };
}
