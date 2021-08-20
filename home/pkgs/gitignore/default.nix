{ pkgs }:

let fetch-gitignore = module: sha256:
      let url =  "https://www.toptal.com/developers/gitignore/api/" + module;
      in pkgs.fetchurl { inherit url sha256; };
in {
  emacs = fetch-gitignore "emacs" sha256:1lswj6cna6y67i9siyr3rsa6z4ky42s9pv8zrji33swdlb8xmzxf;
  linux = fetch-gitignore "linux" sha256:16f8gr0glc1ai6flm310kv5sfhil6sjh4qr4k1914da1bhhib390;
  direnv = fetch-gitignore "direnv" sha256:1cwnav4zfd8z078j4s4z1avk23az6d463ysk6jpqmsplz3bq6hyq;
  fetcher = fetch-gitignore;
}
