{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = let version = "105.0";
  in pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/arkenfox/user.js/${version}/user.js";
    sha256 = "sha256:4v5VcCj5h+pLZ7wt38AoWUQgg62qPGohWwmY6yNZZ/0=";
  };
}
