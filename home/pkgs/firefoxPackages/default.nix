{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/arkenfox/user.js/ceacc9dd74086478d43ccf3a4f0bd5befda53a43/user.js";
    sha256 = "sha256:1Gkv8YcFvutNNa/eFQbe+RTSFatTE6uGlfPtzOIPtQI=";
  };
}
