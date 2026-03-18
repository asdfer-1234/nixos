{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.kanata;
in
{
  options.my.kanata = {
    enable = lib.mkEnableOption "kanata";
    cmd = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    config = lib.mkOption {
      type = lib.types.str;
      description = "Default config string to be placed in kanata's default config directory";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkMerge [
      (lib.mkIf (!cfg.cmd) [ pkgs.kanata ])
      (lib.mkIf cfg.cmd [ pkgs.kanata-with-cmd ])
    ];
    xdg.configFile = {
      "kanata/kanata.kbd" = {
        text = cfg.config;
        force = true;
      };
    };
  };
}
