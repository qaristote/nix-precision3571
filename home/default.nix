{
  config,
  pkgs,
  ...
}: {
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

  programs = {
    bash.bashrcExtra = ''
      function screen (){
        echo -ne "\033]0;screen $@\a"
        sudo ${pkgs.screen}/bin/screen $@
      }
    '';

    # necessary because the hephaistos remote builder sets
    # nixremote as default ssh user
    ssh = {
      enable = true;
      matchBlocks."hephaistos.local" = {
        user = config.home.username;
        extraOptions.IdentitiesOnly = "no";
      };
    };
  };
}
