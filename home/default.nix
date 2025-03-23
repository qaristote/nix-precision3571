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

  stylix.targets.firefox.profileNames = ["default"];

  programs = {
    bash.bashrcExtra = ''
      function screen (){
        echo -ne "\033]0;screen $@\a"
        sudo ${pkgs.screen}/bin/screen $@
      }
    '';
  };
}
