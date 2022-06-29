{ pkgs }:

let pkgs-rycee = pkgs.nur.repos.rycee;
in {
  addons = import ./addons.nix {
    inherit (pkgs) fetchurl stdenv lib;
    inherit (pkgs-rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  arkenfox-userjs = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/arkenfox/user.js/1a899966a911dc2b69a808095ac7836bef5e214b/user.js";
    sha256 = "sha256:Du1ia7BGeonko3BAwHuIvVsMr3vTc0jBoa6i9VqiYdU=";
  };
}
