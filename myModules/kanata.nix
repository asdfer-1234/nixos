{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myModules.kanata;
in
{
  options.myModules.kanata = {
    enable = lib.mkEnableOption "kanata";
    config = lib.mkOption {
      type = lib.types.str;
      description = "Default config string to be placed in kanata's default config directory";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kanata
    ];
    xdg.configFile = {
      "kanata/kanata.kbd" = {
        text = cfg.config;
        force = true;
      };
    };
  };
}
