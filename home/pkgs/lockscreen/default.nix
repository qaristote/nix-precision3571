{ pkgs, backgroundImage ? null, resolution ? "1920x1080" }:

let useBackgroundImage = backgroundImage != null;
in pkgs.runCommand "lockscreen" {
  buildInputs = with pkgs;
    [
      # xorg.xdpyinfo
    ];
  envVariable = true;
} (''
  mkdir -p $out/{bin,share}
'' + (if useBackgroundImage then ''
  ${pkgs.imagemagick}/bin/convert ${backgroundImage} -resize ${resolution} -blur 0x5 RGB:$out/share/lockscreen.png
'' else
  "") + ''
        echo > $out/bin/lockscreen.sh \
    	  "export PATH=$PATH
        ${pkgs.i3lock-color}/bin/i3lock-color \\
        '' + (if useBackgroundImage then ''
      --raw ${resolution}:rgb \\
      --image $out/share/lockscreen.png \\
    '' else
      "") + ''
        --no-unlock-indicator \\
        --composite \\
        --clock \\
        --ignore-empty-password \\
        --time-color=FFFFFFFF \\
        --date-color=00000000 \\
        --time-size=100"
      '' + (if useBackgroundImage then ''
        chmod 444 $out/share/lockscreen.png
      '' else
        "") + ''
          chmod 555 $out/bin/lockscreen.sh
          chmod 555 $out/{bin,share}
        '')
