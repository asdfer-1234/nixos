{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myModules.niri;
in
{
  options.myModules.niri = {
    enable = lib.mkEnableOption;
    config = lib.mkOption { type = lib.types.str; };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "niri/" = {
        text = cfg.config;
        force = true;
      };
    };
    home.packages = [
      pkgs.niri
    ];
  };
}
