{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = let version = "109.0";
  in pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/arkenfox/user.js/${version}/user.js";
    sha256 = "sha256:+GJgFyfmFqbD3eepN9udJImT9H3Z9T+xnXPrHuSwIH4=";
  };
}
