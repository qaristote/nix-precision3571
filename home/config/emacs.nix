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
  home.file.".emacs.d/private/layers/why3/local/why3".source =
    "${pkgs.why3}/share/emacs/site-lisp";
}
