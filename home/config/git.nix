{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Quentin Aristote";
    userEmail = "quentin@aristote.fr";

    ignores = (builtins.map builtins.readFile
      (with pkgs.personal.gitignore; [ emacs linux direnv ])) ++ [
        ### Personal rules ###
        "shell.nix"
        ".nix-gc-roots"
      ];
  };
}
