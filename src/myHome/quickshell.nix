{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.quickshell;
in

{
  options.my.quickshell = {
    enable = lib.mkEnableOption "kanata";
    configDirectory = lib.mkOption {
      type = lib.types.pathInStore;
    };

    extraPackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkMerge [
      [ pkgs.quickshell ]
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
