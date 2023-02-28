{ ... }:

{
  personal = {
    profiles = {
      dev = true;
      multimedia = true;
      social = true;
      syncing = true;
    };
  };

  programs.thunderbird.profiles.all.isDefault = true;
  accounts.email.accounts.personal.primary = true;
}
