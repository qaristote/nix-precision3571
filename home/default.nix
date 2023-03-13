{ ... }:

{
  personal = {
    profiles = {
      dev = true;
      social = true;
      syncing = true;
    };
    identities = {
      work = true;
    };
  };

  accounts.email.accounts.work.primary = true;
}
