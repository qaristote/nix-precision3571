{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/arkenfox/user.js/d6b26e75588bcd4311251c68912d3c77b8c6e996/user.js";
    sha256 = "DBsQ/Zy0Jd6eanOX6437/SufSVBMumqTq1ZFbIRGWGo=";
  };
}
