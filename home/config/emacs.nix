{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs.overrideAttrs (oldAttrs: rec { nativeComp = true; });
  };
  services.emacs = {
    enable = true;
    client.enable = true;
  };

  home.file.".spacemacs.d/init.el".source = ./dotfiles/spacemacs;
}
