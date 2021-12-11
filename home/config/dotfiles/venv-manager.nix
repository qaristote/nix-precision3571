{ lib, ... }:

{
  direnv.enable = lib.mkDefault true;

  latex.latexmk = {
    enable = lib.mkDefault true;
    output.pdf.enable = lib.mkDefault true;
    rc = lib.optional (lib.pathExists ~/.config/latexmkrc) ~/.config/latexmkrc;
  };

  nix.enable = lib.mkDefault true;

  ocaml.tuareg.enable = lib.mkDefault true;

  why3 = {
    defaultEditor = "emacsclient -c";
    extraConfig = ''
      [prover]
      editor = ""
      name = "Coq"
      version = "8.13.2"
    '';
  };
}
