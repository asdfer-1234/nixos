{ lib, config, ... }:
with lib;
with builtins;
let
  cfg = config.my.vesktop;
in
mkEnableModule config /my/vesktop {
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
}
