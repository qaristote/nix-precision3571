{ pkgs }:

let
  fetch-gitignore = module: sha256:
    let url = "https://www.toptal.com/developers/gitignore/api/" + module;
    in pkgs.fetchurl { inherit url sha256; };
in {
  emacs = fetch-gitignore "emacs"
    "sha256:34LaJsGa5fFSMjE7l8JgQAmH8f07jcQmsaOdPVctHMk=";
  linux = fetch-gitignore "linux"
    "sha256:Az39kpxJ1pG0T+3KUwx217+f+L8FQEWzwvRFSty8cJU=";
  direnv = fetch-gitignore "direnv"
    "sha256:CK47JLrsjf9yyjGAUfhjxLns0r1jDYgSBsp6LN0Yut8=";
  fetcher = fetch-gitignore;
}
