{ lib, config, ... }:
with lib builtins;
let
  cfg = config.myModules.vesktop;
in
{
  options.myModules.vesktop = {
    enable = mkEnableOption "vesktop";
  };

  config = mkIf cfg.enable {
    programs.vesktop = {
      enable = true;
      settings = {
        discordBranch = "stable";
        minimizeToTray = false;
      };
    };
    xdg.configFile = {
      "vesktop/state.json" = {
        text = toJson {
          firstLaunch = false;
        };
      };
    };
  };
}
