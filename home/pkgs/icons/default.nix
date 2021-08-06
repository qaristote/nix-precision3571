{ pkgs }: {
  netflix = pkgs.fetchurl {
    url = "https://www.vectorlogo.zone/logos/netflix/netflix-icon.svg";
    sha256 = "0b4gqhw9y62fm72x61q03yzbllgfxpkjbbsdvj7d5wg3jshjkgdb";
  };
  mubi = pkgs.fetchurl {
    url = "https://mubi.com/logo";
    sha256 = "0fj6bafba9z8yirklr74b708pzmy8pjg68l1vx139ddnimh2d4n3";
  };
  deezer = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/edent/SuperTinyIcons/master/images/svg/deezer.svg";
    sha256 = "1qcj1gqz8gc9cwlj4cl6yj5ik1vz4ya6qcncr5fbciprzaaf3pg9";
  };
}
