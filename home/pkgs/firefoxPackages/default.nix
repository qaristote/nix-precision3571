{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/arkenfox/user.js/85438d00e457bff692303af519da618c6372476b/user.js";
    sha256 = "11hw11x3yl0pk5dhx1j1k6yi6i2yjd82pb5nz3jsafa04hl1jpr2";
  };
}
