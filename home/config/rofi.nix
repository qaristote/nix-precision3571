{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    cycle = true;
    theme = ./dotfiles/rofi.rasi;
  };
}
