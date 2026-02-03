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

    extraPackages = lib.mkOption {
      type = lib.listOf lib.types.package;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkMerge [
      [
        pkgs.quickshell
      ]
      cfg.extraPackages
    ];
    xdg.configFile = {
      "quickshell" = {
        source = cfg.configDirectory;
        force = true;
      };
    };
  };
}
