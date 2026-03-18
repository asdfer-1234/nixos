{ lib, config, ... }:
with lib;
let
  cfg = config.my.vesktop;
in
{
  options.my.vesktop = {
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
        text = toJSON {
          firstLaunch = false;
        };
      };
    };
  };
}
