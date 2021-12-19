{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/arkenfox/user.js/7e1b92567ca2bb76ad358d0fc786fd60b3cf7970/user.js";
    sha256 = "1v2w51szrd2yjki9gdvzc488rqmrmyxn90g2vv1pwg121wklw30q";
  };
}
