{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.rice.asdfrice.kanata = {
    enable = lib.mkEnableOption "kanata";
  };

  config = lib.mkIf config.rice.asdfrice.kanata.enable {

    home.packages = [
      pkgs.kanata
    ];
    xdg.configFile = {
      "kanata/kanata.kbd" = {
        source = ./kanata.kbd;
        force = true;
      };
    };
  };
}
