{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/arkenfox/user.js/eb4363dc180666554ca81a7909156e0893e80c3b/user.js";
    sha256 = sha256:00sn8imlv659b3zn2i0cs0pqm2zra93dfh9rhashlcj0kamq67f6;
  };
}
