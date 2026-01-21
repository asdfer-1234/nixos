{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myModules.quickshell;
in

{
  options.myModules.quickshell = {
    enable = lib.mkEnableOption "kanata";
    configDirectory = lib.mkOption {
      type = lib.types.pathInStore;
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.kanata
    ];
    xdg.configFile = {
      "quickshell" = {
        target = cfg.configDirectory;
        force = true;
      };
    };
  };
}
