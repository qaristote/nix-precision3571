{ config, pkgs, ... }:

{
  home.packages = with pkgs;
    [
      # Various
      evince
      gimp
      gnupg
      keepassxc
      moreutils
      pavucontrol
      transmission-gtk
      vlc
      zotero
    ] ++ [
      # Social
      signal-desktop
      thunderbird
    ] ++ [
      # Fonts
      material-design-icons
      roboto
      source-code-pro
    ] ++ [
      # Programming languages
      python3Minimal
    ] ++ (with texlive;
      [
        # Tex
        # Uncomment when full disk available
        # combined.scheme-full
      ]);

  home.wallpaper = ./dotfiles/background-image;

  programs.bash = {
    enable = true;
    shellAliases = {
      amimullvad = "curl -Ls https://am.i.mullvad.net/connected";
      nixos-update-config =
        "sudo cp -rf ~/documents/nix/latitude-7490/nixos/ /etc/";
      rm = "rm -f";
      ssh = "TERM=xterm-256color ssh";
      mkenv = ''
        cp ~/documents/nix/shells/shell.nix . ;
        echo "use_nix" >> .envrc ;
        direnv allow ;
        $EDITOR shell.nix ;
      '';
      fftmp = "firefox --profile $(mktemp -d)";
      edit = "$EDITOR";
    };
    sessionVariables = {
      CDPATH = "~";
      EDITOR = "emacsclient -c";
      BROWSER = "firefox";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  services.gpg-agent.enable = true;
}
