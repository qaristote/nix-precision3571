{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/arkenfox/user.js/c6ab6c4b4895d533c872085ebb6f3b6c78627d80/user.js";
    sha256 = "sha256-6oZYIL0HMix/CagZUgePcJU9r1Yz0BWsumEbUwkkwDs=";
  };
}
