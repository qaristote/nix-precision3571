{ pkgs, i3statusGo ? null }:

with pkgs;
with lib;
let useDefaultConfig = i3statusGo == null;
in buildGoModule rec {
  name = "barista";

  src = fetchFromGitHub {
    owner = "soumya92";
    repo = "barista";
    rev = "c8725f1d8765e36869eb54272f29c770ce1f2f67";
    sha256 = "19nvwrr8baf8k0pp7ph07hmjcrxm7kv5j4f2rsfa8m7hgcyarjp4";
  };

  patchPhase = ''
    mkdir main
  '' + (if useDefaultConfig then # use samples/i3status/i3status.go as config
  ''
    mv samples/i3status/i3status.go main/i3status.go
  '' else # import config and patch font loading
  ''
    cp "${i3statusGo}" main/i3status.go
    sed -i '0,\|fontawesome.Load()|s||fontawesome.Load("${pkgs.personal.fontMetadata.fontawesome}")|' main/i3status.go
    sed -i '0,\|mdi.Load()|s||mdi.Load("${pkgs.personal.fontMetadata.material-design-icons}")|' main/i3status.go
  '') + # patch call to iwgetid
    ''
      sed -i '0,\|/sbin/iwgetid|s||${pkgs.wirelesstools}/bin/iwgetid|' modules/wlan/wlan.go
    '';

  subPackages = [ "main/i3status.go" ];

  vendorSha256 = "1q8bmgv7aac29yvpvgh6hi4c33ydj7f54l7xn7jg2sjbac4f8kbk";
}

