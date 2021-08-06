{ pkgs, i3statusGo ? null }:

with pkgs;
with lib;
let useDefaultConfig = i3statusGo == null;
in buildGoModule rec {
  name = "barista";

  # src = fetchGit {
  #   url = ./src;
  #   rev = "2aa886091e455b2e213dd46d5405db0913759b03";
  # };

  src = fetchFromGitHub {
    owner = "soumya92";
    repo = "barista";
    rev = "82ee7b7bf4b928111af376e498458336b320b3b1";
    sha256 = "0f0igsci7i0chjrw01fhmsv24nk4s5rxmk31j6z9yq8l216wz67g";
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

  vendorSha256 = "1agvkrs2az65ldmlhwajxym36w14jnv9lyri413cw43iazhiv7r7";
}

