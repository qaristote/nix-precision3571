{ ... }:

{
  personal = {
    profiles = {
      dev = true;
      multimedia = true;
      social = {
        enable = true;
        identities = {
          personal = true;
          work = true;
        };
      };
      syncing = true;
    };
  };

  accounts.email.accounts.personal.primary = true;
}
