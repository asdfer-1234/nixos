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
    enable = lib.mkEnableOption "niri!";
    config = lib.mkOption { type = lib.types.str; };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "niri/config.kdl" = {
        text = cfg.config;
        force = true;
      };
    };
    home.packages = [
      pkgs.niri
    ];
  };
}
